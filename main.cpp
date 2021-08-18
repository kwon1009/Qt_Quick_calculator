#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "connector.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine("qrc:/main.qml");
    Connector* con = new Connector(&engine);
    return app.exec();;
}
