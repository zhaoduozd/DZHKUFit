//
//  UIView+ExerciseShow.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 18/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIView+ExerciseShow.h"

@implementation UIView (ExerciseShow)

+ (UIView *)exerciseShowViewWithTitle:(NSString *) title ImageName:(NSString *) imageName xPos:(float) x yPos:(float) y {
    
    float imageWidth = DZScreenW;
    float imageHeight = DZScreenW*0.6;
    
    float titleHeight = 30;
    float titleWidth = DZScreenW;
    
    float viewWidth = DZScreenW;
    float viewHeight = imageHeight + titleHeight;
    
    UIView *uiview = [[UIView alloc] initWithFrame:CGRectMake(x, y, viewWidth, viewHeight)];
    UIImage *exerciseImage = [UIImage imageNamed:imageName];
    UIImageView *exerciseImageView = [[UIImageView alloc] initWithImage:exerciseImage];
    UILabel *viewTitle = [[UILabel alloc] init];
    
    uiview.frame = CGRectMake(x, y, viewWidth, viewHeight);
    uiview.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    if ([title isEqual: @""] || [title isEqual: nil]) {
        exerciseImageView.frame = CGRectMake(0, 0, imageWidth, imageHeight);

    } else {
        viewTitle.frame = CGRectMake(5, 5, titleWidth, titleHeight);
        viewTitle.text = title;
        viewTitle.textColor = AppDefaultFontColor;
        viewTitle.font = [UIFont systemFontOfSize:13];
        
        exerciseImageView.frame = CGRectMake(0, titleHeight, imageWidth, imageHeight);

        [uiview addSubview:viewTitle];
    }
    
    [uiview addSubview:exerciseImageView];
    
    return uiview;
}

@end
