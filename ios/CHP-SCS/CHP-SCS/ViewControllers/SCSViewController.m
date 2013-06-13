//
//  SCSViewController.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSViewController.h"
#import "ECSlidingViewController.h"
#import "SCSMenuViewController.h"
#import "TypeDefs.h"

@interface SCSViewController ()

@end

@implementation SCSViewController

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
    
    self.topBar = [[SCSTopBar alloc] init];
    
    [self.view addSubview:self.topBar];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0;
    self.view.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[SCSMenuViewController class]]) {
        self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SCSMenu"];
    }
    
    [self.view addGestureRecognizer:[self.slidingViewController panGesture]];
    [self.topBar.menuButton addTarget:self action:@selector(revealMenu) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view setBackgroundColor:MAIN_CONTENT_BACKGROUND_COLOR];
    

}

- (void) revealMenu {
    [self.slidingViewController anchorTopViewTo:ECRight];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
