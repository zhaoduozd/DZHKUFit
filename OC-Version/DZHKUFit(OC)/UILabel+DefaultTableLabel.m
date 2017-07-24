//
//  UILabel+DefaultTableLabel.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UILabel+DefaultTableLabel.h"

@implementation UILabel (DefaultTableLabel)

+ (UILabel *)DZDefaultTableLabelWithText:(NSString *)text yPos:(float)y Height:(float)height IsBold:(BOOL)bold {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, y, DZScreenW, height)];
    
    label.text = text;
    label.textColor = AppDefaultFontColor;
    
    if (bold) {
        label.font = [UIFont boldSystemFontOfSize:13];
    } else {
        label.font = [UIFont systemFontOfSize:13];
    }
    
    return label;
}

+ (UILabel *)DZDefaultTableDetailLabelWithText:(NSString *)text yPos:(float)y Height:(float)height IsBold:(BOOL)bold {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, y, DZScreenW, height)];
    
    label.text = text;
    label.textColor = AppDefaultFontColor;
    label.adjustsFontSizeToFitWidth = NO;
    
    if (bold) {
        label.font = [UIFont boldSystemFontOfSize:10];
    } else {
        label.font = [UIFont systemFontOfSize:10];
    }
    
    return label;
}

@end
