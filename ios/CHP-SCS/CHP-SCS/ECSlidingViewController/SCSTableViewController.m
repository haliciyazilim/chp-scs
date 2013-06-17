//
//  SCSTableViewController.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSTableViewController.h"
#import "ECSlidingViewController.h"
#import "SCSMenuViewController.h"
#import "TypeDefs.h"

#define TITLE @"title"
#define SUBTITLE @"subtitle"
#define FILES @"FILES"
#define URL @"url"
#define FILE_NAME @"file_name"

@interface SCSTableViewController ()

@end

@implementation SCSTableViewController
{
    UIWebView* webView;
    UIButton* backButton;
    NSArray* data;
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
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    [self.tableView setFrame:CGRectMake(0.0, 44.0, self.view.frame.size.width, self.view.frame.size.height-44.0)];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_TITLE];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_SUBTITLE];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_FILE];
    [self.view addSubview:self.tableView];
    
    data = @[
             @{
                 TITLE:@"Secime yonelik sandik cevresi orgutlenmesi",
                 SUBTITLE:@"Secime yonelik sandik cevresi orgutlenmesi",
                 FILES:@[
                         @{
                             FILE_NAME:@"Dokumani indir",
                             URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
                             }
                    ]
                 },
             @{
                 TITLE:@"Sandik cevresi sorumlulari hakkinda",
                 FILES:@[
                         @{
                             FILE_NAME:@"Genelgeyi indir",
                             URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
                             },
                         @{
                             FILE_NAME:@"Ek 1",
                             URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
                             },
                         @{
                             FILE_NAME:@"Ek 1",
                             URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
                             },
                         ]
                 }
         ];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
// Return the number of sections.
    return [data count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
// Return the number of rows in the section.
    int rowCount = 1;
    if([[data objectAtIndex:section] objectForKey:SUBTITLE]!= nil)
        rowCount++;
    rowCount += [[[data objectAtIndex:section] objectForKey:FILES] count];
    return  rowCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    if(indexPath.row == 0){
        cell = [tableView dequeueReusableCellWithIdentifier:SCSPDFCELL_TITLE forIndexPath:indexPath];
    }
    else if(indexPath.row == 1 && [[data objectAtIndex:indexPath.section] objectForKey:SUBTITLE]!= nil){
        cell = [tableView dequeueReusableCellWithIdentifier:SCSPDFCELL_SUBTITLE forIndexPath:indexPath];
    }
    else{
        cell = [tableView dequeueReusableCellWithIdentifier:SCSPDFCELL_FILE forIndexPath:indexPath];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self showPdfWithUrl:nil];
}

- (void) showPdfWithUrl:(NSString*)url
{
    if(webView == nil){
        webView = [[UIWebView alloc] initWithFrame:CGRectMake(0.0, 44.0, self.view.frame.size.width, self.view.frame.size.height-88.0)];
        [self.view addSubview:webView];
    }
    [webView setHidden:NO];
    if(backButton == nil){
        backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [backButton setFrame:CGRectMake(0.0, self.view.frame.size.height-44.0, self.view.frame.size.width, 44.0)];
        [backButton addTarget:self action:@selector(hideWebView) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:backButton];
        
    }
    [backButton setHidden:NO];
}

- (void) hideWebView
{
    [webView setHidden:YES];
    [backButton setHidden:YES];
    [self.tableView reloadData];
}

@end
