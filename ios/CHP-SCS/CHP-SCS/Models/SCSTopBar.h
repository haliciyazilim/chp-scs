//
//  SCSTopBar.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Config.h"

@interface SCSTopBar : UIView

@property (strong,nonatomic) UIButton* menuButton;
@property (strong,nonatomic) UILabel* barTitle;

- (void) setTitleText:(NSString *)title;

@end
