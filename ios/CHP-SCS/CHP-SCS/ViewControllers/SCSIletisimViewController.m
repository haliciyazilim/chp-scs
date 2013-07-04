//
//  SCSIletisimViewController.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSIletisimViewController.h"
#import "Config.h"
#import "SCSManager.h"

@interface SCSIletisimViewController ()

@end

@implementation SCSIletisimViewController
{
    UILabel* headerLabel;
    UILabel* districtManagerLabel;
    UIButton* districtManagerPhone;
    UILabel* districtManagerPhoneLabel;
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
    
    [self initViews];
    
}

- (void) initViews
{
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 40.0, SCREEN_SIZE.width, 50.0)];
    [headerLabel setBackgroundColor:[UIColor blackColor]];
    [headerLabel setFont:PDF_TABLE_CELL_TITLE_FONT];
    [headerLabel setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel* districtManagerHeader = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 100.0, SCREEN_SIZE.width*0.5-5.0, 40.0)];
    [districtManagerHeader setBackgroundColor:[UIColor clearColor]];
    [districtManagerHeader setTextAlignment:NSTextAlignmentRight];
    [districtManagerHeader setTextColor:TOP_BAR_TEXT_COLOR];
    [districtManagerHeader setText:@"İlçe Başkanı:"];
    
    districtManagerLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width*0.5, 100.0, SCREEN_SIZE.width*0.5, 40.0)];
    [districtManagerLabel setBackgroundColor:[UIColor clearColor]];
    [districtManagerLabel setTextAlignment:NSTextAlignmentLeft];
    [districtManagerLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    districtManagerPhone = [UIButton buttonWithType:UIButtonTypeCustom];
    [districtManagerPhone setFrame:CGRectMake(0.0, 150.0, SCREEN_SIZE.width, 40.0)];
    [districtManagerPhone setBackgroundColor:[UIColor clearColor]];
    [districtManagerPhone addTarget:self action:@selector(callManager) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel* districtManagerPhoneHeader = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, SCREEN_SIZE.width*0.5-5.0, 40.0)];
    [districtManagerPhoneHeader setBackgroundColor:[UIColor clearColor]];
    [districtManagerPhoneHeader setTextAlignment:NSTextAlignmentRight];
    [districtManagerPhoneHeader setText:@"İlçe Başkanı Telefon:"];
    
    districtManagerPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width*0.5, 100.0, SCREEN_SIZE.width*0.5, 40.0)];
    [districtManagerPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [districtManagerPhoneLabel setTextAlignment:NSTextAlignmentLeft];
    
    [self.view addSubview:headerLabel];
    [self.view addSubview:districtManagerHeader];
    [self.view addSubview:districtManagerLabel];
    [districtManagerPhone addSubview:districtManagerPhoneHeader];
    [districtManagerPhone addSubview:districtManagerPhoneLabel];
    [self.view addSubview:districtManagerPhone];
    
    [self configureViews];
}
- (void) configureViews {
    
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    [headerLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_CHEST_NO]];
    
    [districtManagerLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_MANAGER_NAME_SURNAME]];
    
    [districtManagerPhoneLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_MANAGER_PHONE]];
}
- (void) callManager {
    
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    NSMutableString* phoneNumber = [NSMutableString stringWithString:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_MANAGER_PHONE]];
    NSArray* arr1 = [phoneNumber componentsSeparatedByString:@" "];
    phoneNumber = [NSMutableString stringWithString:[arr1 componentsJoinedByString:@""]];
    NSArray* arr = [phoneNumber componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]];
    phoneNumber = [NSMutableString stringWithString:[arr componentsJoinedByString:@""]];
    NSString *phoneUrl = [NSString stringWithFormat:@"tel:+90%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
