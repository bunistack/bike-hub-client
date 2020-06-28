#include <QJsonDocument>
#include <QJsonObject>

#include "api.h"

API::API(QObject *parent, NetworkManager *manager) : QObject(parent)
{      
    networkManager = manager;
    connect(networkManager->getNetworkAccessManager(),SIGNAL(finished(QNetworkReply*)),this,SLOT(handleReply(QNetworkReply*)));
}

/*
 * sends a post request to the API
*/
void API::post(QString json)
{
    //get the request id
    QJsonObject obj = QJsonDocument::fromJson(json.toUtf8()).object();
    QString requestID = obj["id"].toString();

    QNetworkRequest request;

    request.setUrl(QUrl(networkManager->getServerAPIUrl()));

    request.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("application/json"));
    request.setRawHeader(QByteArray("Request-Id"), QByteArray(requestID.toUtf8()));

    QByteArray data;
    data.append(json.toUtf8());

    qDebug() << "\nPosting: " << data;    

    networkManager->getNetworkAccessManager()->post(request,data);
}

/*
 * handles network replies
*/
void API::handleReply(QNetworkReply *reply)
{
    QNetworkRequest request = reply->request();

    QString requestID;

    if(request.hasRawHeader(QByteArray("Request-Id"))){
        requestID = reply->request().rawHeader(QByteArray("Request-Id"));
    } else {
        requestID = "";
    }

    if(reply->error()){
        qDebug() << "Error (api): " << reply->errorString();
        QString errorString = networkManager->getNetworkErrorString(reply->error());
        emit replyReady(requestID,API::respond("NET_ERROR",errorString));
        reply->deleteLater();
        return;
    }

    QVariant header = reply->header(QNetworkRequest::ContentTypeHeader);

    if(header.toString() != "application/json"){
        std::string std_string = reply->readAll().toStdString();
        QString response = QString::fromStdString(std_string);
        qDebug() << "\n" << "non-json Reply: " << response;
        return;
    }

    std::string std_string = reply->readAll().toStdString();
    QString response = QString::fromStdString(std_string);
    qDebug() << "\n" << "Reply: " << response;

    emit replyReady(requestID,response);

    reply->deleteLater();
}

/*
 * creates a JSONRPC formatted response for QML
*/
QString API::respond(QString status, QString message, QString data)
{
    QJsonObject result;
    result.insert("status", status);
    result.insert("message", message);
    result.insert("data", data);

    QJsonObject jsonrpc;
    jsonrpc.insert("jsonrpc","2.0");
    jsonrpc.insert("result",result);
    jsonrpc.insert("id","1");

    QJsonDocument jsonDoc(jsonrpc);

    QString jsonText = QString::fromStdString(jsonDoc.toJson().toStdString());

    return jsonText;
}
