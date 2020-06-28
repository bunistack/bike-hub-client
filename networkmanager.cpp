#include "networkmanager.h"
#include <QJsonObject>
#include <QJsonDocument>

NetworkManager::NetworkManager(QObject *parent) : QObject(parent)
{
    networkAccessManager = new QNetworkAccessManager(this);
    networkAccessManager->setCookieJar(new QNetworkCookieJar(networkAccessManager));

    serverAPIUrl = "http://localhost/GitHub/chamadesk-hive/api/";
}

/*
 * gets the application server's API url
*/
QString NetworkManager::getServerAPIUrl()
{
    return serverAPIUrl;
}

/*
 * returns networkAccessManager
*/
QNetworkAccessManager *NetworkManager::getNetworkAccessManager()
{
    return networkAccessManager;
}

QString NetworkManager::getNetworkErrorString(QNetworkReply::NetworkError networkError)
{
    QString errorString;

    switch(networkError){
    case QNetworkReply::ConnectionRefusedError:
        errorString = "Server refused connection";
        break;
    case QNetworkReply::RemoteHostClosedError:
        errorString = "Server closed the connection unexpectedly";
        break;
    case QNetworkReply::HostNotFoundError:
        errorString = "Remote host name not found";
        break;
    case QNetworkReply::TimeoutError:
        errorString = "Connection timed out";
        break;
    case QNetworkReply::OperationCanceledError:
        errorString = "Operation canceled";
        break;
    case QNetworkReply::SslHandshakeFailedError:
        errorString = "SSL/TLS error";
        break;
    case QNetworkReply::TemporaryNetworkFailureError:
        errorString = "Temporary network connection failure";
        break;
    case QNetworkReply::NetworkSessionFailedError:
        errorString = "Connection could not be established";
        break;
    case QNetworkReply::BackgroundRequestNotAllowedError:
        errorString = "Background connection not allowed";
        break;
    case QNetworkReply::TooManyRedirectsError:
        errorString = "Too many redirects";
        break;
    case QNetworkReply::InsecureRedirectError:
        errorString = "Insecure redirect";
        break;
    case QNetworkReply::ProxyConnectionRefusedError:
        errorString = "Proxy server connection was refused";
        break;
    case QNetworkReply::ProxyConnectionClosedError:
        errorString = "Proxy server closed the connection unexpectedly";
        break;
    case QNetworkReply::ProxyNotFoundError:
        errorString = "Proxy host name not found";
        break;
    case QNetworkReply::ProxyTimeoutError:
        errorString = "Proxy connection timed out";
        break;
    case QNetworkReply::ProxyAuthenticationRequiredError:
        errorString = "Proxy authentication required";
        break;
    case QNetworkReply::ContentAccessDenied:
        errorString = "Access to remote content denied";
        break;
    case QNetworkReply::ContentOperationNotPermittedError:
        errorString = "Operation on remote content not allowed";
        break;
    case QNetworkReply::ContentNotFoundError:
        errorString = "Remote content not found";
        break;
    case QNetworkReply::AuthenticationRequiredError:
        errorString = "Authentication required";
        break;
    case QNetworkReply::ContentReSendError:
        errorString = "Content resend error";
        break;
    case QNetworkReply::ContentConflictError:
        errorString = "Content conflict error";
        break;
    case QNetworkReply::ContentGoneError:
        errorString = "Requested content is no longer available";
        break;
    case QNetworkReply::InternalServerError:
        errorString = "Internal server error";
        break;
    case QNetworkReply::OperationNotImplementedError:
        errorString = "Functionality not supported";
        break;
    case QNetworkReply::ServiceUnavailableError:
        errorString = "Server unable to handle the request at the moment";
        break;
    case QNetworkReply::ProtocolUnknownError:
        errorString = "Unknown protocol";
        break;
    case QNetworkReply::ProtocolInvalidOperationError:
        errorString = "Invalid protocol operation";
        break;
    case QNetworkReply::UnknownNetworkError:
        errorString = "Unknown network error";
        break;
    case QNetworkReply::UnknownProxyError:
        errorString = "Unknown proxy error";
        break;
    case QNetworkReply::UnknownContentError:
        errorString = "Unknown content error";
        break;
    case QNetworkReply::ProtocolFailure:
        errorString = "Protocol failure";
        break;
    case QNetworkReply::UnknownServerError:
        errorString = "Unknown server error";
        break;
    default:
        errorString = "Unknown error";
        break;
    }

    return errorString;
}
