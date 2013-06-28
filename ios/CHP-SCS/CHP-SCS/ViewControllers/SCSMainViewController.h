//
//  SCSMainViewController.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSViewController.h"

@class SCSManager;

@interface SCSMainViewController : SCSViewController

@property (nonatomic) SCSManager* currentManager;

@end
