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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *wrapper = [[UIView alloc] init];
    UILabel *sectionHeader = [[UILabel alloc] init];
    
    wrapper.backgroundColor = AppDefaultBackgroundColor;
    
    sectionHeader.text = _foodContents[section].sectionTile;
    sectionHeader.frame = CGRectMake(15, 0, DZScreenW, 40);
    sectionHeader.backgroundColor = AppDefaultBackgroundColor;
    sectionHeader.textColor = AppDefaultFontColor;
    sectionHeader.font = [UIFont boldSystemFontOfSize:13];
    
    [wrapper addSubview:sectionHeader];
    
    return wrapper;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"foodlisttabelcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    DZFoodContentData *tmp = _foodContents[indexPath.section].sectionData[indexPath.row];
    
    if (cell == nil) {

        cell = [UITableViewCell DZDetailCellWithTextHeight:26 DetailHeight:26 TextSize:13 DetailSize:10 Text:@"" Detail:@"" Reuseid:identifer];
        DZIconsImageView *likeiconview = [DZIconsImageView DZLikeIconWithXPos:DZScreenW-40 yPos:5 IsLike:tmp.like];
        
        SEL likeevent = @selector(likeIt:);
        [likeiconview addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:likeevent]];
        [cell.contentView addSubview:likeiconview];
    }
    
    NSString *name = _foodContents[indexPath.section].sectionData[indexPath.row].foodName;
    NSString *calorie = _foodContents[indexPath.section].sectionData[indexPath.row].foodCalorie;
    NSString *fat =  _foodContents[indexPath.section].sectionData[indexPath.row].foodFat;
    NSString *protein = _foodContents[indexPath.section].sectionData[indexPath.row].foodProtein;
    NSString *carhdr = _foodContents[indexPath.section].sectionData[indexPath.row].foodCarhdr;
    
    NSString *foodContentString = [NSString stringWithFormat:@"%@/100g, %@/100g, %@/100g, %@/100g\n", calorie, fat, protein, carhdr];
    UILabel *tmplabel;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:0];
    tmplabel.text = name;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:1];
    tmplabel.text = foodContentString;
    
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
        NSString *tmpfoodname = [NSString stringWithFormat:@"果蔬类 %d",i];
        sectioni.sectionTile = tmpfoodname;
        
        // 2.section数据
        for (int j = 0; j <= i; j++ ) {
            DZFoodContentData *tmpContentData = [[DZFoodContentData alloc] init];
            tmpContentData.foodCalorie = [NSString stringWithFormat:@"能量:%dKcal",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodFat = [NSString stringWithFormat:@"脂肪:%dg",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodProtein = [NSString stringWithFormat:@"蛋白质:%dg",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodCarhdr = [NSString stringWithFormat:@"碳水:%dg",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodName = [NSString stringWithFormat:@"食物名称 %d & %d",i, j];
            if (j*i % 3 == 0) {
                tmpContentData.like = YES;
            } else {
                tmpContentData.like = NO;
            }
            [sectioni.sectionData addObject:tmpContentData];
        }
        [_foodContents addObject:sectioni];
    }
}

- (void)likeIt:(UITapGestureRecognizer *) gestureRecognizer {
    UIImageView *likeview = (UIImageView *)[gestureRecognizer view];
    likeview.image = [UIImage imageNamed:@"likeit"];
}

@end
