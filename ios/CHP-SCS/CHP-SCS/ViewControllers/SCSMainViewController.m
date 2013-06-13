//
//  SCSMainViewController.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSMainViewController.h"

@interface SCSMainViewController ()

@end

@implementation SCSMainViewController

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
    
    CGRect frame = [[UIScreen mainScreen] bounds];
    
    [self.topBar setTitleText:@"Anasayfa"];
    
    UIImageView* cardBackground = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"card_bg.png"]];
    [cardBackground setFrame:CGRectMake(0.0, 44.0, frame.size.width, 135.0)];
    
    [self.view addSubview:cardBackground];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
