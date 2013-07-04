//
//  SCSSandikBilgiKartiViewController.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSSandikBilgiKartiViewController.h"
#import "SCSManager.h"
@interface SCSSandikBilgiKartiViewController ()

@end

@implementation SCSSandikBilgiKartiViewController

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
    _webView = [[UIWebView alloc] init];
    self.webView.frame = CGRectMake(0.0, self.topBar.frame.size.height, self.view.frame.size.width,self.view.frame.size.height - self.topBar.frame.size.height);
    [self.view addSubview:self.webView];
    [self.webView setScalesPageToFit:YES];
    NSURL* url = [NSURL URLWithString:[[SCSManager currentManager] chestInformationCardUrl]];
    NSLog(@"url: %@",url);
    [self.webView loadRequest:[NSURLRequest requestWithURL:url]];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
