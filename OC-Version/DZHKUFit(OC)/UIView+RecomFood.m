//
//  UIView+RecomFood.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIView+RecomFood.h"

@implementation UIView (RecomFood)

+ (UIView *)recomFoodSubWrapperViewxPos:(float) x yPos:(float) y {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(x, y, DZScreenW - 10, 80)];
    
    view.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:113.0/255.0 blue:5.0/255.0 alpha:0.2];
    [view.layer setCornerRadius:10.0];
    
    return view;
}

@end
