//
//  DZReminderListController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 23/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZReminderListController.h"
#import "DZReminderData.h"

@interface DZReminderListController ()
@property(nonatomic, strong) NSMutableArray<DZReminderData *> *reminderListData;
@end

@implementation DZReminderListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = AppDefaultSubViewBackgroundColor;
    self.tableView.separatorStyle = NO;
    
    [self requestData];
    [self setUI];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _reminderListData.count;
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
    
    if (cell == nil) {
        cell = [UITableViewCell DZDetailCellWithTextHeight:30 DetailHeight:26 TextSize:25 DetailSize:15 Text:@"" Detail:@"" Reuseid:identifer];
        
        UIView *footerLine = [UIView SeperatorLineWithX:15 Y:55];
        UISwitch *switchview = [UISwitch defaultSwitchWithY:5];
        
        [cell addSubview:footerLine];
        [cell addSubview:switchview];
    }
    
    NSString *clock = _reminderListData[indexPath.row].remindTime;
    NSMutableArray *days = _reminderListData[indexPath.row].remindDays;
    NSString *daysString = @"";
    UILabel *tmplabel;
    
    for (int i = 0; i < days.count; i++) {
        daysString = [daysString stringByAppendingFormat:@"%@ ", days[i]];
    }
    
    tmplabel = [cell.contentView.subviews objectAtIndex:0];
    tmplabel.text = clock;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:1];
    tmplabel.text = daysString;
    
    
    return cell;
}


#pragma Dora functions

- (void) requestData {
    _reminderListData = [[NSMutableArray alloc] init];
    DZReminderData *tmpdata = [[DZReminderData alloc] init];
    tmpdata.remindDays = [[NSMutableArray alloc] init];
    
    [tmpdata.remindDays addObject:@"Sunday"];
    [tmpdata.remindDays addObject:@"Friday"];
    tmpdata.remindTime = @"8:00";
    [_reminderListData addObject:tmpdata];
    [_reminderListData addObject:tmpdata];
    
    //NSLog(@"%@", tmpdata.remindDays);
}

- (void) setUI {
    
}

@end
