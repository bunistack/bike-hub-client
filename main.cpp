#include <QApplication>
#include <FelgoApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "networkmanager.h"
#include "api.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication::setOrganizationName("BikeHub");
    QCoreApplication::setOrganizationDomain("bikehub.co");
    QCoreApplication::setApplicationName("BikeHub");

    QApplication app(argc, argv);
    FelgoApplication felgo;

    // Use platform-specific fonts instead of Felgo's default font
    felgo.setPreservePlatformFonts(true);

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    //network
    NetworkManager *networkManager = new NetworkManager(&engine);

    //api
    API *api = new API(&engine,networkManager);

    //register singletons
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/AppUtil.qml"), "AppUtil",1,0,"AppUtil");
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/SVG.qml"), "SVG",1,0,"SVG");

    //register context types
    engine.rootContext()->setContextProperty("API",api);
    engine.rootContext()->setContextProperty("NetworkManager",networkManager);

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
