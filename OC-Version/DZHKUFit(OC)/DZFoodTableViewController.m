//
//  DZFoodTableViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZFoodTableViewController.h"
#import "DZFoodContentData.h"
#import "DZTableSectionData.h"

@interface DZFoodTableViewController ()
@property(nonatomic,strong) NSMutableArray<DZTableSectionData *> *foodContents;
@end

@implementation DZFoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 数据初始化
    [self initElements];
    [self request];
    //[self toSetTableUI];
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _foodContents.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foodContents[section].sectionData.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _foodContents[section].sectionTile;
}

//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UILabel *sectionHeader = [[UILabel alloc] init];
//    sectionHeader.text = _foodContents[section].sectionTile;
//    
//    return sectionHeader;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"dzid";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifer];
    }
    cell.textLabel.text = _foodContents[indexPath.section].sectionData[indexPath.row].foodName;
    cell.detailTextLabel.text = _foodContents[indexPath.section].sectionData[indexPath.row].foodCarhdr;
    
    //设置text style
    //UIFont *myFont = [ UIFont fontWithName: @"Arial" size: 18.0 ];
    //cell.textLabel.font  = myFont;
    cell.textLabel.adjustsFontSizeToFitWidth = NO;
    cell.textLabel.font = [UIFont fontWithName:@"Arial" size:14.0];
    
    cell.detailTextLabel.adjustsFontSizeToFitWidth = NO;
    cell.detailTextLabel.font = [UIFont fontWithName:@"Arial" size:10];
    cell.detailTextLabel.numberOfLines = 2;
    cell.detailTextLabel.textColor = [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1];
    
    
    
    return cell;
}


#pragma mark - functions of DZ

/**
 * 初始化变量
 */
- (void)initElements {
    _foodContents = [[NSMutableArray alloc] init];
}

- (void)request {
    
    // 制作section数据模型
    for (int i = 0; i < 20; i++) {
        DZTableSectionData *sectioni = [DZTableSectionData section];
        sectioni.sectionData = [[NSMutableArray alloc] init];
        
        // 1.section名字
        NSString *tmpfoodname = [NSString stringWithFormat:@"FoodName%d",i];
        sectioni.sectionTile = tmpfoodname;
        
        // 2.section数据
        for (int j = 0; j <= i+1; j++ ) {
            DZFoodContentData *tmpContentData = [[DZFoodContentData alloc] init];
            tmpContentData.foodCalorie = [NSString stringWithFormat:@"%d/100g",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodFat = [NSString stringWithFormat:@"%d/100g",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodProtein = [NSString stringWithFormat:@"%d/100g",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodCarhdr = [NSString stringWithFormat:@"%d/100g",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodName = @"foodtestname";
            [sectioni.sectionData addObject:tmpContentData];
        }
        [_foodContents addObject:sectioni];
    }
    
    //NSLog(@"%@", _foodContents);
   // NSLog(@"sdjo");
}

@end
