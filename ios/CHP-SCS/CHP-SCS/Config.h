//
//  Config.h
//  CHP-SCS
//
//  Created by Yunus Eren Guzel on 6/19/13.
//  Copyright (c) 2013 Halici. All rights reserved.
//

#ifndef CHP_SCS_Config_h
#define CHP_SCS_Config_h

// font names macros
#define LIGHT_FONT_NAME @"Swis721 Lt BT"
#define MEDIUM_FONT_NAME @"Swis721 Md BT"
#define THIN_FONT_NAME @"Swis721 Th BT"

// top bar related macros
#define TOP_BAR_BACKGROUND_COLOR [UIColor colorWithRed:166.0/255.0 green:56.0/255.0 blue:46.0/255.0 alpha:1.0]
#define TOP_BAR_TEXT_COLOR [UIColor colorWithRed:223.0/255.0 green:200.0/255.0 blue:187.0/255.0 alpha:1.0]
#define TOP_BAR_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:18.0]

// menu related macros
#define MENU_BACKGROUND_COLOR [UIColor colorWithRed:50.0/255.0 green:46.0/255.0 blue:37.0/255.0 alpha:1.0]
#define MENU_SEPERATOR_COLOR [UIColor colorWithRed:35.0/255.0 green:32.0/255.0 blue:26.0/255.0 alpha:1.0]
#define MENU_TEXT_COLOR [UIColor colorWithRed:130.0/255.0 green:123.0/255.0 blue:118.0/255.0 alpha:1.0]
#define MENU_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:18.0]
#define MENU_DESCRIPTION_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:12.0]


// main content related macros
#define MAIN_CONTENT_BACKGROUND_COLOR [UIColor colorWithRed:80.0/255.0 green:76.0/255.0 blue:64.0/255.0 alpha:1.0]
#define MAIN_CONTENT_SEPERATOR_COLOR [UIColor colorWithRed:50.0/255.0 green:46.0/255.0 blue:37.0/255.0 alpha:1.0]
#define MAIN_CONTENT_SUBHEADER_TEXT_COLOR [UIColor colorWithRed:244.0/255.0 green:61.0/255.0 blue:44.0/255.0 alpha:1.0]
#define MAIN_CONTENT_SUBHEADER_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:12.0]

// card related macros
#define CARD_YEAR_TEXT_COLOR [UIColor colorWithRed:80.0/255.0 green:76.0/255.0 blue:64.0/255.0 alpha:1.0]
#define CARD_YEAR_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:12.0]

#define CARD_HEADER_TEXT_COLOR [UIColor colorWithRed:217.0/255.0 green:74.0/255.0 blue:61.0/255.0 alpha:1.0]
#define CARD_HEADER_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:14.0]

#define CARD_NAME_TEXT_COLOR [UIColor colorWithRed:50.0/255.0 green:46.0/255.0 blue:37.0/255.0 alpha:1.0]
#define CARD_NAME_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:20.0]

#define CARD_CHEST_NO_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define CARD_CHEST_NO_TEXT_FONT [UIFont fontWithName:@"Swis721 Th BT" size:50.0]

#define CARD_PROVINCE_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define CARD_PROVINCE_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:17.0]

#define CARD_DISTRICT_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define CARD_DISTRICT_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:17.0]

#define CARD_OTHER_CONTENT_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define CARD_OTHER_CONTENT_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:17.0]

#define CARD_SECOND_OFFICER_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define CARD_SECOND_OFFICER_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:10.0]

#define CARD_OFFICER_IMAGE_BORDER_COLOR [UIColor colorWithRed:233.0/255.0 green:217.0/255.0 blue:208.0/255.0 alpha:1.0]

//PDF Table Cell 
#define PDF_TABLE_CELL_TITLE_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:18.0]
#define PDF_TABLE_CELL_SUBTITLE_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:12.0]
#define PDF_TABLE_CELL_FILENAME_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:15.0]

#define PDF_TABLE_CELL_SUBTITLE_TEXT_FONT [UIColor colorWithRed:158.0/255.0 green:157.0/255.0 blue:153.0/255.0 alpha:1.0]
#define PDF_TABLE_CELL_SEPERATOR_COLOR [UIColor colorWithRed:65.0/255.0 green:61.0/255.0 blue:50.0/255.0 alpha:1.0]

#define LOGIN_SCREEN_TITLE_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]
#define LOGIN_SCREEN_TITLE_FONT [UIFont fontWithName:@"Swis721 Th BT" size:22.0]

#define LOGIN_SCREEN_TEXT_COLOR [UIColor colorWithRed:50.0/255.0 green:46.0/255.0 blue:37.0/255.0 alpha:1.0]
#define LOGIN_SCREEN_TEXT_FONT [UIFont fontWithName:@"Swis721 Md BT" size:18.0]

#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size
#define LOGIN_SCREEN_TEXT_FIELDS_SIZE CGSizeMake(244.0, 44.0)
#define LOGIN_SCREEN_BUTTON_SIZE CGSizeMake(89.0, 44.0)
#define LOGIN_SCREEN_TEXT_FIELDS_COLOR [UIColor colorWithRed:223.0/255.0 green:200.0/255.0 blue:187.0/255.0 alpha:1.0]
#define LOGIN_SCREEN_BUTTON_COLOR [UIColor colorWithRed:217.0/255.0 green:74.0/255.0 blue:61.0/255.0 alpha:1.0]
#define LOGIN_SCREEN_BUTTON_HIGHLIGHTED_COLOR [UIColor colorWithRed:50.0/255.0 green:46.0/255.0 blue:37.0/255.0 alpha:1.0]
#define LOGIN_SCREEN_BUTTON_TEXT_COLOR [UIColor colorWithWhite:1.0 alpha:1.0]

#define SECMEN_CELL_NAME_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:14.0]
#define SECMEN_CELL_NUMBER_FONT [UIFont fontWithName:@"Swis721 Md BT" size:14.0]

#define COMMUNICATION_HEADER_FONT [UIFont fontWithName:@"Swis721 Md BT" size:16.0]
#define COMMUNICATION_TEXT_FONT [UIFont fontWithName:@"Swis721 Lt BT" size:16.0]

#endif
