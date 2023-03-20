/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include <qglobal.h>
#if QT_VERSION >= 0x050000
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#else
#endif

#include "iosinterface.h"

int main(int argc, char *argv[])
{
  QGuiApplication app(argc, argv);

  QQmlApplicationEngine engine;

  qmlRegisterType<IosInterface>( "my_lib", 1, 0, "IosInterface" );

  const QUrl url(u"qrc:/dummy-qt-ios-app/main.qml"_qs);
  QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                   &app, [url](QObject *obj, const QUrl &objUrl) {
    if (!obj && url == objUrl)
      QCoreApplication::exit(-1);
  }, Qt::QueuedConnection);
  engine.load(url);

  return app.exec();
}
