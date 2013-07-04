//
//  SCSSandikSecmenListesiViewController.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSSandikSecmenListesiViewController.h"
#import "SCSSecmenCell.h"
#import "SCSManager.h"
#import "Config.h"
@interface SCSSandikSecmenListesiViewController ()

@end

@implementation SCSSandikSecmenListesiViewController
{
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

- (void) reloadData
{
    data = [[[SCSManager currentManager] voterList] objectForKey:VOTER_LIST_VOTERS];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reloadData];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, self.topBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-self.topBar.frame.size.height) style:UITableViewStylePlain];
    [self.tableView setDataSource:self];
    [self.tableView setDelegate:self];
    [self.tableView registerClass:[SCSSecmenCell class] forCellReuseIdentifier:@"SecmenCell"];
    [self.view addSubview:self.tableView];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.tableView setSeparatorColor:PDF_TABLE_CELL_SEPERATOR_COLOR];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 0;
    return [data count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SCSSecmenCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"SecmenCell"];
    NSDictionary* dict = [data objectAtIndex:indexPath.row];
    NSString* name = [dict objectForKey:VOTER_LIST_VOTER_NAME];

    [cell.secmenNameLabel setText:[name capitalizedStringWithLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"tr"]]];
    [cell.secmenNumberLabel setText:[NSString stringWithFormat:@"%@",[dict objectForKey:VOTER_LIST_VOTER_NUMBER]]];
    return  cell;

}
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
    
    [headerView setBackgroundColor:[UIColor colorWithRed:0.420 green:0.227 blue:0.227 alpha:0.85]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, tableView.bounds.size.width, 30)];
    if(section == 0){
        
        label.text = [NSString stringWithFormat:@"Sandık No: %@           Seçmen Sayısı: %d ",
                      [[[SCSManager currentManager] voterList] objectForKey:VOTER_LIST_CHEST_NUMBER], [data count]];
        [headerView setBackgroundColor:[TOP_BAR_BACKGROUND_COLOR colorWithAlphaComponent:0.7]];

    }
    else if(section == 1){
        label.text = @"Sıra No    Seçmen Adı";
        [headerView setBackgroundColor:[MENU_BACKGROUND_COLOR colorWithAlphaComponent:0.7]];
    }
    label.font = SECMEN_CELL_NUMBER_FONT;
    label.textColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.75];
    label.backgroundColor = [UIColor clearColor];
    [headerView addSubview:label];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
