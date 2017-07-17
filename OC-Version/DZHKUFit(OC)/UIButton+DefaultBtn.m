//
//  UIButton+DefaultBtn.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIButton+DefaultBtn.h"

@implementation UIButton (DefaultBtn)

+ (UIButton *)DZDefaultBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y Title:(NSString *) btntitle {
    UIButton *button = [[UIButton alloc] init];
 
    button.backgroundColor = AppDefaultColor;
    button.frame = CGRectMake(x, y, width, height);
    [button.layer setCornerRadius:4.0];
    [button setTitle:btntitle forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    return button;
}

@end
