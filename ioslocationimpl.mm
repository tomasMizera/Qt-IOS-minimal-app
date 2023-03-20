#import <CoreFoundation/CoreFoundation.h>
#import <CoreLocation/CoreLocation.h>

//#import <UserNotifications/UNNotificationRequest.h>
//#import <UserNotifications/UNNotificationTrigger.h>
//#import <UserNotifications/UserNotifications.h>

#import "ioslocationimpl.h"

@implementation IOSLocationImpl

-( NSString* ) setup:( IosInterface * )handler
{
  NSString *response = nil;
  if ( handler != nil ) {
    handler->fromWithin();

    response = @"Success";
  }
  else {
    response = @"Error, null in handler!";
  }

  return response;
}

@end
