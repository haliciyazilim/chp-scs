//
//  SCSTableViewController.h
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCSViewController.h"
#import "SCSTablePdfCell.h"

@interface SCSTableViewController : SCSViewController <UITableViewDataSource,UITableViewDelegate>

@property (readonly,nonatomic) UITableView* tableView;

@end
