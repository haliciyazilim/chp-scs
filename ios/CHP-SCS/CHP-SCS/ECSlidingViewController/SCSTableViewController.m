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
#import "SCSPDFWebView.h"
//#import "APIManager.h"
#import "SCSManager.h"


#define PLACFileCacheTransformIdentifier @"PDF_FILE"

@interface SCSTableViewController ()

@end

@implementation SCSTableViewController
{
    SCSPDFWebView* webView;
    UIButton* backButton;
    UIButton* printButton;
    NSArray* data;
    UIActivityIndicatorView* activityIndicator;
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
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.tableView setFrame:CGRectMake(0.0, 44.0, self.view.frame.size.width, self.view.frame.size.height-44.0)];
    UIView* view = [UIView new];
    [view setBackgroundColor:MAIN_CONTENT_BACKGROUND_COLOR];
    [self.tableView setBackgroundView:view];
    [self.tableView setSeparatorColor:PDF_TABLE_CELL_SEPERATOR_COLOR];
    [self.tableView setDelegate:self];
    [self.tableView setDataSource:self];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_TITLE];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_SUBTITLE];
    [self.tableView registerClass:[SCSTablePdfCell class] forCellReuseIdentifier:SCSPDFCELL_FILE];
    [self.view insertSubview:self.tableView belowSubview:self.topBar];
    
//    data = @[
//             @{
//                 DOCUMENTS_DOCUMENT_TITLE:@"Secime yonelik sandik cevresi orgutlenmesi",
//                 DOCUMENTS_DOCUMENT_DESCRIPTION:@"Scme ve scilme hakki Scme ve scilme hakki Scme ve scilme hakki Scme ve scilme hakki Scme ve scilme hakki Scme ve scilme hakki",
//                 DOCUMENTS_DOCUMENT_FILES:@[
//                         @{
//                             DOCUMENTS_FILE_NAME:@"Dokumani indir",
//                             DOCUMENTS_FILE_URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
//                             }
//                    ]
//                 },
//             @{
//                 DOCUMENTS_DOCUMENT_TITLE:@"Sandik cevresi sorumlulari hakkinda",
//                 DOCUMENTS_DOCUMENT_FILES:@[
//                         @{
//                             DOCUMENTS_FILE_NAME:@"Genelgeyi indir",
//                             DOCUMENTS_FILE_URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
//                             },
//                         @{
//                             DOCUMENTS_FILE_NAME:@"Ek 1",
//                             DOCUMENTS_FILE_URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
//                             },
//                         @{
//                             DOCUMENTS_FILE_NAME:@"Ek 1",
//                             DOCUMENTS_FILE_URL:@"http://www.irs.gov/pub/irs-pdf/fw4.pdf"
//                             },
//                         ]
//                 }
//         ];
    data = [self getData];
    webView = [[SCSPDFWebView alloc] initWithViewController:self];
    __weak SCSTableViewController* viewController = self;
    [webView setCloseCallback:^{
        [viewController.tableView reloadData];
    }];
}

- (NSArray *)getData
{
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
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
    if([[[data objectAtIndex:section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION] class] != [NSNull class])
        rowCount++;
    rowCount += [[[data objectAtIndex:section] objectForKey:DOCUMENTS_DOCUMENT_FILES] count];
    return  rowCount;
}

- (NSString*) cellIdentifierForRowAtIndexPath:(NSIndexPath*)indexPath
{
    if(indexPath.row == 0){
        return SCSPDFCELL_TITLE;
    }
    else if(indexPath.row == 1 && [[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION] class]!= [NSNull class]){
        return SCSPDFCELL_SUBTITLE;
    }
    else{
        return SCSPDFCELL_FILE;
    }
}

- (NSString*) textForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSString* text;
    if(indexPath.row == 0){
        text = [[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_TITLE];
    }
    else if(indexPath.row == 1 && [[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION] class]!= [NSNull class]){
        text = [[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION];
    }
    else{
        int index = indexPath.row -1 - ([[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION] class]!= [NSNull class] ? 1 : 0);
        text = [[[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_FILES] objectAtIndex:index] objectForKey:DOCUMENTS_FILE_NAME];
    }
    return text;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSString* text;
    cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifierForRowAtIndexPath:indexPath] forIndexPath:indexPath];
    text = [self textForRowAtIndexPath:indexPath];
    cell.frame = CGRectMake(0.0, cell.frame.origin.y, self.tableView.frame.size.width, cell.frame.size.height);
    [cell.textLabel setText:text];
    [cell.textLabel setNumberOfLines:0];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* text = [self textForRowAtIndexPath:indexPath];
    NSString* identifier = [self cellIdentifierForRowAtIndexPath:indexPath];
    UIFont* font;

    if([identifier isEqualToString:SCSPDFCELL_FILE]){
        font = PDF_TABLE_CELL_FILENAME_FONT;
    }
    else if([identifier isEqualToString:SCSPDFCELL_TITLE]){
        font = PDF_TABLE_CELL_TITLE_FONT;
    }
    else if([identifier isEqualToString:SCSPDFCELL_SUBTITLE]){
        font = PDF_TABLE_CELL_SUBTITLE_FONT;
    }

    CGSize size= [text sizeWithFont:font constrainedToSize:CGSizeMake(300.0, 500.0) lineBreakMode:NSLineBreakByWordWrapping];
    size.height += 20.0;
    if(size.height < 44.0)
        size.height = 44.0;
    return size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = indexPath.row -1 - ([[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_DESCRIPTION] class]!= [NSNull class] ? 1 : 0);
    [webView showPdfWithUrl:[[[[data objectAtIndex:indexPath.section] objectForKey:DOCUMENTS_DOCUMENT_FILES] objectAtIndex:index] objectForKey:DOCUMENTS_FILE_URL]];
}

@end
