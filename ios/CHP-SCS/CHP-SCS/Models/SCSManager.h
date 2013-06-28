//
//  SCSManager.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 28.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <Foundation/Foundation.h>

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

+ (SCSManager*) SCSManagerWithDictionary:(NSDictionary*)dictionary;

+ (SCSManager*) getCurrentManager;

- (id) initWithDictionary:(NSDictionary*)dictionary;

@end
