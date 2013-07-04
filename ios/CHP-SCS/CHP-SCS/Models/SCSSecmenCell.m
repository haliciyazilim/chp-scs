//
//  SCSSecmenCell.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 7/4/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSSecmenCell.h"
#import "Config.h"

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
        [self.secmenNameLabel setTextColor:TOP_BAR_TEXT_COLOR];
        [self.secmenNumberLabel setTextColor:TOP_BAR_TEXT_COLOR];
        [self.secmenNameLabel setFont:SECMEN_CELL_NAME_FONT];
        [self.secmenNumberLabel setFont:SECMEN_CELL_NUMBER_FONT];
        [self.secmenNumberLabel setTextAlignment:NSTextAlignmentRight];
        [self setFrame:self.frame];
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.secmenNumberLabel.frame = CGRectMake(0.0, 0.0, frame.size.width*0.15, frame.size.height);
    self.secmenNameLabel.frame = CGRectMake(frame.size.width*0.20, 0.0, frame.size.width*0.80, frame.size.height);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
