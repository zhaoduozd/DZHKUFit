//
//  UIButton+Mask.m
//  DZHKUFit(OC)
//
//  Created by Xinhou Jiang on 13/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIButton+Mask.h"

@implementation UIButton (Mask)

+ (UIButton *)buttonWithMaskWithButtonWidth:(float) width buttonHeight:(float) height xPos:(float) x yPos:(float) y backgroundImageName:(NSString *) backImage buttonName:(NSString *) buttonName{
    
    UIButton *button = [[UIButton alloc] init];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    // 原按钮设置
    button.frame = CGRectMake(x, y, width, height);
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    //[button setTitle:buttonName forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:4.0];
    
    // 蒙版层
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5].CGColor;
    [[button layer] addSublayer:maskLayer];
    
    // 按钮标题
    //title.text = buttonName;
    //title.frame = CGRectMake(0, 0, width, height);
    //title.textColor = [UIColor orangeColor];
    
    //[button addSubview:title];
    [button setTitle:buttonName forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    return button;
}


@end
