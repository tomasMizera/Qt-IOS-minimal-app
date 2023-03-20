/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "iosinterface.h"
#include "qdebug.h"

IosInterface::IosInterface(QObject *parent)
  : QObject{parent}
{

}

void IosInterface::callPermissionsCheck()
{
  qDebug() << "Permissions check!";

#ifdef Q_OS_IOS
  callPermissionsCheckDirectAlt( this );
#endif
}

void IosInterface::fromWithin()
{
  qDebug() << "From within!";
}

void IosInterface::fromWithinUpdate(NSString *location)
{
#ifdef Q_OS_IOS

  qDebug() << "Position update" << QString::fromNSString( location );
#endif
}
