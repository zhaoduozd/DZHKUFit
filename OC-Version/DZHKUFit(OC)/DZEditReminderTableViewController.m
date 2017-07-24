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
@property(nonatomic, strong) NSArray *daysChecked;

@end

@implementation DZEditReminderTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _days = @[@"", @"每周日", @"每周一", @"每周二", @"每周三", @"每周四", @"每周五", @"每周六"];
    _daysChecked = @[@1, @0, @0, @1, @0, @0, @0];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"editremindercell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];
    }
    
    if (indexPath.row == 0) {
        
    } else {
        cell.textLabel.text = _days[indexPath.row];
        cell.textLabel.textColor = AppDefaultFontColor;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        DZIconsImageView *check = [DZIconsImageView DZIconWithXPos:DZScreenW-31 yPos:10 IconName:@"check"];

        
        
        
        DZUIButtonWithParameter *btn = [[DZUIButtonWithParameter alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, 40)];
        btn.parameters = [[NSMutableDictionary alloc] init];
        [btn.parameters setObject:check forKey:@"checkItem"];
        [btn.parameters setObject:_daysChecked[indexPath.row-1] forKey:@"isChecked"];
        //[btn.parameters setObject:daysIndex forKey:@"daysIndex"];
        
        [btn addTarget:self action:@selector(toCheck:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell addSubview:btn];
        [cell addSubview:check];
    }
    
    return cell;
}

- (void) toCheck:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    NSLog(@"to check");
    
}


@end
