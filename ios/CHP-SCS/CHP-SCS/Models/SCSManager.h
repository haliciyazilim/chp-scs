//
//  SCSManager.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 28.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"

@interface SCSManager : NSObject

@property NSString* tckNo;
@property NSString* nameSurname;
@property NSString* chestNo;
@property NSString* chestProvince;
@property NSString* chestDistrict;
@property NSString* neighborhood;
@property NSString* chestArea;
@property NSString* otherManagerNameSurname;
@property NSString* otherManagerPhone;
@property NSString* photoUrl;

@property NSArray* egitimDocuments;
@property NSArray* genelgeDocuments;
@property NSDictionary* communicationInfos;
@property NSDictionary* voterList;

+ (SCSManager*) SCSManagerWithDictionary:(NSDictionary*)dictionary;

+ (SCSManager*) currentManager;

- (id) initWithDictionary:(NSDictionary*)dictionary;

- (void) getFullVoterListWithCompletionBlock:(CompletionBlock)completionBlock
                               andErrorBlock:(ErrorBlock)errorBlock;

@end
