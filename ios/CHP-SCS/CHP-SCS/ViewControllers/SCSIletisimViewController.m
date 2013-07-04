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
    
    UILabel* managerNameLabel;
    UILabel* managerPhoneLabel;
    UIButton* managerPhoneButton;
    
    UILabel* headshipPhoneLabel;
    UIButton* headshipPhoneButton;
    
    UILabel* districtInformaticsManagerNameLabel;
    UILabel* districtInformaticsManagerPhoneLabel;
    UIButton* districtInformaticsManagerPhoneButton;
    
    UILabel* bitemEmailLabel;
    UIButton* bitemEmailButton;
    
    UILabel* bitemPhoneLabel;
    UIButton* bitemPhoneButton;
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
    CGFloat headerOffsetY = 40.0;
    CGFloat headerHeight = 40.0;
    CGFloat managerNameY = headerOffsetY+headerHeight*2;
    CGFloat managerPhoneY = managerNameY+30.0;
    
    CGFloat districtHeadshipY = managerPhoneY+40.0;
    
    CGFloat headshipPhoneY = districtHeadshipY+30.0;
    
    CGFloat districtInformaticsY = headshipPhoneY+40.0;
    CGFloat districtInformaticsNameY = districtInformaticsY+30.0;
    CGFloat districtInformaticsPhoneY = districtInformaticsNameY+30.0;
    
    CGFloat bitemY = districtInformaticsPhoneY+40.0;
    CGFloat bitemEmailY = bitemY+30.0;
    CGFloat bitemPhoneY = bitemEmailY+30.0;
    
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0.0, headerOffsetY, SCREEN_SIZE.width, headerHeight)];
    
    [headerLabel setBackgroundColor:[UIColor blackColor]];
    [headerLabel setFont:PDF_TABLE_CELL_TITLE_FONT];
    [headerLabel setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [headerLabel setTextAlignment:NSTextAlignmentCenter];
    
    UILabel* districtHeader = [[UILabel alloc] initWithFrame:CGRectMake(44.0, headerOffsetY+headerHeight+10.0, SCREEN_SIZE.width-88.0, 30.0)];
    [districtHeader setBackgroundColor:[UIColor clearColor]];
    [districtHeader setTextAlignment:NSTextAlignmentLeft];
    [districtHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [districtHeader setFont:COMMUNICATION_HEADER_FONT];
    [districtHeader setText:@"İlçe Başkanı"];
    
    UIImage* nameImage = [UIImage imageNamed:@"card_icon_person.png"];
    UIImageView* nameView1 = [[UIImageView alloc] initWithImage:nameImage];
    [nameView1 setFrame:CGRectMake(10.0, managerNameY+5.0,nameImage.size.width,nameImage.size.height)];
    [nameView1 setBackgroundColor:[UIColor clearColor]];
    
    managerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, managerNameY, SCREEN_SIZE.width-44.0, 30.0)];
    [managerNameLabel setBackgroundColor:[UIColor clearColor]];
    [managerNameLabel setTextAlignment:NSTextAlignmentLeft];
    [managerNameLabel setFont:COMMUNICATION_TEXT_FONT];
    [managerNameLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    UIImage* phoneImage = [UIImage imageNamed:@"card_icon_phone.png"];
    UIImageView* phoneView1 = [[UIImageView alloc] initWithImage:phoneImage];
    [phoneView1 setFrame:CGRectMake(14.0, 5.0, phoneImage.size.width, phoneImage.size.height)];
    [phoneView1 setBackgroundColor:[UIColor clearColor]];
    
    managerPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 0.0, SCREEN_SIZE.width-44.0, 30.0)];
    [managerPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [managerPhoneLabel setTextAlignment:NSTextAlignmentLeft];
    [managerPhoneLabel setFont:COMMUNICATION_TEXT_FONT];
    [managerPhoneLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    managerPhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [managerPhoneButton setFrame:CGRectMake(0.0, managerPhoneY, SCREEN_SIZE.width, 30.0)];
    [managerPhoneButton setBackgroundColor:[UIColor clearColor]];
    
    UIView* subSeperator1 = [[UIView alloc] initWithFrame:CGRectMake(10.0, managerPhoneY+35.0, SCREEN_SIZE.width-20.0, 1.0)];
    [subSeperator1 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UILabel* districtHeadship = [[UILabel alloc] initWithFrame:CGRectMake(44.0, districtHeadshipY, SCREEN_SIZE.width-88.0, 30.0)];
    [districtHeadship setBackgroundColor:[UIColor clearColor]];
    [districtHeadship setTextAlignment:NSTextAlignmentLeft];
    [districtHeadship setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [districtHeadship setFont:COMMUNICATION_HEADER_FONT];
    [districtHeadship setText:@"İlçe Başkanlığı"];
    
    UIImageView* phoneView2 = [[UIImageView alloc] initWithImage:phoneImage];
    [phoneView2 setFrame:CGRectMake(14.0, 5.0, phoneImage.size.width, phoneImage.size.height)];
    [phoneView2 setBackgroundColor:[UIColor clearColor]];
    
    headshipPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 0.0, SCREEN_SIZE.width-44.0, 30.0)];
    [headshipPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [headshipPhoneLabel setTextAlignment:NSTextAlignmentLeft];
    [headshipPhoneLabel setFont:COMMUNICATION_TEXT_FONT];
    [headshipPhoneLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    headshipPhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [headshipPhoneButton setFrame:CGRectMake(0.0, headshipPhoneY, SCREEN_SIZE.width, 30.0)];
    [headshipPhoneButton setBackgroundColor:[UIColor clearColor]];
    
    UIView* subSeperator2 = [[UIView alloc] initWithFrame:CGRectMake(10.0, headshipPhoneY+35.0, SCREEN_SIZE.width-20.0, 1.0)];
    [subSeperator2 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UILabel* districtInformatics = [[UILabel alloc] initWithFrame:CGRectMake(44.0, districtInformaticsY, SCREEN_SIZE.width-88.0, 30.0)];
    [districtInformatics setBackgroundColor:[UIColor clearColor]];
    [districtInformatics setTextAlignment:NSTextAlignmentLeft];
    [districtInformatics setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [districtInformatics setFont:COMMUNICATION_HEADER_FONT];
    [districtInformatics setText:@"İlçe Bilişim Sorumlusu"];
    
    UIImageView* nameView2 = [[UIImageView alloc] initWithImage:nameImage];
    [nameView2 setFrame:CGRectMake(10.0, districtInformaticsNameY+5.0,nameImage.size.width,nameImage.size.height)];
    [nameView2 setBackgroundColor:[UIColor clearColor]];
    
    districtInformaticsManagerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, districtInformaticsNameY, SCREEN_SIZE.width-44.0, 30.0)];
    [districtInformaticsManagerNameLabel setBackgroundColor:[UIColor clearColor]];
    [districtInformaticsManagerNameLabel setTextAlignment:NSTextAlignmentLeft];
    [districtInformaticsManagerNameLabel setFont:COMMUNICATION_TEXT_FONT];
    [districtInformaticsManagerNameLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    UIImageView* phoneView3 = [[UIImageView alloc] initWithImage:phoneImage];
    [phoneView3 setFrame:CGRectMake(14.0, 5.0, phoneImage.size.width, phoneImage.size.height)];
    [phoneView3 setBackgroundColor:[UIColor clearColor]];
    
    districtInformaticsManagerPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 0.0, SCREEN_SIZE.width-44.0, 30.0)];
    [districtInformaticsManagerPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [districtInformaticsManagerPhoneLabel setTextAlignment:NSTextAlignmentLeft];
    [districtInformaticsManagerPhoneLabel setFont:COMMUNICATION_TEXT_FONT];
    [districtInformaticsManagerPhoneLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    districtInformaticsManagerPhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [districtInformaticsManagerPhoneButton setFrame:CGRectMake(0.0, districtInformaticsPhoneY, SCREEN_SIZE.width, 30.0)];
    [districtInformaticsManagerPhoneButton setBackgroundColor:[UIColor clearColor]];

    UIView* subSeperator3 = [[UIView alloc] initWithFrame:CGRectMake(10.0, districtInformaticsPhoneY+35.0, SCREEN_SIZE.width-20.0, 1.0)];
    [subSeperator3 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UILabel* bitem = [[UILabel alloc] initWithFrame:CGRectMake(44.0, bitemY, SCREEN_SIZE.width-88.0, 30.0)];
    [bitem setBackgroundColor:[UIColor clearColor]];
    [bitem setTextAlignment:NSTextAlignmentLeft];
    [bitem setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [bitem setFont:COMMUNICATION_HEADER_FONT];
    [bitem setText:@"CHP - BİTEM"];
    
    UIImage* emailImage = [UIImage imageNamed:@"card_icon_mail.png"];
    
    UIImageView* emailView1 = [[UIImageView alloc] initWithImage:emailImage];
    [emailView1 setFrame:CGRectMake(10.0, 5.0, emailImage.size.width, emailImage.size.height)];
    [emailView1 setBackgroundColor:[UIColor clearColor]];
    
    bitemEmailLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 0.0, SCREEN_SIZE.width-44.0, 30.0)];
    [bitemEmailLabel setBackgroundColor:[UIColor clearColor]];
    [bitemEmailLabel setTextAlignment:NSTextAlignmentLeft];
    [bitemEmailLabel setFont:COMMUNICATION_TEXT_FONT];
    [bitemEmailLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    bitemEmailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bitemEmailButton setFrame:CGRectMake(0.0, bitemEmailY, SCREEN_SIZE.width, 30.0)];
    [bitemEmailButton setBackgroundColor:[UIColor clearColor]];
    
    UIImageView* phoneView4 = [[UIImageView alloc] initWithImage:phoneImage];
    [phoneView4 setFrame:CGRectMake(14.0, 5.0, phoneImage.size.width, phoneImage.size.height)];
    [phoneView4 setBackgroundColor:[UIColor clearColor]];
    
    bitemPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(44.0, 0.0, SCREEN_SIZE.width-44.0, 30.0)];
    [bitemPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [bitemPhoneLabel setTextAlignment:NSTextAlignmentLeft];
    [bitemPhoneLabel setFont:COMMUNICATION_TEXT_FONT];
    [bitemPhoneLabel setTextColor:TOP_BAR_TEXT_COLOR];
    
    bitemPhoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bitemPhoneButton setFrame:CGRectMake(0.0, bitemPhoneY, SCREEN_SIZE.width, 30.0)];
    [bitemPhoneButton setBackgroundColor:[UIColor clearColor]];
    
    UIView* subSeperator4 = [[UIView alloc] initWithFrame:CGRectMake(10.0, bitemPhoneY+35.0, SCREEN_SIZE.width-20.0, 1.0)];
    [subSeperator4 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    [self.view addSubview:headerLabel];
    [self.view addSubview:districtHeader];
    [self.view addSubview:nameView1];
    [self.view addSubview:managerNameLabel];
    [managerPhoneButton addSubview:phoneView1];
    [managerPhoneButton addSubview:managerPhoneLabel];
    [self.view addSubview:managerPhoneButton];
    [self.view addSubview:subSeperator1];
    [self.view addSubview:districtHeadship];
    [headshipPhoneButton addSubview:phoneView2];
    [headshipPhoneButton addSubview:headshipPhoneLabel];
    [self.view addSubview:headshipPhoneButton];
    [self.view addSubview:subSeperator2];
    [self.view addSubview:districtInformatics];
    [self.view addSubview:nameView2];
    [self.view addSubview:districtInformaticsManagerNameLabel];
    [districtInformaticsManagerPhoneButton addSubview:phoneView3];
    [districtInformaticsManagerPhoneButton addSubview:districtInformaticsManagerPhoneLabel];
    [self.view addSubview:districtInformaticsManagerPhoneButton];
    [self.view addSubview:subSeperator3];
    [self.view addSubview:bitem];
    [bitemEmailButton addSubview:emailView1];
    [bitemEmailButton addSubview:bitemEmailLabel];
    [self.view addSubview:bitemEmailButton];
    [bitemPhoneButton addSubview:phoneView4];
    [bitemPhoneButton addSubview:bitemPhoneLabel];
    [self.view addSubview:bitemPhoneButton];
    [self.view addSubview:subSeperator4];
    
    [self configureViews];
}

- (void) configureViews {
    
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    [headerLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_CHEST_NO]];
    [managerNameLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_MANAGER_NAME_SURNAME]];
    
    NSString* managerPhoneStr = [dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_MANAGER_PHONE];
    
    if (managerPhoneStr != nil && ![managerPhoneStr isEqualToString:@""]) {
        [managerPhoneLabel setText:managerPhoneStr];
        [managerPhoneButton setBackgroundImage:[UIImage imageNamed:@"communication_highlighted.png"] forState:UIControlStateHighlighted];
        [managerPhoneButton addTarget:self action:@selector(callManager) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSString* headshipPhoneStr = [dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_HEADSHIP_PHONE];
    
    if (headshipPhoneStr != nil && ![headshipPhoneStr isEqualToString:@""]) {
        [headshipPhoneLabel setText:headshipPhoneStr];
        [headshipPhoneButton setBackgroundImage:[UIImage imageNamed:@"communication_highlighted.png"] forState:UIControlStateHighlighted];
        [headshipPhoneButton addTarget:self action:@selector(callHeadship) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [districtInformaticsManagerNameLabel setText:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_NAME_SURNAME]];
    
    NSString* districtInformaticsManagerPhoneStr = [dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_PHONE];
    
    if (districtInformaticsManagerPhoneStr != nil && ![districtInformaticsManagerPhoneStr isEqualToString:@""]) {
        [districtInformaticsManagerPhoneLabel setText:districtInformaticsManagerPhoneStr];
        [districtInformaticsManagerPhoneButton setBackgroundImage:[UIImage imageNamed:@"communication_highlighted.png"] forState:UIControlStateHighlighted];
        [districtInformaticsManagerPhoneButton addTarget:self action:@selector(callDistrictInformaticsManager) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSString* bitemEmailStr = [dictionary objectForKey:COMMUNICATION_INFOS_CHP_BITEM_EMAIL];
    
    if (bitemEmailStr != nil && ![bitemEmailStr isEqualToString:@""]) {
        [bitemEmailLabel setText:bitemEmailStr];
        [bitemEmailButton setBackgroundImage:[UIImage imageNamed:@"communication_highlighted.png"] forState:UIControlStateHighlighted];
        [bitemEmailButton addTarget:self action:@selector(emailBitem) forControlEvents:UIControlEventTouchUpInside];
    }
    
    NSString* bitemPhoneStr = [dictionary objectForKey:COMMUNICATION_INFOS_CHP_BITEM_PHONE];
    
    if (bitemPhoneStr != nil && ![bitemPhoneStr isEqualToString:@""]) {
        [bitemPhoneLabel setText:bitemPhoneStr];
        [bitemPhoneButton setBackgroundImage:[UIImage imageNamed:@"communication_highlighted.png"] forState:UIControlStateHighlighted];
        [bitemPhoneButton addTarget:self action:@selector(callBitem) forControlEvents:UIControlEventTouchUpInside];
    }
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
- (void) callHeadship {
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    NSMutableString* phoneNumber = [NSMutableString stringWithString:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_HEADSHIP_PHONE]];
    NSArray* arr1 = [phoneNumber componentsSeparatedByString:@" "];
    phoneNumber = [NSMutableString stringWithString:[arr1 componentsJoinedByString:@""]];
    NSArray* arr = [phoneNumber componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]];
    phoneNumber = [NSMutableString stringWithString:[arr componentsJoinedByString:@""]];
    NSString *phoneUrl = [NSString stringWithFormat:@"tel:+90%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
}
- (void) callDistrictInformaticsManager {
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    NSMutableString* phoneNumber = [NSMutableString stringWithString:[dictionary objectForKey:COMMUNICATION_INFOS_DISTRICT_INFORMATICS_MANAGER_PHONE]];
    NSArray* arr1 = [phoneNumber componentsSeparatedByString:@" "];
    phoneNumber = [NSMutableString stringWithString:[arr1 componentsJoinedByString:@""]];
    NSArray* arr = [phoneNumber componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"()"]];
    phoneNumber = [NSMutableString stringWithString:[arr componentsJoinedByString:@""]];
    NSString *phoneUrl = [NSString stringWithFormat:@"tel:+90%@",phoneNumber];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneUrl]];
}
- (void) emailBitem {
    
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    NSString* bitemEmailStr = [dictionary objectForKey:COMMUNICATION_INFOS_CHP_BITEM_EMAIL];
    
    if ([MFMailComposeViewController canSendMail]) {
        // Show the composer
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setToRecipients:@[bitemEmailStr]];
        [controller setSubject:@"CHP-SCS mobil uygulaması"];
        
        if (controller) [self presentViewController:controller
                                           animated:YES
                                         completion:^{
                                             
                                         }];
    } else {
        
    }
}
- (void) callBitem {
    NSDictionary* dictionary = [[SCSManager currentManager] communicationInfos];
    
    NSMutableString* phoneNumber = [NSMutableString stringWithString:[dictionary objectForKey:COMMUNICATION_INFOS_CHP_BITEM_PHONE]];
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
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error {
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 
                             }];
}
@end
