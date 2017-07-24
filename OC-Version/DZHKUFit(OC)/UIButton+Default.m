//
//  UIButton+Default.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIButton+Default.h"

@implementation UIButton (Default)

+ (UIButton *)DZDefaultBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y Title:(NSString *) btntitle {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    button.backgroundColor = AppDefaultColor;
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    [button.layer setCornerRadius:4.0];
    [button setTitle:btntitle forState:UIControlStateNormal];

    return button;
}

+ (UIButton *)DZDefaultLineBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y Title:(NSString *) btntitle {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.layer.borderColor = AppDefaultColor.CGColor;
    button.layer.borderWidth = 1;
    [button.layer setCornerRadius:4.0];
    [button setTitle:btntitle forState:UIControlStateNormal];
    [button setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    
    return button;
}

+ (DZUIButtonWithParameter *)DZParameterLineBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y Title:(NSString *) btntitle {
    DZUIButtonWithParameter *button = [[DZUIButtonWithParameter alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    button.layer.borderColor = AppDefaultColor.CGColor;
    button.layer.borderWidth = 1;
    [button.layer setCornerRadius:4.0];
    [button setTitle:btntitle forState:UIControlStateNormal];
    [button setTitleColor:AppDefaultColor forState:UIControlStateNormal];
    
    return button;
}


@end
