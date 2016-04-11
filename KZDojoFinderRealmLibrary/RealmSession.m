//
//  RealmSession.m
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import "RealmSession.h"

@implementation RealmSession

@synthesize dayOfWeek;
@synthesize startTimeText;
@synthesize endTimeText;

@synthesize startTimeInMinutesSinceMidnight;
@synthesize endTimeInMinutesSinceMidnight;

@synthesize type;
@synthesize details;

@synthesize realmDojo;

-(id<Dojo>)dojo {
	return self.realmDojo;
}

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

+ (NSArray *)ignoredProperties
{
    return @[@"dojo"];
}

@end
