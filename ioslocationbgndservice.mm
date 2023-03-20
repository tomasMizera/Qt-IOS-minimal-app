
#import "ioslocationbgndservice.h"

@implementation IosLocationBgndService

-( id )initWithObserver:(IosInterface *)iosObserver
{
  if ( ( self = [ super init ] ) )
  {
    observer = iosObserver;
  }
  return self;
}

-(NSString *) setup
{
  NSString *response = nil;

  CLLocationManager *manager = [[ CLLocationManager alloc ] init ];

  if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
    [manager requestWhenInUseAuthorization];
    response = @"Info: Requested authorization!";
  }
  else {
    response = @"Info: Did not request authorization, other state";
  }

  manager.delegate = self;
  [manager requestLocation];

  response = [response stringByAppendingString:@"Requested location"];

  return response;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *location = [locations lastObject];

    NSString *response = [NSString stringWithFormat:@"%f %f", location.coordinate.latitude, location.coordinate.longitude];

    observer->fromWithinUpdate( response );
    // Do something with the location data

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
  NSString *response = [NSString stringWithFormat:@"%@ %@", @"Fatal:", error.localizedDescription];

  observer->fromWithinUpdate( response );
}

@end
