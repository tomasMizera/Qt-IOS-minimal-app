/***************************************************************************
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 ***************************************************************************/

#ifndef IOSLOCATIONBGNDSERVICE_H
#define IOSLOCATIONBGNDSERVICE_H

#import <CoreFoundation/CoreFoundation.h>
#import <CoreLocation/CoreLocation.h>

#import "iosinterface.h"

@interface IosLocationBgndService: NSObject<CLLocationManagerDelegate>
{
  IosInterface *observer;
  CLLocationManager *manager;
}

-(id)initWithObserver:(IosInterface *)iosObserver;
-(NSString *)setup;

@end

#endif // IOSLOCATIONBGNDSERVICE_H
