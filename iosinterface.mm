/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#include "iosinterface.h"
#include "ioslocationimpl.h"
#include "ioslocationbgndservice.h"

#include "qdebug.h"

void IosInterface::callPermissionsCheckDirectAlt( IosInterface *me )
{
  qDebug() << "Before callPermissionsCheckDirect";

  NSString *str = @"Output from Objc: ";

  if ( m_impl_alt == nullptr ) {

    @try {
      IosLocationBgndService *impl = [[IosLocationBgndService alloc] initWithObserver: this];
      m_impl_alt = impl;

      qDebug() << "Info: built impl object";
    }
    @catch (NSException *e) {
      NSString *message = [NSString stringWithFormat:@"%@ %@", e.name, e.reason];

      qDebug() << "Fatal: unable to initialize location obj-c backend" << QString::fromNSString( message );
    }
  }

  @try {
    str = [m_impl_alt setup];
  }
  @catch (NSException *e) {
    NSString *message = [NSString stringWithFormat:@"%@ %@", e.name, e.reason];

    qDebug() << "Fatal: unable to call setup" << QString::fromNSString( message );
  }

  qDebug() << "After callPermissionsCheckDirect, response:" << QString::fromNSString( str );
}

void IosInterface::callPermissionsCheckDirect( IosInterface *me )
{
  qDebug() << "Before callPermissionsCheckDirect";

  NSString *str = @"Output from Objc: ";

  if ( m_impl == nullptr ) {

    @try {
      IOSLocationImpl *impl = [[IOSLocationImpl alloc] init];
      m_impl = impl;

      qDebug() << "Info: built impl object";
    }
    @catch (NSException *e) {
      NSString *message = [NSString stringWithFormat:@"%@ %@", e.name, e.reason];

      qDebug() << "Fatal: unable to initialize location obj-c backend" << QString::fromNSString( message );
    }
  }

  @try {
    str = [m_impl setup:this];
  }
  @catch (NSException *e) {
    NSString *message = [NSString stringWithFormat:@"%@ %@", e.name, e.reason];

    qDebug() << "Fatal: unable to call setup" << QString::fromNSString( message );
  }

  qDebug() << "After callPermissionsCheckDirect, response:" << QString::fromNSString( str );
}

