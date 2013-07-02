//
//  SCSManager.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 28.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSManager.h"

static SCSManager* currentManager = nil;

@implementation SCSManager

+ (SCSManager*) SCSManagerWithDictionary:(NSDictionary*)dictionary
{
    return [[SCSManager alloc] initWithDictionary:dictionary];
}

+ (SCSManager*) currentManager
{
    return currentManager;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    if (self = [super init]) {
        _tckNo = [dictionary objectForKey:CARD_TCK_NO];
        _nameSurname = [dictionary objectForKey:CARD_NAME_SURNAME];
        _chestNo = [dictionary objectForKey:CARD_CHEST_NO];
        _chestProvince = [dictionary objectForKey:CARD_CHEST_PROVINCE];
        _chestDistrict = [dictionary objectForKey:CARD_CHEST_DISTRICT];
        _neighborhood = [dictionary objectForKey:CARD_NEIGHBORHOOD];
        _chestArea = [dictionary objectForKey:CARD_CHEST_AREA];
        _otherManagerNameSurname = [dictionary objectForKey:CARD_OTHER_MANAGER_NAME_SURNAME];
        _otherManagerPhone = [dictionary objectForKey:CARD_OTHER_MANAGER_PHONE];
        _photoUrl = [dictionary objectForKey:CARD_PHOTO_URL];
    }
    currentManager = self;
    return self;
}
- (void) getFullVoterListWithCompletionBlock:(CompletionBlock)completionBlock
                               andErrorBlock:(ErrorBlock)errorBlock
{
    
}
@end
