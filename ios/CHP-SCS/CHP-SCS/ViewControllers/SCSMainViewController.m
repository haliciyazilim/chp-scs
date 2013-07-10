//
//  SCSMainViewController.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSMainViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "TypeDefs.h"
#import "SCSManager.h"

@interface SCSMainViewController ()

@end

@implementation SCSMainViewController
{
    UIImageView* officerImageView;
    UILabel* yearLabel;
    UILabel* headerLabel;
    UILabel* nameLabel;
    UILabel* chestNoLabel;
    UILabel* chestProvinceLabel;
    UILabel* chestDistrictLabel;
    UILabel* homeTownLabel;
    UILabel* chestAreaLabel;
    UILabel* secondOfficerLabel;
    UILabel* secondOfficerPhoneLabel;
    UIButton* secondOfficerPhoneView;
    UIScrollView* scrollView;
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
    
    [self.topBar setTitleText:@"Anasayfa"];
    [self initViews];
}
- (void) initViews {
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    CGFloat topBarHeight = 44.0;
    CGFloat cardHeight = 151.0;
    CGFloat xOffset = 20.0;
    CGFloat yOffset = 20.0;
    CGFloat imageWidth = 109.0;
    CGFloat innerSpace = 15.0;
    CGFloat yearWidth = 50.0;
    CGFloat yearHeight = 15.0;
    CGFloat headerWidth = 150.0;
    CGFloat headerHeight = 34.0;
    CGFloat seperatorWidth = 170.0;
    CGFloat seperatorHeight = 1.0;
    CGFloat nameWidth = 150.0;
    CGFloat nameHeight = 60.0;
    
    CGFloat chestNoY = 215.0;
    
    CGFloat homeTownY = chestNoY+78.0;
    
    CGFloat chestAreaY = homeTownY+66.0;
    
    _currentManager = [SCSManager currentManager];
    
    CGSize size = [[_currentManager chestArea] sizeWithFont:CARD_OTHER_CONTENT_TEXT_FONT constrainedToSize:CGSizeMake(274.0, 1000.0)];
    
    CGFloat cardPersonImageY = chestAreaY+40.0+size.height;
    
    scrollView = [[UIScrollView alloc] initWithFrame:frame];
    [scrollView setContentSize:CGSizeMake(frame.size.width, cardPersonImageY+56.0)];
//    [scrollView setUserInteractionEnabled:YES];
    [scrollView setScrollEnabled:YES];
    [scrollView setShowsHorizontalScrollIndicator:NO];
    [scrollView setShowsVerticalScrollIndicator:NO];
    
    UIImageView* cardBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_bg.png"]];
    [cardBackground setFrame:CGRectMake(0.0, topBarHeight, frame.size.width, cardHeight)];
    
    officerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset, topBarHeight+yOffset, imageWidth, imageWidth)];
    [officerImageView setBackgroundColor:[UIColor clearColor]];
    officerImageView.layer.borderWidth = 2.0;
    officerImageView.layer.borderColor = [CARD_OFFICER_IMAGE_BORDER_COLOR CGColor];
    [officerImageView setContentMode:UIViewContentModeScaleAspectFill];
    [officerImageView setClipsToBounds:YES];
    [officerImageView setImage:[UIImage imageNamed:@"dummy.jpg"]];
    
    yearLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+imageWidth+innerSpace, topBarHeight+yOffset, yearWidth, yearHeight)];
    [yearLabel setBackgroundColor:[UIColor clearColor]];
    [yearLabel setFont:CARD_YEAR_TEXT_FONT];
    [yearLabel setTextColor:CARD_YEAR_TEXT_COLOR];
    
    
    headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+imageWidth+innerSpace, topBarHeight+yOffset+yearHeight+1.0, headerWidth, headerHeight)];
    [headerLabel setBackgroundColor:[UIColor clearColor]];
    [headerLabel setFont:CARD_HEADER_TEXT_FONT];
    [headerLabel setTextColor:CARD_HEADER_TEXT_COLOR];
    [headerLabel setNumberOfLines:2];
    
    UIView* cardSeperator = [[UIView alloc] initWithFrame:CGRectMake(xOffset+imageWidth, topBarHeight+yOffset+yearHeight+headerHeight+7.0, seperatorWidth, seperatorHeight)];
    [cardSeperator setBackgroundColor:CARD_OFFICER_IMAGE_BORDER_COLOR];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+imageWidth+innerSpace, topBarHeight+yOffset+yearHeight+headerHeight+9.0, nameWidth, nameHeight)];
    [nameLabel setBackgroundColor:[UIColor clearColor]];
    [nameLabel setFont:CARD_NAME_TEXT_FONT];
    [nameLabel setTextColor:CARD_NAME_TEXT_COLOR];
    [nameLabel setNumberOfLines:2];
    
    UILabel* chestNoHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, chestNoY-4.0, 60.0, 14.0)];
    [chestNoHeader setBackgroundColor:[UIColor clearColor]];
    [chestNoHeader setFont:MAIN_CONTENT_SUBHEADER_TEXT_FONT];
    [chestNoHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [chestNoHeader setText:@"Sandık No"];
    
    chestNoLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, chestNoY+10.0, 120.0, 40.0)];
    [chestNoLabel setBackgroundColor:[UIColor clearColor]];
    [chestNoLabel setFont:CARD_CHEST_NO_TEXT_FONT];
    [chestNoLabel setTextColor:CARD_CHEST_NO_TEXT_COLOR];
    
    UILabel* chestProvinceHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+130.0, chestNoY-4.0, 100.0, 14.0)];
    [chestProvinceHeader setBackgroundColor:[UIColor clearColor]];
    [chestProvinceHeader setFont:MAIN_CONTENT_SUBHEADER_TEXT_FONT];
    [chestProvinceHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [chestProvinceHeader setText:@"Sandık İli, İlçesi"];
    
    chestProvinceLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+130.0, chestNoY+10.0, 140.0, 22.0)];
    [chestProvinceLabel setBackgroundColor:[UIColor clearColor]];
    [chestProvinceLabel setFont:CARD_PROVINCE_TEXT_FONT];
    [chestProvinceLabel setTextColor:CARD_PROVINCE_TEXT_COLOR];
    
    chestDistrictLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+130.0, chestNoY+32.0, 140.0, 16.0)];
    [chestDistrictLabel setBackgroundColor:[UIColor clearColor]];
    [chestDistrictLabel setFont:CARD_DISTRICT_TEXT_FONT];
    [chestDistrictLabel setTextColor:CARD_DISTRICT_TEXT_COLOR];
    
    UIView* subSeperator1 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, chestNoY+65.0, 280.0, 1.0)];
    [subSeperator1 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UILabel* homeTownHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, homeTownY, 100.0, 14.0)];
    [homeTownHeader setBackgroundColor:[UIColor clearColor]];
    [homeTownHeader setFont:MAIN_CONTENT_SUBHEADER_TEXT_FONT];
    [homeTownHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [homeTownHeader setText:@"Mahalle Muhtarlığı"];
    
    homeTownLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, homeTownY+14.0, 220.0, 26.0)];
    [homeTownLabel setBackgroundColor:[UIColor clearColor]];
    [homeTownLabel setFont:CARD_OTHER_CONTENT_TEXT_FONT];
    [homeTownLabel setTextColor:CARD_OTHER_CONTENT_TEXT_COLOR];
    
    UIView* subSeperator2 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, homeTownY+53.0, 280.0, 1.0)];
    [subSeperator2 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UILabel* chestAreaHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, chestAreaY, 100.0, 14.0)];
    [chestAreaHeader setBackgroundColor:[UIColor clearColor]];
    [chestAreaHeader setFont:MAIN_CONTENT_SUBHEADER_TEXT_FONT];
    [chestAreaHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [chestAreaHeader setText:@"Sandık Alanı"];
    
    chestAreaLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, chestAreaY+14.0, 274.0, size.height)];
    [chestAreaLabel setBackgroundColor:[UIColor clearColor]];
    [chestAreaLabel setFont:CARD_OTHER_CONTENT_TEXT_FONT];
    [chestAreaLabel setTextColor:CARD_OTHER_CONTENT_TEXT_COLOR];
    [chestAreaLabel setNumberOfLines:0];
    
    UIView* subSeperator3 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, chestAreaY+size.height+26.0, 280.0, 1.0)];
    [subSeperator3 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    UIImage* cardPersonImage = [UIImage imageNamed:@"card_icon_person.png"];
    UIImageView* cardPersonView = [[UIImageView alloc] initWithImage:cardPersonImage];
    [cardPersonView setFrame:CGRectMake(xOffset, cardPersonImageY, cardPersonImage.size.width, cardPersonImage.size.height)];
    
    UILabel* secondOfficerHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+28.0, cardPersonImageY, 100.0, 10.0)];
    [secondOfficerHeader setBackgroundColor:[UIColor clearColor]];
    [secondOfficerHeader setFont:CARD_SECOND_OFFICER_TEXT_FONT];
    [secondOfficerHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [secondOfficerHeader setText:@"2. Sandık Görevlisi"];
    
    secondOfficerLabel = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+28.0, cardPersonImageY+10.0, 110.0, 10.0)];
    [secondOfficerLabel setBackgroundColor:[UIColor clearColor]];
    [secondOfficerLabel setFont:CARD_SECOND_OFFICER_TEXT_FONT];
    [secondOfficerLabel setTextColor:CARD_SECOND_OFFICER_TEXT_COLOR];
    
    UIImage* cardPhoneImage = [UIImage imageNamed:@"card_icon_phone.png"];
    UIImageView* cardPhoneView = [[UIImageView alloc] initWithImage:cardPhoneImage];
    [cardPhoneView setFrame:CGRectMake(xOffset+152.0, cardPersonImageY, cardPhoneImage.size.width, cardPhoneImage.size.height)];
    
    secondOfficerPhoneView = [UIButton buttonWithType:UIButtonTypeCustom];
    [secondOfficerPhoneView setFrame:CGRectMake(xOffset+150.0, cardPersonImageY-10.0, 140.0, 40.0)];
    [secondOfficerPhoneView setBackgroundColor:[UIColor clearColor]];
    
    UILabel* secondOfficerPhoneHeader = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 10.0, 120.0, 10.0)];
    [secondOfficerPhoneHeader setBackgroundColor:[UIColor clearColor]];
    [secondOfficerPhoneHeader setFont:CARD_SECOND_OFFICER_TEXT_FONT];
    [secondOfficerPhoneHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [secondOfficerPhoneHeader setText:@"Sandık Görevlisi Telefon"];
    
    secondOfficerPhoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0, 20.0, 110.0, 10.0)];
    [secondOfficerPhoneLabel setBackgroundColor:[UIColor clearColor]];
    [secondOfficerPhoneLabel setFont:CARD_SECOND_OFFICER_TEXT_FONT];
    [secondOfficerPhoneLabel setTextColor:CARD_SECOND_OFFICER_TEXT_COLOR];
    
    UIView* subSeperator4 = [[UIView alloc] initWithFrame:CGRectMake(xOffset, cardPersonImageY+33.0, 280.0, 1.0)];
    [subSeperator4 setBackgroundColor:MAIN_CONTENT_SEPERATOR_COLOR];
    
    [scrollView addSubview:cardBackground];
    [scrollView addSubview:officerImageView];
    [scrollView addSubview:yearLabel];
    [scrollView addSubview:headerLabel];
    [scrollView addSubview:cardSeperator];
    [scrollView addSubview:nameLabel];
    [scrollView addSubview:chestNoHeader];
    [scrollView addSubview:chestNoLabel];
    [scrollView addSubview:chestProvinceHeader];
    [scrollView addSubview:chestProvinceLabel];
    [scrollView addSubview:chestDistrictLabel];
    [scrollView addSubview:subSeperator1];
    [scrollView addSubview:homeTownHeader];
    [scrollView addSubview:homeTownLabel];
    [scrollView addSubview:subSeperator2];
    [scrollView addSubview:chestAreaHeader];
    [scrollView addSubview:chestAreaLabel];
    [scrollView addSubview:subSeperator3];
    [scrollView addSubview:cardPersonView];
    [scrollView addSubview:secondOfficerHeader];
    [scrollView addSubview:secondOfficerLabel];
    [scrollView addSubview:cardPhoneView];
    [secondOfficerPhoneView addSubview:secondOfficerPhoneHeader];
    [secondOfficerPhoneView addSubview:secondOfficerPhoneLabel];
    [scrollView addSubview:secondOfficerPhoneView];
    [scrollView addSubview:subSeperator4];
    
    [self.view addSubview:scrollView];
    [self.view sendSubviewToBack:scrollView];
}
- (void) viewWillAppear:(BOOL)animated {
    _currentManager = [SCSManager currentManager];
    [self configureViews];
}

