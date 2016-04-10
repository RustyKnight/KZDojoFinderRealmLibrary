//
//  SessionFactory.m
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>

@implementation SessionFactory

static dispatch_queue_t backgroundQueue;

+(NSArray*)sessionsForDojo:(id<Dojo>)dojo {
	
	return nil;
	
}

+(void)sessionsForDojoInBackground:(id<Dojo>)dojo compliation:(void (^)(NSArray*))callBack {
	
	if (backgroundQueue == nil) {
		
		backgroundQueue = dispatch_queue_create("org.kaizen.dojoFinder.DataFactory", NULL);
		
	}
	
	dispatch_async(backgroundQueue, ^(void) {
		
		NSArray* sessions = [SessionFactory sessionsForDojo:dojo];
		
		dispatch_async(dispatch_get_main_queue(), ^{
			callBack(sessions);
		});
		
	});
	
}

@end
