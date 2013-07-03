//
//  SCSMenuViewController.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSMenuViewController.h"
#import "ECSlidingViewController.h"
#import "SCSViewController.h"
#import "TypeDefs.h"
#import "SCSMenuTableViewCell.h"

#define TITLE @"title"
#define IDENTIFIER @"identifier"
#define IMAGE @"image"

@interface SCSMenuViewController ()

@property (strong,nonatomic) NSArray *menu;

@end

@implementation SCSMenuViewController
{
    NSIndexPath* lastSelectedIndexPath;
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[SCSMenuTableViewCell class] forCellReuseIdentifier:@"MenuCell"];
    
    [self.tableView setScrollEnabled:NO];
    
    
    self.menu = @[
                  @{
                      },
                  @{
                      TITLE:@"Anasayfa",
                      IDENTIFIER:@"SCSMain",
                      IMAGE:@"icon_card_default.png"
                      },
                  @{
                      TITLE:@"Egitim Dokumanlari",
                      IDENTIFIER:@"Egitim",
                      IMAGE:@"icon_egitim_default.png"
                      },
                  @{
                      TITLE:@"Genelgeler",
                      IDENTIFIER:@"Genelgeler",
                      IMAGE:@"icon_genelgeler_default.png"
                      },
                  @{
                      TITLE:@"Sandik Bilgi Karti",
                      IDENTIFIER:@"SandikBilgiKarti",
                      IMAGE:@"icon_sandikbilgi_default.png"
                      },
                  @{
                      TITLE:@"Sandik Secmen Listesi",
                      IDENTIFIER:@"SandikSecmenListesi",
                      IMAGE:@"icon_sandiksecmen_default.png"
                      },
                  @{
                      TITLE:@"Iletisim",
                      IDENTIFIER:@"Iletisim",
                      IMAGE:@"icon_iletisim_default.png"
                      },
              ];
    
    [self.slidingViewController setAnchorRightRevealAmount:200.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    [self.tableView setBackgroundColor:MENU_BACKGROUND_COLOR];
    [self.tableView setSeparatorColor:MENU_SEPERATOR_COLOR];
    [self initHeader];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}
- (void)viewWillAppear:(BOOL)animated
{
    
    if(lastSelectedIndexPath == nil){
        lastSelectedIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
    }
    [self.tableView selectRowAtIndexPath:lastSelectedIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void) initHeader
{
    
    UIImageView* header = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_header.png"]];
    
    [self.tableView addSubview:header];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.menu count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MenuCell";
    SCSMenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
//    if (!cell) {
//        cell = [[SCSMenuTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
//    }
    if(indexPath.row != 0){
        cell.cellTitle.text = [[self.menu objectAtIndex:indexPath.row] objectForKey:TITLE];
        [cell.cellIcon setImage:[UIImage imageNamed:[[self.menu objectAtIndex:indexPath.row] objectForKey:IMAGE]]];
        
    }
    
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row != 0){
        lastSelectedIndexPath = indexPath;
        NSString *identifier = [[self.menu objectAtIndex:indexPath.row] objectForKey:IDENTIFIER];
        
        SCSViewController *newViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
        [newViewController setTopBarTitle:[[self.menu objectAtIndex:indexPath.row] objectForKey:TITLE]];
        [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
            CGRect frame = self.slidingViewController.topViewController.view.frame;
            self.slidingViewController.topViewController = newViewController;
            self.slidingViewController.topViewController.view.frame = frame;
            [self.slidingViewController resetTopView];
        }];
    }
    
}

@end
