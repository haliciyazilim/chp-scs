//
//  SCSTablePdfCell.m
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/14/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSTablePdfCell.h"
#import "TypeDefs.h"

@implementation SCSTablePdfCell
{
    UIView* backgroundView;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCommonView];
        if([reuseIdentifier isEqualToString:SCSPDFCELL_FILE]){
            [self stylizeForFile];
        }
        else if([reuseIdentifier isEqualToString:SCSPDFCELL_TITLE]){
            [self stylizeForTitle];
        }
        else if([reuseIdentifier isEqualToString:SCSPDFCELL_SUBTITLE]){
            [self stylizeForSubtitle];
        }
        
    }
    return self;
}

- (void) initCommonView
{
    backgroundView = [UIView new];
    [backgroundView setBackgroundColor:[UIColor clearColor]];
    [self setBackgroundView:backgroundView];
    
    [self.textLabel setBackgroundColor:[UIColor clearColor]];

}


- (void) stylizeForFile
{
    [self setSelectionStyle:UITableViewCellSelectionStyleBlue];
    [backgroundView setBackgroundColor:[UIColor clearColor]];
    [self.textLabel setFont:PDF_TABLE_CELL_FILENAME_FONT];
    [self.textLabel setTextColor:TOP_BAR_TEXT_COLOR];
    [self.textLabel setShadowOffset:CGSizeMake(0.0, 1.0)];
    [self.textLabel setShadowColor:[UIColor blackColor]];
    [self.imageView setImage:[UIImage imageNamed:@"icon_doc.png"]];
    UIView* view = [UIView new];
    [view setBackgroundColor:[UIColor blackColor]];
    [self setSelectedBackgroundView:view];
}

- (void) stylizeForTitle
{
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [backgroundView setBackgroundColor:MENU_BACKGROUND_COLOR];
    [self setUserInteractionEnabled:NO];
    [self.textLabel setFont:PDF_TABLE_CELL_TITLE_FONT];
    [self.textLabel setTextColor:MAIN_CONTENT_SUBHEADER_TEXT_COLOR];
    [self.textLabel setShadowColor:[UIColor blackColor]];
    [self.textLabel setShadowOffset:CGSizeMake(0.0, 1.0)];
}


- (void) stylizeForSubtitle
{
    
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    [backgroundView setBackgroundColor:MENU_BACKGROUND_COLOR];
    [self setUserInteractionEnabled:NO];
    [self.textLabel setFont:PDF_TABLE_CELL_SUBTITLE_FONT];
    [self.textLabel setTextColor:PDF_TABLE_CELL_SUBTITLE_TEXT_FONT];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
