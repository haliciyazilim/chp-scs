//
//  SCSSecmenCell.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 7/4/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSSecmenCell.h"

@implementation SCSSecmenCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        _secmenNameLabel = [UILabel new];
        _secmenNumberLabel = [UILabel new];
        [self addSubview:self.secmenNumberLabel];
        [self addSubview:self.secmenNameLabel];
        [self.secmenNameLabel setBackgroundColor:[UIColor clearColor]];
        [self.secmenNumberLabel setBackgroundColor:[UIColor clearColor]];
        [self setFrame:self.frame];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.secmenNumberLabel.frame = CGRectMake(0.0, 0.0, frame.size.width*0.25, frame.size.height);
    self.secmenNameLabel.frame = CGRectMake(frame.size.width*0.25, 0.0, frame.size.width*0.75, frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