- (void) configureViews {
    
    
    if ([self.currentManager photoUrl] != nil && ![[self.currentManager photoUrl] isEqualToString:@""]) {
        [[APIManager sharedInstance] getImageWithURLString:[self.currentManager photoUrl] onCompletion:^(UIImage *resultImage) {
            [officerImageView setImage:resultImage];
        } onError:^(NSError *error) {
            ;
        }];
    }
    
    [yearLabel setText:@"2013"];
    [headerLabel setText:@"SANDIK ÇEVRESİ SORUMLUSU KARTI"];
    [nameLabel setText:[_currentManager nameSurname]];
    [chestNoLabel setText:[_currentManager chestNo]];
    [chestProvinceLabel setText:[_currentManager chestProvince]];
    [chestDistrictLabel setText:[_currentManager chestDistrict]];
    [homeTownLabel setText:[_currentManager neighborhood]];
    [chestAreaLabel setText:[_currentManager chestArea]];
    [secondOfficerLabel setText:[_currentManager otherManagerNameSurname]];
    [secondOfficerPhoneLabel setText:[_currentManager otherManagerPhone]];
    
    if ([[SCSManager currentManager] otherManagerPhone] != nil && ![[[SCSManager currentManager] otherManagerPhone] isEqualToString:@""]) {
        [secondOfficerPhoneView setUserInteractionEnabled:YES];
        [secondOfficerPhoneView setBackgroundImage:[UIImage imageNamed:@"phone_highlighted.png"] forState:UIControlStateHighlighted];
        [secondOfficerPhoneView setBackgroundImage:nil forState:UIControlStateNormal];
        [secondOfficerPhoneView addTarget:self action:@selector(callManager) forControlEvents:UIControlEventTouchUpInside];
    }

}
- (void) callManager {
    NSMutableString* phoneNumber = [NSMutableString stringWithString:[[SCSManager currentManager] otherManagerPhone]];
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
