#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QColor>
#include <QDebug>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    QObject* root = nullptr;
    QList<QObject*> rootObjects = engine.rootObjects();

    for (int i = 0; i < rootObjects.size(); i++)
    {
        qDebug() << rootObjects[i]->objectName();
        if(rootObjects[i]->objectName() == "mainWindow")
        {
            root = rootObjects[i];
            root->setProperty("color", QColor::fromRgb(255,0,0));
            for(auto c : root->children())
            {
                if(c->objectName()=="textLabel")
                {
                    c->setProperty("color", QColor::fromRgb(2,255,0));
                }
            }
        }
    }

    return app.exec();
}
