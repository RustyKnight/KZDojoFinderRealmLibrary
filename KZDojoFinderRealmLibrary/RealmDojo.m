//
//  RealmDojo.m
//  DojoFinder
//
//  Created by Shane Whitehead on 4/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

@import MapKit;
#import "RealmDojo.h"

@implementation RealmDojo

@synthesize address;
@synthesize name;
@synthesize region;

-(void)picture:(void (^)(UIImage *))callBack {
	
	dispatch_async(dispatch_get_main_queue(), ^{
		callBack(nil);
	});
	
}

-(CLLocation *)location {
	return [[CLLocation alloc] initWithLatitude:self.latitude longitude:self.longitude];
}
@end
