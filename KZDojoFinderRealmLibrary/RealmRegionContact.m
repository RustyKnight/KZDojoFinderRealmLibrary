//
//  RealmRegionContact.m
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import "RealmRegionContact.h"

@implementation RealmRegionContact

@synthesize name;
@synthesize phoneNumber;
@synthesize email;
@synthesize faceBook;

@synthesize region;

-(void)photo:(void (^)(UIImage *))callBack {
	callBack(nil);
	
	//	if (backgroundQueue == nil) {
	//
	//		backgroundQueue = dispatch_queue_create("org.kaizen.dojoFinder.photo", NULL);
	//
	//	}
	//
	//	dispatch_async(backgroundQueue, ^(void) {
	//
	//		NSLog(@"Start loading photo");
	//		NSData *data = [file getData];
	//		UIImage *picture = [UIImage imageWithData:data];
	//		NSLog(@"Completed loading photo");
	//
	//		dispatch_async(dispatch_get_main_queue(), ^{
	//			callBack(picture);
	//		});
	//
	//	});
	
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
