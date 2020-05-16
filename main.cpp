#include <QApplication>
#include <FelgoApplication>

#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    FelgoApplication felgo;

    // Use platform-specific fonts instead of Felgo's default font
    felgo.setPreservePlatformFonts(true);

    QQmlApplicationEngine engine;
    felgo.initialize(&engine);

    //register singletons
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/AppUtil.qml"), "AppUtil",1,0,"AppUtil");
    qmlRegisterSingletonType(QUrl("qrc:/qml/singletons/SVG.qml"), "SVG",1,0,"SVG");

    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    return app.exec();
}
