//
//  DZReminderController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 25/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZReminderController.h"
#import "UILabel+DefaultTableLabel.h"
#import "UISwitch+DefaultSwitch.h"
#import "DZReminderData.h"
#import "DZReminderListController.h"
#import "DZEditReminderTableViewController.h"

@interface DZReminderController ()
@property(nonatomic, strong) NSString *reminderOn;
@property(nonatomic, strong) UISwitch *reminderSwitch;
@property(nonatomic, strong) DZUIButtonWithParameter *addReminderButton;
@property(nonatomic, strong) DZReminderListController *reminderList;
@end

@implementation DZReminderController{
    float reminderSwitchWidth;
    float reminderSwitchHeight;
    float reminderSwitchCellHeight;
    float reminderCellHeight;
    BOOL isAddReminderListController;
    NSUserDefaults *defaults;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    
    [self CreateReminderPlist];
    [self InitValues];
    [self InitUI];
    
}

- (void) CreateReminderPlist {
    
    NSString *filePath;
    
    filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/reminder.plist"];
    
    if (![defaults boolForKey:@"reminderList"]) {
        NSMutableArray *reminderDataList = [[NSMutableArray alloc] init];
        NSMutableArray *days = [[NSMutableArray alloc] initWithObjects:@NO, @NO, @NO, @NO, @NO, @NO, @NO, nil];
        NSMutableArray *labels = [[NSMutableArray alloc] initWithObjects:@"清晨舒展", @"傍晚跑步", nil];
        NSString *labelSelected = @"";
        NSString *daysSelected = @"";
        NSMutableDictionary *defaultReminder = [[NSMutableDictionary alloc] init];
        
        [defaultReminder setObject:@"" forKey:@"time"];
        [defaultReminder setObject:days forKey:@"days"];
        [defaultReminder setObject:labels forKey:@"labels"];
        [defaultReminder setObject:labelSelected forKey:@"labelSlected"];
        [defaultReminder setObject:daysSelected forKey:@"daysSeleced"];
        [defaultReminder setObject:@"OFF" forKey:@"reminderOn"];
        
        [reminderDataList addObject:defaultReminder];
        [reminderDataList writeToFile:filePath atomically:YES];
        
        [defaults setBool:YES forKey:@"reminderList"];
    }
}

- (void) InitValues {
    reminderSwitchCellHeight = 40;
    reminderCellHeight = 50;
    reminderSwitchHeight = 20;
    reminderSwitchWidth = 30;
    isAddReminderListController = NO;
    _reminderOn = @"reminderOn";
}

- (void) InitUI {
    [self InitReminderSwitchCell];
    [self InitReminders];
}



/**  Init Reminder Switch Cell  */

- (void) InitReminderSwitchCell {
    UIView *footerLine = [UIView SeperatorLineWithX:0 Y:0];
    UIView *headerLine = [UIView SeperatorLineWithX:0 Y:reminderSwitchCellHeight];
    UIView *reminderSwitchCell = [[UIView alloc] initWithFrame:CGRectMake(0, 10, DZScreenW, reminderSwitchCellHeight)];
    UILabel *label = [UILabel DZDefaultTableLabelWithText:@"运动提醒" yPos:0 Height:40 IsBold:NO];
    
    reminderSwitchCell.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    [reminderSwitchCell addSubview:footerLine];
    [reminderSwitchCell addSubview:headerLine];
    [reminderSwitchCell addSubview:label];
    
    [self InitReminderSwitch];
    [reminderSwitchCell addSubview:_reminderSwitch];
    
    [self.view addSubview:reminderSwitchCell];
}

- (void) InitReminderSwitch {
    defaults = [NSUserDefaults standardUserDefaults];
    _reminderSwitch = [UISwitch defaultSwitchWithY:0];
    
    if ( [defaults objectForKey:_reminderOn] == nil ) {
        [_reminderSwitch setOn:YES];
        [defaults setBool:YES forKey:_reminderOn];
    } else {
        [_reminderSwitch setOn:[defaults boolForKey:_reminderOn]];
    }
    
    [_reminderSwitch addTarget:self action:@selector(ReminderSwitchOnOff:) forControlEvents:UIControlEventTouchUpInside];
}


/**  Init Reminder  */

- (void) InitReminders {
    
    if (!_reminderSwitch.isOn) {
        return;
    }
    
    if (isAddReminderListController) {
        if (_reminderList.reminderListData.count - 1 <= 0) {
            _reminderList.view.hidden = YES;
        } else {
            _reminderList.view.hidden = NO;
        }
        _addReminderButton.hidden = NO;
        return;
    }
    
    [self InitReminderButton];
    
    _reminderList = [[DZReminderListController alloc] init];
    
    CGRect frame = CGRectMake(0, 120, _reminderList.view.frame.size.width, _reminderList.view.frame.size.height);
    
    _reminderList.view.frame = frame;
    
    [self addChildViewController:_reminderList];
    [self.view addSubview:_reminderList.view];
    
    isAddReminderListController = YES;
    
    if (_reminderList.reminderListData.count - 1 <= 0) {
        _reminderList.view.hidden = YES;
    } else if (_reminderList.reminderListData.count > 1) {
        _reminderList.view.hidden = NO;
    }
}

- (void) InitReminderButton {
    _addReminderButton = [DZUIButtonWithParameter DZParameterLineBtnWithWidth:DZScreenW/3 Height:30 xPos:DZScreenW/3 yPos:70 Title:@"+ 添加运动提醒"];
    [_addReminderButton.parameters setObject:[[NSNumber alloc] initWithInteger:0] forKey:@"reminderNo"];
    [_addReminderButton addTarget:self action:@selector(GoToCreateReminder:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_addReminderButton];
}



#pragma makr - event handlers

- (void) ReminderSwitchOnOff:(id) sender {
    UISwitch *switchsender = (UISwitch *)sender;
    
    
    if (switchsender.isOn) {
        [self InitReminders];
        [defaults setBool:YES forKey:_reminderOn];
    } else {
        _reminderList.view.hidden = YES;
        _addReminderButton.hidden = YES;
        [defaults setBool:NO forKey:_reminderOn];
    }
    
    [defaults synchronize];
}

- (void) GoToCreateReminder:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    DZEditReminderTableViewController *vc = [[DZEditReminderTableViewController alloc] init];
    
    vc.reminderNo = [[btn.parameters objectForKey:@"reminderNo"] integerValue];
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
