//
//  DZPersonalTableViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalTableViewController.h"
#import "DZPersonalCardViewController.h"
#import "DZPersonalExerciseRecomViewController.h"
#import "DZPersonalFoodRecomViewController.h"
#import "DZPersonalPhysicalDataViewController.h"
#import "DZPersonalExerciseHistoryViewController.h"
#import "DZPersonalFoodFavoritesViewController.h"
#import "DZPersonalReminderSettingViewController.h"
#import "DZLoginViewController.h"


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
    
    self.view.backgroundColor = AppDefaultSubViewBackgroundColor;
    self.tableView.separatorStyle = NO;
    self.navigationItem.title = @"";
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
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
    size.size.height = sectionFooterHeight;
    size.size.width = DZScreenW;
    sectionFooter.frame = size;
    sectionFooter.backgroundColor = AppDefaultBackgroundColor;
    
    UIView *tmpFootLine = [[UIView alloc] initWithFrame:CGRectMake(0, sectionFooterHeight, DZScreenW, 1)];
    UIView *tmpHeadLine = [[UIView alloc] initWithFrame:CGRectMake(0, -1, DZScreenW, 1)];
    
    tmpFootLine.backgroundColor = AppDefaultBorderColorUI;
    tmpHeadLine.backgroundColor = AppDefaultBorderColorUI;
    
    [sectionFooter addSubview:tmpFootLine];
    [sectionFooter addSubview:tmpHeadLine];
    
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
            
            float imageHeight = firstSectionHeight - 10;
            UIImage *userimage = [UIImage imageNamed:tmp[1]];
            UIImageView *userimageview = [[UIImageView alloc] initWithImage:userimage];
            UIButton *personbtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, firstSectionHeight)];
            
            UILabel *username = [[UILabel alloc] initWithFrame:CGRectMake(DZScreenW/2, 0, DZScreenW/2, firstSectionHeight)];
            
            userimageview.frame = CGRectMake(40, 0, imageHeight, imageHeight);
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
            
            if (indexPath.row < tmp.count - 1) {
                UIView *tmpFootLine = [[UIView alloc] initWithFrame:CGRectMake(5, 39, DZScreenW-5, 1)];
                tmpFootLine.backgroundColor = AppDefaultBorderColorUI;
                [cell addSubview:tmpFootLine];
            }
            
            cell.backgroundColor = AppDefaultSubViewBackgroundColor;
            cell.textLabel.textColor = AppDefaultFontColor;
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            
            if ([tmp[indexPath.row]  isEqual: @"退出登录"]) {
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
            } else {
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            [self bindEventOnButton:tmpButton eventName:tmp[indexPath.row]];
            
            [cell addSubview:tmpButton];
        }
    }
    
    if (indexPath.section > 0) {
        cell.textLabel.text = tmp[indexPath.row];
    }
    
    return cell;
}

#pragma mark - DZ method

- (void) setData {
    _cellTitleList = @[@[@"Miss Dora", @"defaultPosition"],@[@"为您准备的运动建议", @"为您准备的饮食建议"], @[@"运动历史", @"赞过的食物"], @[@"打卡", @"设置运动提醒"], @[@"身体数据"], @[@"退出登录"]];
    firstSectionHeight = 100.0;
    cellHeight = 40.0;
    sectionFooterHeight = 10.0;
}

- (void) bindEventOnButton:(UIButton *) btn eventName:(NSString *) name {
    
    if ([name isEqual: @"为您准备的运动建议"]) {
        SEL eventHandler = @selector(goToExeRem);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"为您准备的饮食建议"]) {
        SEL eventHandler = @selector(goToFoodRem);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"运动历史"]) {
        SEL eventHandler = @selector(goToExeHistory);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"赞过的食物"]) {
        SEL eventHandler = @selector(goToFoodFavorites);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"打卡"]) {
        SEL eventHandler = @selector(goToCard);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"设置运动提醒"]) {
        SEL eventHandler = @selector(goToReminderSettting);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"身体数据"]) {
        SEL eventHandler = @selector(goToPhysicalData);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    } else if ([name isEqual: @"退出登录"]) {
        SEL eventHandler = @selector(goToLogin);
        [btn addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void) goToExeRem {
    DZPersonalExerciseRecomViewController *vc = [[DZPersonalExerciseRecomViewController alloc] init];
    vc.pageTitle = @"运动建议";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToFoodRem {
    DZPersonalFoodRecomViewController *vc = [[DZPersonalFoodRecomViewController alloc] init];
    vc.pageTitle = @"饮食建议";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToExeHistory {
    DZPersonalExerciseHistoryViewController *vc = [[DZPersonalExerciseHistoryViewController alloc] init];
    vc.pageTitle = @"运动历史";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToFoodFavorites {
    DZPersonalFoodFavoritesViewController *vc = [[DZPersonalFoodFavoritesViewController alloc] init];
    vc.pageTitle = @"赞过的食物";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToCard {
    DZPersonalCardViewController *vc = [[DZPersonalCardViewController alloc] init];
    vc.pageTitle = @"打卡";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToReminderSettting {
    DZPersonalReminderSettingViewController *vc = [[DZPersonalReminderSettingViewController alloc] init];
    vc.pageTitle = @"设置运动提醒";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToPhysicalData {
    DZPersonalPhysicalDataViewController *vc = [[DZPersonalPhysicalDataViewController alloc] init];
    vc.pageTitle = @"身体数据";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void) goToLogin {
    DZLoginViewController *vc = [[DZLoginViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
