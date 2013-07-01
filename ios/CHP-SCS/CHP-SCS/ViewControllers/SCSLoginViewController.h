//
//  SCSLoginViewController.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 27.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCSLoginViewController : UIViewController <UITextFieldDelegate>

@property UITextField* usernameField;
@property UITextField* passwordField;
@property UIButton* loginButton;

@end
