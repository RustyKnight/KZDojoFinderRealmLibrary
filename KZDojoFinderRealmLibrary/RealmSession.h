//
//  RealmSession.h
//  KZDojoFinderRealmLibrary
//
//  Created by Shane Whitehead on 5/04/2016.
//  Copyright © 2016 KaiZen. All rights reserved.
//

#import <Realm/Realm.h>
#import <KZDojoFinderLibrary/KZDojoFinderLibrary.h>

@interface RealmSession : RLMObject <Session>

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RealmSession>
RLM_ARRAY_TYPE(RealmSession)
