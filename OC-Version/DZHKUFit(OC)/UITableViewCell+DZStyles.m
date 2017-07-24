//
//  UITableViewCell+DZStyles.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UITableViewCell+DZStyles.h"

@implementation UITableViewCell (DZStyles)

+ (UITableViewCell *) DZDetailCellWithTextHeight:(float)textheight DetailHeight:(float)detailheight TextSize:(float)textsize DetailSize:(float)detailsize Text:(NSString *)text Detail:(NSString *)detail Reuseid:(NSString *)reuseid {
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
    
    UILabel *textlabel = [UILabel DZDefaultTableLabelWithText:@"" yPos:0 Height:textheight IsBold:NO];
    UILabel *detaillabel = [UILabel DZDefaultTableDetailLabelWithText:@"" yPos:textheight Height:detailheight IsBold:NO];
    UIView *cellview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, textheight+detailheight)];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cellview.backgroundColor = AppDefaultSubViewBackgroundColor;
    textlabel.font = [UIFont systemFontOfSize:textsize];
    
    [cell.contentView addSubview:textlabel];
    [cell.contentView addSubview:detaillabel];
    
    return cell;
}

+ (UITableViewCell *) DZDetailSingleLineCellWithTextHeight:(float)textheight DetailHeight:(float)detailheight TextSize:(float)textsize DetailSize:(float)detailsize Text:(NSString *)text Detail:(NSString *)detail Reuseid:(NSString *)reuseid {
    
    float detailWidth = DZScreenW/2;
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseid];
    
    UILabel *textlabel = [UILabel DZDefaultTableLabelWithText:@"" yPos:0 Height:textheight IsBold:NO];
    UILabel *detaillabel_1 = [UILabel DZDefaultTableDetailLabelWithText:@"" yPos:0 Height:textheight IsBold:NO];
    UILabel *detaillabel_2 = [UILabel DZDefaultTableDetailLabelWithText:@"" yPos:0 Height:textheight IsBold:NO];
    UILabel *detaillabel_3 = [UILabel DZDefaultTableDetailLabelWithText:@"" yPos:0 Height:textheight IsBold:NO];
    UIView *cellview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, textheight)];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cellview.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    detaillabel_1.frame = CGRectMake(DZScreenW/2, 0, detailWidth/4, textheight);
    detaillabel_2.frame = CGRectMake(DZScreenW/2 + detailWidth/4, 0, detailWidth*1.2/4, textheight);
    detaillabel_3.frame = CGRectMake(DZScreenW/2 + detailWidth/4 +detailWidth*1.2/4, 0, detailWidth-detailWidth/4-detailWidth*1.5/4, textheight);
    
    [cell.contentView addSubview:textlabel];
    [cell.contentView addSubview:detaillabel_1];
    [cell.contentView addSubview:detaillabel_2];
    [cell.contentView addSubview:detaillabel_3];
    
    return cell;
}



@end
