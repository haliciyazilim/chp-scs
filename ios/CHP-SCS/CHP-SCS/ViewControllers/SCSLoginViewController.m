//
//  SCSLoginViewController.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 27.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSLoginViewController.h"
#import "APIManager.h"
#import "SCSManager.h"
#import "SCSSlidingViewController.h"
#import "Config.h"
#import <QuartzCore/QuartzCore.h>
#import "RNEncryptor.h"
#import "RNDecryptor.h"
#import "NSData+Base64.h"

@interface SCSLoginViewController ()

@end

@implementation SCSLoginViewController
{
    NSString* currentUsername;
    NSString* currentPassword;
    UIActivityIndicatorView* activityIndicator;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    
    
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width-LOGIN_SCREEN_TEXT_FIELDS_SIZE.width)*0.5, 221.0, LOGIN_SCREEN_TEXT_FIELDS_SIZE.width, LOGIN_SCREEN_TEXT_FIELDS_SIZE.height)];
    
    [self.usernameField setBackgroundColor:LOGIN_SCREEN_TEXT_FIELDS_COLOR];
    self.usernameField.layer.cornerRadius = 8.0;
    self.usernameField.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.usernameField.layer.shadowColor = [UIColor blackColor].CGColor;
    self.usernameField.layer.shadowOpacity = 0.25;
    self.usernameField.layer.shadowRadius = 0.0;
    self.usernameField.layer.masksToBounds = NO;
    [self.usernameField setFont:LOGIN_SCREEN_TEXT_FONT];
    [self.usernameField setTextColor:LOGIN_SCREEN_TEXT_COLOR];
    [self.usernameField setTextAlignment:NSTextAlignmentCenter];
    [self.usernameField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self.usernameField setKeyboardType:UIKeyboardTypeNumberPad];
    self.usernameField.delegate = self;
