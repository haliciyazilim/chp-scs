//
//  SCSPDFWebView.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/18/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSPDFWebView.h"
#import <QuartzCore/QuartzCore.h>

@implementation SCSPDFWebView
{
    UIActivityIndicatorView* activityIndicator;
    VoidBlock closeBlock;
}
- (id)initWithViewController:(SCSViewController *)viewController
{
    if(self = [super init]){
        self.viewController = viewController;
        
        self.frame = CGRectMake(0.0,
                                44.0,
                                viewController.view.frame.size.width,
                                viewController.view.frame.size.height-44.0);
        [self setScalesPageToFit:YES];
        [viewController.view insertSubview:self belowSubview:viewController.topBar];
        [self initBackButton];
        [self initPrintButton];
        [[[PLACFileCache alloc] initWithDirectory:
          [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"pdf"] maxSize:100*1024*1024] setDelegate:self];
        [self setHidden:YES];
    }
    return self;
}

- (void) initBackButton
{
    
    self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.backButton setFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
    [self.backButton addTarget:self action:@selector(hideWebView) forControlEvents:UIControlEventTouchUpInside];
    [self.viewController.view addSubview:self.backButton];
    [self.backButton setBackgroundColor:[UIColor greenColor]];
    [self.backButton setTitle:@"X" forState:UIControlStateNormal];
    [self.backButton setHidden:YES];
}

- (void) initPrintButton
{
    self.printButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.printButton setFrame:CGRectMake(self.viewController.view.frame.size.width-49.0, 0.0, 44.0, 44.0)];
    [self.printButton addTarget:self action:@selector(printPdf) forControlEvents:UIControlEventTouchUpInside];
    [self.viewController.view addSubview:self.printButton];
    [self.printButton setBackgroundColor:[UIColor blueColor]];
    [self.printButton setTitle:@"P" forState:UIControlStateNormal];
    [self.printButton.layer setCornerRadius:10.0];
    [self.printButton setHidden:YES];
}

- (void) printPdf
{
    
}

- (void) showPdfWithUrl:(NSString*)url
{
    [self setHidden:NO];
    [self.backButton setHidden:NO];
    [self.printButton setHidden:NO];
    self.transform = CGAffineTransformMakeTranslation(0.0, self.frame.size.height);
    [self setWebViewUrl:url];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    }];
    self.backButton.transform = CGAffineTransformMakeTranslation(0.0, -self.backButton.frame.size.height);
    [self.printButton setAlpha:0.0];
    [UIView animateWithDuration:0.3 animations:^{
        self.backButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    }];
    self.printButton.transform = CGAffineTransformMakeTranslation(0.0, 5.0);
    [UIView animateWithDuration:0.5 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.printButton.alpha = 1.0;
        self.printButton.transform = CGAffineTransformMakeTranslation(0.0, 0.0);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (void) setWebViewUrl:(NSString*)url
{
    NSData* result = [[PLACFileCache sharedCache] manageURL:url];
    if(result == nil){
        if(activityIndicator == nil)
            activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self addSubview:activityIndicator];
        [activityIndicator startAnimating];
        [activityIndicator setFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        
    } else {
        [activityIndicator stopAnimating];
        [activityIndicator removeFromSuperview];
        activityIndicator = nil;
        
        NSString* filePath = [[PLACFileCache sharedCache] filePathForUrl:url];
        [self loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL fileURLWithPath:filePath]]];
    }
}

- (void) hideWebView
{
    [UIView animateWithDuration:0.5 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0.0, self.frame.size.height);
    } completion:^(BOOL finished) {
        [self setHidden:YES];
        closeBlock();
    }];
    [UIView animateWithDuration:0.3 animations:^{
        self.backButton.transform = CGAffineTransformMakeTranslation(0.0, -self.backButton.frame.size.height);
        self.printButton.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self.backButton setHidden:YES];
        [self.printButton setHidden:YES];
    }];
}

- (void)setCloseCallback:(VoidBlock)block
{
    closeBlock = block;
}

- (void) fileCache:(PLACFileCache *)cache didFailWithError:(NSError *)error
{
    
}

- (void) fileCache:(PLACFileCache *)cache didLoadFile:(NSData *)fileData withTransform:(NSString *)transformIdentifier fromURL:(NSString *)url
{
    [self setWebViewUrl:url];
}



@end
