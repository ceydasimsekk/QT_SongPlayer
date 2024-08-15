 #include <QGuiApplication>
#include <QIcon>
#include <QQmlApplicationEngine>
#include "AudioInfo.h"
#include "PlayerController.h"


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    app.setWindowIcon(QIcon("C:/Users/ceyda/OneDrive/Belgeler/ScytheStudio/SongPlayer/assets/icons/app_icon.ico"));

    /*QDirIterator qrc(":", QDirIterator::Subdirectories);
    while(qrc.hasNext())
        qDebug() << qrc.next();*/

    QQmlApplicationEngine engine;
    PlayerController *playerController=new PlayerController(&app);
    AudioInfo *audioInfo = new AudioInfo();
    qmlRegisterSingletonInstance("com.company.PlayerController",1,0,"PlayerController",playerController);



    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("SongPlayer", "Main");

  /*  const QUrl url(u"qrc:/SongPlayer/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);
    engine.load(url);*/

    return app.exec();
}
