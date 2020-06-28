#ifndef API_H
#define API_H

#include <QObject>

#include "networkmanager.h"

class API : public QObject
{
    Q_OBJECT
public:
    explicit API(QObject *parent = nullptr, NetworkManager *networkManager = nullptr);

    Q_INVOKABLE void post(QString json);

    //creates a JSON formatted response to be send back to QML
    static QString respond(QString status, QString message, QString data = "");

signals:
    void replyReady(QString requestID, QString reply);

public slots:
    void handleReply(QNetworkReply *reply);

private:
    NetworkManager *networkManager;
};

#endif // API_H
