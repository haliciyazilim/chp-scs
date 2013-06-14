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
{
    
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView* backgroundView = [[UIView alloc] init];
        [backgroundView setBackgroundColor:MENU_SEPERATOR_COLOR];
    
        [self setSelectedBackgroundView:backgroundView];
        
        _cellIcon = [[UIImageView alloc] init];
        _cellTitle = [[UILabel alloc] init];
        
        [self.cellIcon setFrame:CGRectMake(6.0, 0.0, 44.0, self.frame.size.height)];
        [self.cellTitle setFrame:CGRectMake(59.0, 0.0, 250.0, self.frame.size.height)];
        
        [self.cellTitle setTextColor:MENU_TEXT_COLOR];
        [self.cellTitle setFont:MENU_TEXT_FONT];
        [self.cellTitle setShadowColor:[UIColor colorWithWhite:0.0 alpha:0.3]];
        [self.cellTitle setShadowOffset:CGSizeMake(0.0, 1.0)];
        [self.cellTitle setBackgroundColor:[UIColor clearColor]];
        
        [self addSubview:self.cellTitle];
        [self addSubview:self.cellIcon];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
