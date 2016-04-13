//
//  RealmDojoFactory.m
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//
@import MapKit;
#import <Realm/Realm.h>
#import <RealmDojo.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>

static dispatch_queue_t backgroundQueue;

@implementation DojoFactory

+(NSArray*)dojosNear:(CLLocation*)location withinKilometers:(double)range {
	
	MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(location.coordinate, range * 1000, range * 1000);
	
	CLLocationCoordinate2D start = CLLocationCoordinate2DMake(region.center.latitude + (region.span.latitudeDelta / 2.0),
																														region.center.longitude - (region.span.longitudeDelta / 2.0));
	CLLocationCoordinate2D end = CLLocationCoordinate2DMake(region.center.latitude - (region.span.latitudeDelta / 2.0),
																													region.center.longitude + (region.span.longitudeDelta / 2.0));
	
	NSLog(@"Dojos within %fx%f - %fx%f", start.latitude, end.latitude, start.longitude, end.longitude);
	
	NSPredicate* predict = [NSPredicate predicateWithFormat:@"latitude < %f AND latitude > %f AND longitude > %f AND longitude < %f", start.latitude, end.latitude, start.longitude, end.longitude];
	
	//	RLMRealm *realm = [RLMRealm defaultRealm];
	RLMResults* results = [RealmDojo objectsWithPredicate:predict];
	
	// NSFastEnumeration is about the only interface between NSArray and RLMResults
	// which is kind of annoying, understandable, but annoying. I'm not overly opposed
	// to changing the return type to NSFastEnumeration, but I'd have to do some more research
	return (NSArray*)results;
	
}

//NSArray *RLMResultsToNSArray(RLMResults *results) {
//	NSMutableArray *array = [NSMutableArray arrayWithCapacity:results.count];
//	for (RLMObject *object in results) {
//		[array addObject:object];
//	}
//	return array;
//}

+(void)dojosNearInBackground:(CLLocation*)userPoint withinKilometers:(double)range compliation:(void (^)(NSArray*))callBack {
	
	if (backgroundQueue == nil) {
		
		backgroundQueue = dispatch_queue_create("org.kaizen.dojoFinder.DataFactory", NULL);
		
	}
	
	dispatch_async(backgroundQueue, ^(void) {
		
		NSArray* dojos = [DojoFactory dojosNear:userPoint withinKilometers:range];
		dispatch_async(dispatch_get_main_queue(), ^{
			callBack(dojos);
		});
		
	});
	
}

@end
