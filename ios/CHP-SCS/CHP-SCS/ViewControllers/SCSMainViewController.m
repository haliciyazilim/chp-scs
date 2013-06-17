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

@interface SCSMainViewController ()

@end

@implementation SCSMainViewController
{
    UIImageView* officerImageView;
    UILabel* yearLabel;
    UILabel* headerLabel;
    UILabel* nameLabel;
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
    
    CGFloat chestNoY = 210.0;
    
    UIImageView* cardBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_bg.png"]];
    [cardBackground setFrame:CGRectMake(0.0, topBarHeight, frame.size.width, cardHeight)];
    
    officerImageView = [[UIImageView alloc] initWithFrame:CGRectMake(xOffset, topBarHeight+yOffset, imageWidth, imageWidth)];
    [officerImageView setBackgroundColor:[UIColor clearColor]];
    officerImageView.layer.borderWidth = 2.0;
    officerImageView.layer.borderColor = [CARD_OFFICER_IMAGE_BORDER_COLOR CGColor];
    [officerImageView setContentMode:UIViewContentModeScaleAspectFill];
    
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
    
    UILabel* chestNoHeader = [[UILabel alloc] initWithFrame:CGRectMake(xOffset+3, chestNoY, 100.0, 20.0)];
    [chestNoHeader setBackgroundColor:[UIColor clearColor]];
    [chestNoHeader setFont:MAIN_CONTENT_SUBHEADER_TEXT_FONT];
    [chestNoHeader setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [chestNoHeader setText:@"Sandık No"];
    
    [self.view addSubview:cardBackground];
    [self.view addSubview:officerImageView];
    [self.view addSubview:yearLabel];
    [self.view addSubview:headerLabel];
    [self.view addSubview:cardSeperator];
    [self.view addSubview:nameLabel];
    [self.view addSubview:chestNoHeader];
    
    [self configureViews];
}
- (void) configureViews {
    [officerImageView setImage:[UIImage imageNamed:@"dummy.jpg"]];
    [yearLabel setText:@"2013"];
    [headerLabel setText:@"SANDIK ÇEVRESİ SORUMLUSU KARTI"];
    [nameLabel setText:@"Ebuzer Egemen Dursun"];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
