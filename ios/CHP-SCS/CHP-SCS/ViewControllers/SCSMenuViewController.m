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

#define TITLE @"title"
#define IDENTIFIER @"identifier"
#define IMAGE @"image"

@interface SCSMenuViewController ()

@property (strong,nonatomic) NSArray *menu;

@end

@implementation SCSMenuViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
//    self.menu = [NSArray arrayWithObjects:@"SCSMain", @"SCSSecond", nil];
    
    self.menu = @[
                  @{
                      TITLE:@"Anasayfa",
                      IDENTIFIER:@"SCSMain",
                      IMAGE:@"queen.jpg"
                      },
                  @{
                      TITLE:@"Egitim Dokumanlari",
                      IDENTIFIER:@"Egitim",
                      IMAGE:@"queen.jpg"
                      },
                  @{
                      TITLE:@"Genelgeler",
                      IDENTIFIER:@"Genelgeler",
                      IMAGE:@"queen.jpg"
                      },
                  @{
                      TITLE:@"Sandik Bilgi Karti",
                      IDENTIFIER:@"SandikBilgiKarti",
                      IMAGE:@"queen.jpg"
                      },
                  @{
                      TITLE:@"Sandik Secmen Listesi",
                      IDENTIFIER:@"SandikSecmenListesi",
                      IMAGE:@"queen.jpg"
                      },
                  @{
                      TITLE:@"Iletisim",
                      IDENTIFIER:@"Iletisim",
                      IMAGE:@"queen.jpg"
                      },
              ];
    
    [self.slidingViewController setAnchorRightRevealAmount:200.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
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
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    
    cell.textLabel.text = [[self.menu objectAtIndex:indexPath.row] objectForKey:TITLE];
    [cell.imageView setImage:[UIImage imageNamed:[[self.menu objectAtIndex:indexPath.row] objectForKey:IMAGE]]];
    // Configure the cell...
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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

@end
