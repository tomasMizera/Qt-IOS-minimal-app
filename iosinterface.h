/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef IOSINTERFACE_H
#define IOSINTERFACE_H

#include <QObject>
#include <qglobal.h>

Q_FORWARD_DECLARE_OBJC_CLASS( IOSLocationImpl );
Q_FORWARD_DECLARE_OBJC_CLASS( IosLocationBgndService );

class IosInterface : public QObject
{
    Q_OBJECT
  public:
    explicit IosInterface(QObject *parent = nullptr);

    Q_INVOKABLE void callPermissionsCheck();

    void fromWithin();
    void fromWithinUpdate( NSString *location );

  signals:

  private:

    void callPermissionsCheckDirect( IosInterface *me );
    void callPermissionsCheckDirectAlt( IosInterface *me );

    IOSLocationImpl *m_impl = nullptr; // owned
    IosLocationBgndService *m_impl_alt = nullptr; // owned

};

#endif // IOSINTERFACE_H
