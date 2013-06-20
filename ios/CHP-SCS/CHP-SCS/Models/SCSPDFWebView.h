//
//  SCSPDFWebView.h
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/18/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSViewController.h"
#import "PLACFileCache.h"
#import "TypeDefs.h"
#import "Config.h"

@interface SCSPDFWebView : UIWebView <PLACFileCacheDelegate>

@property UIButton* backButton;
@property UIButton* printButton;
@property SCSViewController* viewController;

- (id) initWithViewController:(SCSViewController*)viewController;

- (void) setCloseCallback:(VoidBlock)block;

- (void) showPdfWithUrl:(NSString*)url;

@end
