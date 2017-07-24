//
//  DZPersonalExerciseHistoryViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 23/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZPersonalExerciseHistoryViewController.h"
#import "DZExerciseHistoryTableData.h"
#import "exerciseHistoryData.h"


@interface DZPersonalExerciseHistoryViewController ()

@property(nonatomic,strong) NSMutableArray<DZExerciseHistoryTableData *> *exerciseContents;

@end

@implementation DZPersonalExerciseHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _pageTitle;
    [self initElements];
    [self request];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _exerciseContents.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _exerciseContents[section].sectionData.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _exerciseContents[section].sectionTile;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *wrapper = [[UIView alloc] init];
    UILabel *sectionHeader = [[UILabel alloc] init];
    
    wrapper.backgroundColor = AppDefaultBackgroundColor;
    
    sectionHeader.text = _exerciseContents[section].sectionTile;
    sectionHeader.frame = CGRectMake(15, 0, DZScreenW, 26);
    sectionHeader.backgroundColor = AppDefaultBackgroundColor;
    sectionHeader.textColor = AppDefaultFontColor;
    sectionHeader.font = [UIFont boldSystemFontOfSize:10];
    
    [wrapper addSubview:sectionHeader];
    
    return wrapper;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 26.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 36.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifer = @"exercisehistorytabelcell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    //exerciseHistoryData *tmp = _exerciseContents[indexPath.section].sectionData[indexPath.row];
    
    if (cell == nil) {
        cell = [UITableViewCell DZDetailSingleLineCellWithTextHeight:36 DetailHeight:0 TextSize:13 DetailSize:10 Text:@"" Detail:@"" Reuseid:identifer];
    }
    
    NSString *name = _exerciseContents[indexPath.section].sectionData[indexPath.row].exerciseName;
    NSString *calorie = _exerciseContents[indexPath.section].sectionData[indexPath.row].calorie;
    NSString *time =  _exerciseContents[indexPath.section].sectionData[indexPath.row].costTime;
    NSString *amount = _exerciseContents[indexPath.section].sectionData[indexPath.row].amount;

    //NSString *exerciseContentString = [NSString stringWithFormat:@"%@组, 消耗%@卡路里, 耗时%@分钟", amount, calorie, time];
    UILabel *tmplabel;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:0];
    tmplabel.text = name;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:1];
    tmplabel.text = amount;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:2];
    tmplabel.text = time;
    
    tmplabel = [cell.contentView.subviews objectAtIndex:3];
    tmplabel.text = calorie;
    
    return cell;
}


- (void)initElements {
    _exerciseContents = [[NSMutableArray alloc] init];
}

- (void)request {
    
    // 制作section数据模型
    for (int i = 0; i < 10; i++) {
        DZExerciseHistoryTableData *sectioni = [DZExerciseHistoryTableData section];
        sectioni.sectionData = [[NSMutableArray alloc] init];
        
        // 1.section名字
        NSString *tmpfoodname = [NSString stringWithFormat:@"2017年6月%d日",i];
        sectioni.sectionTile = tmpfoodname;
        
        // 2.section数据
        for (int j = 0; j <= i+2; j++ ) {
            exerciseHistoryData *tmpContentData = [[exerciseHistoryData alloc] init];
            tmpContentData.calorie = [NSString stringWithFormat:@"消耗12%d卡路里",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.exerciseName = [NSString stringWithFormat:@"俄罗斯转体%d",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.costTime = [NSString stringWithFormat:@"耗时%d分钟",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.amount = [NSString stringWithFormat:@"完成%d组",j];//[tmpallnumber stringByAppendingString: tmpallunit];
            
            if(j == i+1) {
                tmpContentData.exerciseName = [NSString stringWithFormat:@"今日走路 %d 步",j*1000];
                tmpContentData.amount = @"";
                tmpContentData.costTime = @"";
            } else if (j == i+2) {
                tmpContentData.exerciseName = [NSString stringWithFormat:@"今日总消耗能量"];
                tmpContentData.amount = @"";
                tmpContentData.costTime = @"";
            }
            [sectioni.sectionData addObject:tmpContentData];
        }
        [_exerciseContents addObject:sectioni];
    }
}



@end
