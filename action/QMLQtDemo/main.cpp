#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>
#include "colorMaker.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<ColorMaker>("lesliefish.qml.ColorMaker", 1, 0, "ColorMaker");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
