//
//  DZReminderListController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 23/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZReminderListController.h"
#import "DZEditReminderTableViewController.h"

@interface DZReminderListController ()

@end

@implementation DZReminderListController {
    NSInteger x;
    NSString *filePath;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AppDefaultSubViewBackgroundColor;
    self.tableView.separatorStyle = NO;
    
    [self requestData];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _reminderListData.count - 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 56.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"reminderlisttabelcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    NSMutableDictionary *tmpcell = _reminderListData[indexPath.row+1];
    
    if (cell == nil) {
        cell = [UITableViewCell DZDetailCellWithTextHeight:30 DetailHeight:26 TextSize:25 DetailSize:15 Text:@"" Detail:@"" Reuseid:identifer];
        
        UIView *footerLine = [UIView SeperatorLineWithX:15 Y:55];
        DZUISwitchWithParameter *switchview = [DZUISwitchWithParameter defaultSwitchWithY:5];
        DZUIButtonWithParameter *btn = [[DZUIButtonWithParameter alloc] init];
        
        if ([[tmpcell objectForKey:@"remidnerOn"] isEqual: @"ON"]) {
            [switchview setOn:YES];
        } else {
            [switchview setOn:NO];
        }
        
        [switchview.parameters setObject:[[NSNumber alloc] initWithInteger:indexPath.row] forKey:@"switchNo"];
        [switchview addTarget:self action:@selector(SetOnOffReminder:) forControlEvents:UIControlEventTouchUpInside];
        
        [btn.parameters setObject:[[NSNumber alloc] initWithInteger:indexPath.row+1] forKey:@"reminderNo"];
        [cell addSubview:footerLine];
        [cell addSubview:switchview];
    }
    
    NSString *clock = [tmpcell objectForKey:@"time"];
    NSString *daysString = [tmpcell objectForKey:@"daysString"];
    NSString *labelString = [tmpcell objectForKey:@"selectedLabel"];
    UILabel *tmplabel;
    
    daysString = [labelString stringByAppendingFormat:@", %@ ", daysString];

    
    tmplabel = [cell.contentView.subviews objectAtIndex:0];
    tmplabel.text = clock;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:1];
    tmplabel.text = daysString;
    
    
    return cell;
}


#pragma mark - Dora functions

- (void) requestData {
    
    filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/reminder.plist"];
    
    _reminderListData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    if (_reminderListData.count == 1) {
        self.view.hidden = YES;
    }
}




#pragma mark - event handlers

- (void) SetOnOffReminder:(id) sender {
    DZUISwitchWithParameter *switchview = (DZUISwitchWithParameter *)sender;
    NSInteger switchNo = [[switchview.parameters objectForKey:@"switchNo"] integerValue];
    NSMutableDictionary *tmpReminder = [[NSMutableDictionary alloc] initWithDictionary:[self.reminderListData objectAtIndex:switchNo]];
    NSString *reminderOn;
    
    if (switchview.isOn) {
        reminderOn = @"ON";
        [self CreateReminder];
    } else {
        reminderOn = @"OFF";
        [self CancelReinder];
    }
    
    [tmpReminder setObject:reminderOn forKey:@"reminderON"];
    
}

- (void) GoToModifyReminder:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    DZEditReminderTableViewController *vc = [[DZEditReminderTableViewController alloc] init];
    
    vc.reminderNo = [[btn.parameters objectForKey:@"reminderNo"] integerValue];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) CancelReinder {
    
}

- (void) CreateReminder {
    
}




@end
