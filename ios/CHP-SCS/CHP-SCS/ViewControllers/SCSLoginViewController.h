//
//  SCSLoginViewController.h
//  CHP-SCS
//
//  Created by Alperen Kavun on 27.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ENCRYPTION_KEY @"8iQ-2[,f5^x"
#define USER_DEFAULTS_KEY_USERNAME @"usernameKey"
#define USER_DEFAULTS_KEY_PASSWORD @"passwordKey"

@interface SCSLoginViewController : UIViewController <UITextFieldDelegate>

@property UITextField* usernameField;
@property UITextField* passwordField;
@property UIButton* loginButton;

@end
