//
//  RealmDojo.h
//  DojoFinder
//
//  Created by Shane Whitehead on 4/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>

@interface RealmDojo : RLMObject <Dojo>
@property double latitude;
@property double longitude;
@end
