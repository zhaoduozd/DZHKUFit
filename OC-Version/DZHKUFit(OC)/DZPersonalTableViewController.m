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

@implementation DZPersonalTableViewController {
    float firstSectionHeight;
    float cellHeight;
    float sectionFooterHeight;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    NSLog(@"%@", self.view.subviews);
    self.view.backgroundColor = AppDefaultSubViewBackgroundColor;
    self.tableView.separatorStyle = NO;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _cellTitleList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }
    
    NSMutableArray *tmp = [_cellTitleList objectAtIndex:section];
    return tmp.count;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *sectionFooter = [[UILabel alloc] init];
    CGRect size = sectionFooter.frame;
    size.size.height = 10;
    size.size.width = DZScreenW;
    sectionFooter.frame = size;
    sectionFooter.backgroundColor = AppDefaultBackgroundColor;
    
    return sectionFooter;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return sectionFooterHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return firstSectionHeight;
    }
    
    return cellHeight;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifer = @"personalInfoCells";

    NSMutableArray *tmp = _cellTitleList[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    UIButton *tmpButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, 40)];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        
        // set cell
        if (indexPath.section == 0) {
            
            float imageHeight = firstSectionHeight - 40;
            UIImage *userimage = [UIImage imageNamed:tmp[1]];
            UIImageView *userimageview = [[UIImageView alloc] initWithImage:userimage];
            UIButton *personbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, firstSectionHeight)];
            
            UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(DZScreenW/2, 0, DZScreenW/2, firstSectionHeight)];
            
            userimageview.frame = CGRectMake(30, 20, imageHeight, imageHeight);
            [userimageview.layer setCornerRadius: imageHeight/2];
            userimageview.clipsToBounds = YES;
            
            username.textColor = [UIColor whiteColor];
            username.font = [UIFont boldSystemFontOfSize:16];
            username.textAlignment = UITextAlignmentLeft;
            username.text = tmp[0];
            
            cell.backgroundColor = AppDefaultBarTintColor;
            
            [cell addSubview:userimageview];
            [cell addSubview:username];
            [cell addSubview:personbtn];
            
        } else {
            UIView *tmpFootLine = [[UIView alloc] initWithFrame:CGRectMake(5, 39, DZScreenW-5, 1)];
            
            tmpFootLine.backgroundColor = AppDefaultBorderColorUI;
            
            cell.backgroundColor = AppDefaultSubViewBackgroundColor;
            cell.textLabel.textColor = AppDefaultFontColor;
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            
            [cell addSubview:tmpButton];
            [cell addSubview:tmpFootLine];
        }
        
    }
    
    if (indexPath.section > 0) {
        cell.textLabel.text = tmp[indexPath.row];
    }
    

    return cell;
}

#pragma mark - DZ method

- (void) setData {
    _cellTitleList = @[@[@"Miss Dora", @"defaultPosition"],@[@"今日运动推荐", @"今日饮食推荐"], @[@"运动历史", @"赞过的食物"], @[@"打卡", @"设置运动提醒"], @[@"身体数据"], @[@"退出登录"]];
    firstSectionHeight = 140.0;
    cellHeight = 40.0;
    sectionFooterHeight = 10.0;
}


@end
