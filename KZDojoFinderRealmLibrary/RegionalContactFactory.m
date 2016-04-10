//
//  RealmRegionalContactFactory.m
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>

static dispatch_queue_t backgroundQueue;

@implementation RegionalContactFactory

+(id<RegionalContact>)regionalContactByRegion:(NSInteger)region {
	
//	return [ParseRegionalContactFactory regionalContactByRegion:region];
	return nil;
	
}

+(void)regionalContactInBackgroundByRegion:(NSInteger)region compliation:(void (^)(id<RegionalContact>))callBack {
	
	if (backgroundQueue == nil) {
		
		backgroundQueue = dispatch_queue_create("org.kaizen.dojoFinder.DataFactory", NULL);
		
	}
	
	dispatch_async(backgroundQueue, ^(void) {
		
		id<RegionalContact> contact = [RegionalContactFactory regionalContactByRegion:region];
		dispatch_async(dispatch_get_main_queue(), ^{
			callBack(contact);
		});
		
	});
	
}

@end
