//
//  UITableViewCell+DZStyles.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (DZStyles)

+ (UITableViewCell *) DZDetailCellWithTextHeight:(float)textheight DetailHeight:(float)detailheight TextSize:(float)textsize DetailSize:(float)detailsize Text:(NSString *)text Detail:(NSString *)detail Reuseid:(NSString *)reuseid;

+ (UITableViewCell *) DZDetailSingleLineCellWithTextHeight:(float)textheight DetailHeight:(float)detailheight TextSize:(float)textsize DetailSize:(float)detailsize Text:(NSString *)text Detail:(NSString *)detail Reuseid:(NSString *)reuseid;

@end
