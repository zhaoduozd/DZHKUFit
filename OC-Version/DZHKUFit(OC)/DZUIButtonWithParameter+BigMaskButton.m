//
//  DZUIButtonWithParameter+BigMaskButton.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZUIButtonWithParameter+BigMaskButton.h"

@implementation DZUIButtonWithParameter (BigMaskButton)

+ (DZUIButtonWithParameter *) DZExerciseItemWithTitle:(NSString *) title time:(NSString *) time calorie:(NSString *) calorie imageName:(NSString *) imageName xPos:(float) x yPos:(float) y Width:(float) width Height:(float) height {
    DZUIButtonWithParameter *button = [[DZUIButtonWithParameter alloc] init];
    UILabel *btnTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, height/2-20, width, 26)];
    UILabel *btnTime = [[UILabel alloc] initWithFrame:CGRectMake(width/2, height-40, width/2, 26)];
    UILabel *btnCalorie = [[UILabel alloc] initWithFrame:CGRectMake(10, height-40, width/2, 26)];
    UIColor *fontColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    CALayer *maskLayer = [[CALayer alloc] init];
    
    button.frame = CGRectMake(x, y, width, height);
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:4.0];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6].CGColor;
    
    btnTitle.text = title;
    btnTitle.font = [UIFont boldSystemFontOfSize:14.0];
    btnTitle.textColor = [UIColor whiteColor];
    
    btnTime.text = time;
    btnTime.font = [UIFont systemFontOfSize:12.0];
    btnTime.textColor = fontColor;
    
    btnCalorie.text = calorie;
    btnCalorie.font = [UIFont systemFontOfSize:12.0];
    btnCalorie.textColor = fontColor;
    
    [[button layer] addSublayer:maskLayer];
    [button addSubview:btnTitle];
    [button addSubview:btnTime];
    [button addSubview:btnCalorie];
    
    return button;
}


@end