//    self.usernameField.placeholder = @"Telefon No Giriniz";
    self.usernameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Telefon No Giriniz" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithWhite:0.5 alpha:1.0]}];
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake((SCREEN_SIZE.width-LOGIN_SCREEN_TEXT_FIELDS_SIZE.width)*0.5, 275.0, LOGIN_SCREEN_TEXT_FIELDS_SIZE.width, LOGIN_SCREEN_TEXT_FIELDS_SIZE.height)];
    
    [self.passwordField setBackgroundColor:LOGIN_SCREEN_TEXT_FIELDS_COLOR];
    self.passwordField.layer.cornerRadius = 8.0;
    self.passwordField.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.passwordField.layer.shadowColor = [UIColor blackColor].CGColor;
    self.passwordField.layer.shadowOpacity = 0.25;
    self.passwordField.layer.shadowRadius = 0.0;
    self.passwordField.layer.masksToBounds = NO;
    [self.passwordField setFont:LOGIN_SCREEN_TEXT_FONT];
    [self.passwordField setTextColor:LOGIN_SCREEN_TEXT_COLOR];
    [self.passwordField setTextAlignment:NSTextAlignmentCenter];
    [self.passwordField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    self.passwordField.delegate = self;
//    self.passwordField.placeholder = @"Şifre Giriniz";
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Şifre Giriniz" attributes:@{NSForegroundColorAttributeName: [UIColor colorWithWhite:0.5 alpha:1.0]}];
    self.passwordField.secureTextEntry = YES;
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setFrame:CGRectMake(192.0, 330.0, LOGIN_SCREEN_BUTTON_SIZE.width, LOGIN_SCREEN_BUTTON_SIZE.height)];
    [self.loginButton setBackgroundImage:[self uiImageWithUIColor:LOGIN_SCREEN_BUTTON_COLOR] forState:UIControlStateNormal];
    [self.loginButton setBackgroundImage:[self uiImageWithUIColor:LOGIN_SCREEN_BUTTON_HIGHLIGHTED_COLOR] forState:UIControlStateHighlighted];
    self.loginButton.layer.cornerRadius = 8.0;
    self.loginButton.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.loginButton.layer.shadowColor = [UIColor blackColor].CGColor;
    self.loginButton.layer.shadowOpacity = 0.25;
    self.loginButton.layer.shadowRadius = 0.0;
    self.loginButton.layer.masksToBounds = NO;
    self.loginButton.clipsToBounds = YES;
    [self.loginButton setTitle:@"Giriş" forState:UIControlStateNormal];
    [self.loginButton setTitle:@"Giriş" forState:UIControlStateHighlighted];
    
    [self.loginButton addTarget:self action:@selector(checkLogin) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIImage* logoImage = [UIImage imageNamed:@"login_logo.png"];
    
    UIImageView* logoView = [[UIImageView alloc] initWithImage:logoImage];
    [logoView setFrame:CGRectMake((SCREEN_SIZE.width-logoImage.size.width)*0.5, 62.0, logoImage.size.width, logoImage.size.height)];
    
    UILabel* titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.0, 130.0, SCREEN_SIZE.width-60.0, 60.0)];
    [titleLabel setTextAlignment:NSTextAlignmentCenter];
    [titleLabel setNumberOfLines:2];
    [titleLabel setTextColor:LOGIN_SCREEN_TITLE_COLOR];
    [titleLabel setFont:LOGIN_SCREEN_TITLE_FONT];
    [titleLabel setText:@"Sandık Çevresi Sorumluları Bilgi Sistemi"];
    [titleLabel setBackgroundColor:[UIColor clearColor]];
    
    
    [self.view addSubview:logoView];
    [self.view addSubview:titleLabel];
    [self.view addSubview:self.usernameField];
    [self.view addSubview:self.passwordField];
    [self.view addSubview:self.loginButton];
    
    
}
- (UIImage*)uiImageWithUIColor:(UIColor*)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,color.CGColor);
    
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return img;
}
- (void)viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification object:self.view.window];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.usernameField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.passwordField];
    
    NSData* encryptedUsername = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_KEY_USERNAME];
    NSData* encryptedPassword = [[NSUserDefaults standardUserDefaults] objectForKey:USER_DEFAULTS_KEY_PASSWORD];
    
    if (encryptedUsername != nil && encryptedPassword != nil) {
        NSError* error;
        NSError* error2;
        
        NSData* decryptedUsername = [RNDecryptor decryptData:encryptedUsername withPassword:ENCRYPTION_KEY error:&error];
        NSData* decryptedPassword = [RNDecryptor decryptData:encryptedPassword withPassword:ENCRYPTION_KEY error:&error2];
        
        currentUsername = [NSKeyedUnarchiver unarchiveObjectWithData:decryptedUsername];
        currentPassword = [NSKeyedUnarchiver unarchiveObjectWithData:decryptedPassword];
    }
    else {
        currentUsername = nil;
        currentPassword = nil;
    }
    
    if (currentUsername != nil && currentPassword != nil) {
        [self.usernameField setText:currentUsername];
        [self.passwordField setText:currentPassword];
        self.usernameField.clearButtonMode = UITextFieldViewModeAlways;
        self.passwordField.clearButtonMode = UITextFieldViewModeAlways;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString* replacedString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (replacedString.length > 11) {
        NSRange fieldRange = {0, 11};
        textField.text = [replacedString substringWithRange:fieldRange];
        
        return NO;
    } else {
        return YES;
    }
}
- (void)textFieldDidChange:(NSNotification *)notif {
    if (notif.object == self.usernameField) {
        if (self.usernameField.text.length == 0) {
            self.usernameField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.usernameField.clearButtonMode = UITextFieldViewModeAlways;
        }
    }
    else if (notif.object == self.passwordField) {
        if (self.passwordField.text.length == 0) {
            self.passwordField.clearButtonMode = UITextFieldViewModeNever;
        }
        else {
            self.passwordField.clearButtonMode = UITextFieldViewModeAlways;
        }
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}

- (void)keyboardWillShow:(NSNotification *)notif {
    NSDictionary* userInfo = [notif userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         CGRect frame = self.view.frame;
                         frame.origin.y = -110.0;
                         [self.view setFrame:frame];
                     }];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField.text.length == 0) {
        textField.clearButtonMode = UITextFieldViewModeNever;
    }
    else {
        textField.clearButtonMode = UITextFieldViewModeAlways;
    }
}
- (void)keyboardWillHide:(NSNotification *)notif {
    NSDictionary* userInfo = [notif userInfo];
    
    // Get animation info from userInfo
    NSTimeInterval animationDuration;
    UIViewAnimationCurve animationCurve;
    
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&animationDuration];
    
    [UIView animateWithDuration:animationDuration
                     animations:^{
                         CGRect frame = self.view.frame;
                         frame.origin.y = 0.0;
                         [self.view setFrame:frame];
                     }];
}
- (void)checkLogin {
    
    long long int myText = [self.usernameField.text longLongValue];
    NSString *username = [NSString stringWithFormat:@"%llu",myText];
    NSString* aPassword = self.passwordField.text;
    if ([username length] == 11 || [username length] == 10){
        if (aPassword != nil && ![aPassword isEqualToString:@""]) {
            activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
            CGRect frame = self.loginButton.frame;
            [activityIndicator setFrame:CGRectMake(frame.origin.x-36.0, frame.origin.y+8.0, 26.0, 26.0)];
            [self.view addSubview:activityIndicator];
            [activityIndicator startAnimating];
            [self.view setUserInteractionEnabled:NO];
            
            
            
            [[APIManager sharedInstance] loginWithUsername:username andPassword:aPassword onCompletion:^(SCSManager *manager) {
                
                NSData* user = [NSKeyedArchiver archivedDataWithRootObject:username];
                NSData* pass = [NSKeyedArchiver archivedDataWithRootObject:aPassword];
                NSError* error2;
                NSError* error;
                NSData* encryptedUsername = [RNEncryptor encryptData:user withSettings:kRNCryptorAES256Settings password:ENCRYPTION_KEY error:&error];
                NSData* encryptedPassword = [RNEncryptor encryptData:pass withSettings:kRNCryptorAES256Settings password:ENCRYPTION_KEY error:&error2];
                
                [[NSUserDefaults standardUserDefaults] setObject:encryptedUsername forKey:USER_DEFAULTS_KEY_USERNAME];
                [[NSUserDefaults standardUserDefaults] setObject:encryptedPassword forKey:USER_DEFAULTS_KEY_PASSWORD];
                [[NSUserDefaults standardUserDefaults] synchronize];
                currentUsername = username;
                currentPassword = aPassword;
                
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                activityIndicator = nil;
                [self.view setUserInteractionEnabled:YES];
                
                [self performSegueWithIdentifier:@"LoginSegue" sender:self];
            } onError:^(NSError *error) {
                [activityIndicator stopAnimating];
                [activityIndicator removeFromSuperview];
                activityIndicator = nil;
                [self.view setUserInteractionEnabled:YES];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:[error localizedDescription] delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
                [alertView show];
            }];
        } else {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen şifrenizi giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
            [alertView show];
        }
        
        
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Hata" message:@"Lütfen telefon numaranızı giriniz." delegate:self cancelButtonTitle:@"Tamam" otherButtonTitles:nil, nil];
        [alertView show];
    }
    
}
@end
