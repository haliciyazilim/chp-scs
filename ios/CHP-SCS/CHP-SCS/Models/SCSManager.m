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

+ (SCSManager*) getCurrentManager
{
    return currentManager;
}

- (id) initWithDictionary:(NSDictionary*)dictionary
{
    if (self = [super init]) {
        _tckNo = [dictionary objectForKey:@"TCKN"];
        _nameSurname = [dictionary objectForKey:@"AdSoyad"];
        _chestNo = [dictionary objectForKey:@"SandikNo"];
        _chestProvince = [dictionary objectForKey:@"SandikIli"];
        _chestDistrict = [dictionary objectForKey:@"SandikIlcesi"];
        _neighborhood = [dictionary objectForKey:@"MahalleMuhtarligi"];
        _chestArea = [dictionary objectForKey:@"SandikAlani"];
        _otherManagerNameSurname = [dictionary objectForKey:@"DigerGorevliAdi"];
        _otherManagerPhone = [dictionary objectForKey:@"DigerGorevliTelefonu"];
        _photoUrl = [dictionary objectForKey:@"GorevliFotoUrl"];
    }
    currentManager = self;
    return self;
}

@end
