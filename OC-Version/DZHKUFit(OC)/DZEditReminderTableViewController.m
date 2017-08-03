//
//  DZEditReminderTableViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 23/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZEditReminderTableViewController.h"

@interface DZEditReminderTableViewController ()

@property(nonatomic, strong) NSArray *days;
@property(nonatomic, strong) NSArray *labels;
@property(nonatomic, strong) NSMutableDictionary *dataList;
@property(nonatomic, strong) NSMutableArray *reminderListData;

@end

@implementation DZEditReminderTableViewController {
    UIDatePicker *picker;
    NSInteger numOfSection;
    NSMutableArray<DZIconsImageView *> *checkIconsForLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone target:self action:@selector(AddReminder:)];
    
    [self initValues];
    [self requestData];
}



#pragma mark - Dora's functions

- (void) initValues {
    
    /**  reminder data  */
    _days = @[@"每周日", @"每周一", @"每周二", @"每周三", @"每周四", @"每周五", @"每周六"];
    _labels = @[@"清晨舒展", @"工作间隙休息", @"日常锻炼"];
    checkIconsForLabel = [[NSMutableArray alloc] init];
    numOfSection = 3;
}

- (void) requestData {
    NSString *filePath;
    
    filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/reminder.plist"];
    
    _reminderListData = [[NSMutableArray alloc] initWithContentsOfFile:filePath];
    
    
    if (_reminderNo == 0) {
        _dataList = [[NSMutableDictionary alloc] init];
    } else {
        _dataList = _reminderListData[_reminderNo];
    }
   
    
    //NSLog(@"%@", _dataList);
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return numOfSection;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 1) {
        return _days.count;
    } else if (section == 2) {
        return _labels.count;
    } else {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    UIView *wrapper = [[UIView alloc] init];
    
    wrapper.backgroundColor = AppDefaultBackgroundColor;

    return wrapper;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 180;
    }
    
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"editremindercell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    
    if (indexPath.section == 0) {
        picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, 170)];
        //picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
        picker.timeZone = [NSTimeZone localTimeZone];
        picker.datePickerMode = UIDatePickerModeTime;
        picker.datePickerMode = UIDatePickerModeTime;
        [cell.contentView addSubview: picker];
        
    } else {
        
        cell.textLabel.textColor = AppDefaultFontColor;
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        
        DZIconsImageView *check = [DZIconsImageView DZIconWithXPos:DZScreenW-31 yPos:10 IconName:@"check"];
        DZUIButtonWithParameter *btn = [[DZUIButtonWithParameter alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, 40)];
        
        // set check icon
        if([[[_dataList objectForKey:@"days"] objectAtIndex:indexPath.row] boolValue]) {
            check.hidden = NO;
        } else {
            check.hidden = YES;
        }
        
        // set button
        btn.parameters = [[NSMutableDictionary alloc] init];
        [btn.parameters setObject:check forKey:@"checkItem"];
        
        // custom different sections
        if (indexPath.section == 1) {
            cell.textLabel.text = _days[indexPath.row];
            
            // bind event on button
            NSNumber *checkDay = [NSNumber numberWithInteger:indexPath.row];
            [btn.parameters setObject:checkDay forKey:@"checkDay"];
            [btn addTarget:self action:@selector(toCheckDays:) forControlEvents:UIControlEventTouchUpInside];
        } else {
            cell.textLabel.text = _labels[indexPath.row];
            
            // bind event on button
            NSString *labelString = _labels[indexPath.row];
            [btn.parameters setObject:labelString forKey:@"checkLabel"];
            [btn addTarget:self action:@selector(toCheckLabels:) forControlEvents:UIControlEventTouchUpInside];
            
            // add the check icon object into array for the function of ratio button
            [checkIconsForLabel addObject:check];
        }
        [cell addSubview:btn];
        [cell addSubview:check];

    }
    
    return cell;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (void) toCheckDays:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    DZIconsImageView *check = [btn.parameters objectForKey:@"checkItem"];
    NSNumber *checkDay = [btn.parameters objectForKey:@"checkDay"];
    
    if (check.hidden) {
        check.hidden = NO;
        [[_dataList objectForKey:@"days"] setObject:@YES atIndexedSubscript:checkDay.integerValue];
        
        NSLog(@"dataList:  %@", _dataList);
        NSLog(@"reminder reminderNo:  %@", _reminderListData[_reminderNo]);
    } else {
        check.hidden = YES;
        [[_dataList objectForKey:@"days"] setObject:@NO atIndexedSubscript:checkDay.integerValue];
    }
}

- (void) toCheckLabels:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    DZIconsImageView *check = [btn.parameters objectForKey:@"checkItem"];
    
    check.hidden = NO;
}

- (void) AddReminder:(id) sender {
    //NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    NSDate *date = picker.date;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    NSString  *clockString = [[NSString alloc]init];
    
    [dateFormatter setDateFormat:@"HH:mm t"];
    clockString = [dateFormatter stringFromDate:date];
    
    
    
}

//- (void) testPlist {
//
//    NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"test", nil];
//    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"/demo.plist"];
//
//    [array writeToFile:filePath atomically:YES];
//
//    NSMutableArray *testDic= [[NSMutableArray alloc] initWithContentsOfFile:filePath];
//
//
//
//    NSLog(@"%@", testDic);
//
//
//
//}


@end
