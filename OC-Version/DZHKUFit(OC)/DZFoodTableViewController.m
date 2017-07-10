//
//  DZFoodTableViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZFoodTableViewController.h"
#import "DZFoodContentData.h"

@interface DZFoodTableViewController ()
@property NSMutableArray *foodTypes;
@property NSMutableArray *foodContents;
@end

@implementation DZFoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self obtainFoodData];
    //[self toSetTableUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _foodTypes.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _foodContents.count;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
//    
//    // Configure the cell...
//    
//    return cell;
//}

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

- (void)obtainFoodData {
    
    _foodTypes = [NSMutableArray arrayWithCapacity:10];
    _foodContents = [NSMutableArray arrayWithCapacity:100];
    
    for (int i = 0; i < 20; i++) {
        NSString *tmpfoodname = [@"FoodName" stringByAppendingString: [NSString stringWithFormat:@"%d", i]];
        [_foodTypes addObject:tmpfoodname];
        
        NSMutableArray *tmpfoodcontentarray = [NSMutableArray arrayWithCapacity:10];
        for (int j = 0; j <= i+1; j++ ) {
            NSString *tmpallnumber = [NSString stringWithFormat:@"%d", j];
            NSString *tmpallunit = @"/100g";
            DZFoodContentData *tmpContentData = [[DZFoodContentData alloc] init];
            tmpContentData.foodCalorie = [tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodFat = [tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodProtein = [tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.foodCarhdr = [tmpallnumber stringByAppendingString: tmpallunit];
            
            [tmpfoodcontentarray addObject:tmpContentData];
        }
        [_foodContents addObject:tmpfoodcontentarray];
        //NSLog(@"%@", [tmpfoodcontentarray[0] foodProtein]);
    }
    
    NSLog(@"%@", _foodTypes);
    NSLog(@"%@", _foodContents);
    NSLog(@"sdjo");
}



@end
