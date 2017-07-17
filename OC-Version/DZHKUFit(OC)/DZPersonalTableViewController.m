//
//  DZPersonalTableViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalTableViewController.h"

@interface DZPersonalTableViewController ()

@property(nonatomic, strong) NSArray *cellTitleList;

@end

@implementation DZPersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cellTitleList = @[@[@"今日饮食推荐", @"今日运动推荐"], @[@"运动历史", @"赞过的食物"], @[@"打卡", @"设置运动提醒"], @[@"身体数据"], @[@"退出登录"]];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return _cellTitleList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    //NSLog(@"%ld", (long)section);
    
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *sectionHeader = [[UILabel alloc] init];

    return sectionHeader;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"personalInfoCells";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifer];
    }
    cell.textLabel.text = @"123";
    //cell.detailTextLabel.text = _foodContents[indexPath.section].sectionData[indexPath.row].foodCarhdr;
    
    //设置text style
    //UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
    //cell.textLabel.font  = myFont;
    cell.textLabel.adjustsFontSizeToFitWidth = NO;
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
    
    
    
    cell.detailTextLabel.adjustsFontSizeToFitWidth = NO;
    cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    //cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
    
    

    
    //NSLog(@"%@", indexPath);
    return cell;
}







@end
