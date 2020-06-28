#ifndef NETWORKMANAGER_H
#define NETWORKMANAGER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QNetworkCookieJar>

class NetworkManager : public QObject
{
    Q_OBJECT
public:
    explicit NetworkManager(QObject *parent = nullptr);

    QString getNetworkErrorString(QNetworkReply::NetworkError networkError);

    Q_INVOKABLE QString getServerAPIUrl();
    
    QNetworkAccessManager *getNetworkAccessManager();   

signals:

public slots:

private slots:
    void initializeNetworkUrls();

private:

    QNetworkAccessManager *networkAccessManager;

    QString serverAPIUrl;
};

#endif // NETWORKMANAGER_H
