//
//  SCSTopBar.m
//  CHP-SCS
//
//  Created by Alperen Kavun on 13.06.2013.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#import "SCSTopBar.h"

@implementation SCSTopBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id) init {
    
    if (self = [super init]) {
        
        CGRect frame = [[UIScreen mainScreen] bounds];
        
        [self setFrame:CGRectMake(0.0, 0.0, frame.size.width, 44.0)];
        
        self.barTitle = [[UILabel alloc] initWithFrame:CGRectMake(45.0, 0.0, 220.0, self.frame.size.height)];
        [self.barTitle setBackgroundColor:[UIColor redColor]];
        [self.barTitle setTextColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0]];
//        [self.barTitle setFont:[UIFont fontWithName:@"" size:10.0]];
        [self.barTitle setText:@"barTitle Text"];
        [self.barTitle setTextAlignment:NSTextAlignmentLeft];
        
        self.menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.menuButton setFrame:CGRectMake(0.0, 0.0, 44.0, 44.0)];
        [self.menuButton setBackgroundColor:[UIColor blueColor]];
        
        [self addSubview:self.menuButton];
        [self addSubview:self.barTitle];
        
        [self setBackgroundColor:[UIColor yellowColor]];
    }
    
    return self;
}
- (void) setTitleText:(NSString *)title {
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
