//
//  DZPersonalReminderSettingViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalReminderSettingViewController.h"
#import "UILabel+DefaultTableLabel.h"
#import "UISwitch+DefaultSwitch.h"
#import "DZReminderData.h"
#import "DZReminderListController.h"
#import "DZEditReminderTableViewController.h"

@interface DZPersonalReminderSettingViewController ()

@property(nonatomic, strong) UISwitch *reminderSwitch;
@property(nonatomic, strong) UIButton *addReminder;
@property(nonatomic, strong) DZReminderListController *reminderList;
@property(nonatomic, assign) BOOL isAddReminderListController;



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
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
}

- (void) setInitValues {
    reminderSwitchCellHeight = 40;
    reminderCellHeight = 50;
    reminderSwitchHeight = 20;
    reminderSwitchWidth = 30;
    reminderOpen = NO;
    _isAddReminderListController = NO;
}

- (void) setUI {
    [self addReminderSwitch];
    [self addReminderButton];
    if (reminderOpen == YES) {
        [self setReminders];
    }
}

- (void) addReminderSwitch {
    UIView *footerLine = [UIView SeperatorLineWithX:0 Y:0];
    UIView *headerLine = [UIView SeperatorLineWithX:0 Y:reminderSwitchCellHeight];
    UIView *reminderSwitchCell = [[UIView alloc] initWithFrame:CGRectMake(0, 10, DZScreenW, reminderSwitchCellHeight)];
    UILabel *label = [UILabel DZDefaultTableLabelWithText:@"运动提醒" yPos:0 Height:40 IsBold:NO];
    
    reminderSwitchCell.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    _reminderSwitch = [UISwitch defaultSwitchWithY:0];
    [_reminderSwitch setOn:reminderOpen];
    
    
    [_reminderSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [reminderSwitchCell addSubview:footerLine];
    [reminderSwitchCell addSubview:headerLine];
    [reminderSwitchCell addSubview:_reminderSwitch];
    [reminderSwitchCell addSubview:label];
    
    [self.view addSubview:reminderSwitchCell];
}

- (void) addReminderButton {
    self.addReminder = [UIButton DZDefaultLineBtnWithWidth:DZScreenW/3 Height:30 xPos:DZScreenW/3 yPos:70 Title:@"+ 添加运动提醒"];
    [_addReminder addTarget:self action:@selector(gotoCreateReminder:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addReminder];
}

- (void) setReminders {
    
//    if (_isAddReminderListController) {
//        _reminderList.view.hidden = NO;
//        return;
//    }
    _reminderList = [[DZReminderListController alloc] init];
    
    CGRect frame = CGRectMake(0, 120, _reminderList.view.frame.size.width, _reminderList.view.frame.size.height);
    
    _reminderList.view.frame = frame;
    
    //reminderList.view.backgroundColor = [UIColor redColor];
    
    [self addChildViewController:_reminderList];
    [self.view addSubview:_reminderList.view];
    _isAddReminderListController = YES;
}

- (void) switchAction:(id) sender {
    UISwitch *switchsender = (UISwitch *)sender;
    
    if (switchsender.isOn) {
        [self setReminders];
    } else {
        _reminderList.view.hidden = YES;
    }
}

- (void) gotoCreateReminder:(id) sender {
    DZEditReminderTableViewController *vc = [[DZEditReminderTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}




@end
