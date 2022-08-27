#include <QGuiApplication>
#include <QApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QtQuickControls2>
#include "serialport.h"


int main(int argc, char *argv[])
{
    if (qEnvironmentVariableIsEmpty("QTGLESSTREAM_DISPLAY")) {
        qputenv("QT_QPA_EGLFS_PHYSICAL_WIDTH", QByteArray("213"));
        qputenv("QT_QPA_EGLFS_PHYSICAL_HEIGHT", QByteArray("120"));

#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
        QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    }
    QApplication  app(argc, argv);

    SerialPort mSerialport;

    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("SerialPort",&mSerialport);

    QQuickStyle::setStyle("Material");  

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
        &app, [url](QObject *obj, const QUrl &objUrl) {
            if (!obj && url == objUrl)
                QCoreApplication::exit(-1);
        }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
