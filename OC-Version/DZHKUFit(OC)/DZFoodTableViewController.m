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
    [self obtainFoodData];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"id"];
    cell.textLabel.text = _foodContents[indexPath.section].sectionData[indexPath.row].foodCalorie;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - functions of DZ

/**
 * 初始化变量
 */
- (void)initElements {
    _foodContents = [[NSMutableArray alloc] init];
}

- (void)obtainFoodData {
    
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
            [sectioni.sectionData addObject:tmpContentData];
        }
        [_foodContents addObject:sectioni];
    }
    
    NSLog(@"%@", _foodContents);
   // NSLog(@"sdjo");
}

@end
