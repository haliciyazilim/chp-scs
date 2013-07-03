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
        // create cardDictionary
        NSDictionary* cardDictionary = [dictionary objectForKey:CARD_DICTIONARY];
        _tckNo = [cardDictionary objectForKey:CARD_TCK_NO];
        _nameSurname = [cardDictionary objectForKey:CARD_NAME_SURNAME];
        _chestNo = [cardDictionary objectForKey:CARD_CHEST_NO];
        _chestProvince = [cardDictionary objectForKey:CARD_CHEST_PROVINCE];
        _chestDistrict = [cardDictionary objectForKey:CARD_CHEST_DISTRICT];
        _neighborhood = [cardDictionary objectForKey:CARD_NEIGHBORHOOD];
        _chestArea = [cardDictionary objectForKey:CARD_CHEST_AREA];
        _otherManagerNameSurname = [cardDictionary objectForKey:CARD_OTHER_MANAGER_NAME_SURNAME];
        _otherManagerPhone = [cardDictionary objectForKey:CARD_OTHER_MANAGER_PHONE];
        _photoUrl = [cardDictionary objectForKey:CARD_PHOTO_URL];
        
        _egitimDocuments = (NSMutableArray*)[[dictionary objectForKey:EGITIM_DOCUMENTS_DICTIONARY] objectForKey:DOCUMENTS_LIST];
        _genelgeDocuments = (NSMutableArray*)[[dictionary objectForKey:GENELGE_DOCUMENTS_DICTIONARY] objectForKey:DOCUMENTS_LIST];
        _communicationInfos = (NSMutableDictionary*)[dictionary objectForKey:COMMUNICATION_DICTIONARY];
        _voterList = (NSMutableDictionary*)[dictionary objectForKey:VOTER_LIST_DICTIONARY];
        
    }
    currentManager = self;
    return self;
}

@end
