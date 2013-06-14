//
//  SCSSecmenKartiViewController.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/13/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSSecmenKartiViewController.h"

@interface SCSSecmenKartiViewController ()

@end

@implementation SCSSecmenKartiViewController

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
    
    [self.topBar setTitleText:@"Secmen Karti"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
