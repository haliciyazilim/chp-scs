//
//  SCSMenuTableViewCell.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSMenuTableViewCell.h"
#import "TypeDefs.h"


@implementation SCSMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView* backgroundView = [[UIView alloc] init];
        [backgroundView setBackgroundColor:MENU_SEPERATOR_COLOR];
    
        [self setSelectedBackgroundView:backgroundView];
        [self.textLabel setTextColor:MENU_TEXT_COLOR];
        [self.textLabel setFont:MENU_TEXT_FONT];
        [self.textLabel setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.3]];
        [self.textLabel setShadowOffset:CGSizeMake(0.0, 1.0)];
        
//        UIView* seperator = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, 1.0)];
//        [seperator setBackgroundColor:MENU_SEPERATOR_COLOR];
//        [self addSubview:seperator];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
