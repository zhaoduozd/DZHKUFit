//
//  DZPersonalReminderSettingViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalReminderSettingViewController.h"
#import "UIView+FooterLine.h"
#import "UILabel+DefaultTableLabel.h"
#import "UISwitch+DefaultSwitch.h"

@interface DZPersonalReminderSettingViewController ()

@property(nonatomic, strong) UISwitch *reminderSwitch;

@end

@implementation DZPersonalReminderSettingViewController {
    bool reminderOpen;
    float reminderSwitchWidth;
    float reminderSwitchHeight;
    float reminderSwitchCellHeight;
    float reminderCellHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setInitValues];
    [self setUI];
}

- (void) setInitValues {
    reminderSwitchCellHeight = 40;
    reminderCellHeight = 50;
    reminderSwitchHeight = 20;
    reminderSwitchWidth = 30;
    reminderOpen = YES;
}

- (void) setUI {
    [self addReminderSwitch];
    if (reminderOpen == YES) {
        [self setReminders];
    }
}

- (void) addReminderSwitch {
    UIView *footerLine = [UIView footerLineWithX:0 Y:0];
    UIView *headerLine = [UIView footerLineWithX:0 Y:reminderSwitchCellHeight];
    UIView *reminderSwitchCell = [[UIView alloc] initWithFrame:CGRectMake(0, 10, DZScreenW, reminderSwitchCellHeight)];
    UILabel *label = [UILabel defaultTableLabelWithText:@"运动提醒" yPos:0 isBold:NO];
    
    reminderSwitchCell.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    _reminderSwitch = [UISwitch defaultSwitchWithY:10];
    [_reminderSwitch setOn:reminderOpen];
    
    NSLog(@"%@", label.text);
    
    [reminderSwitchCell addSubview:footerLine];
    [reminderSwitchCell addSubview:headerLine];
    [reminderSwitchCell addSubview:_reminderSwitch];
    [reminderSwitchCell addSubview:label];
    
    [self.view addSubview:reminderSwitchCell];
}

- (void) setReminders {
    
}

@end
