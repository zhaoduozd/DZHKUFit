//
//  UIScrollView+ExercisePointsShow.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 19/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIScrollView+ExercisePointsShow.h"
#import "UIButton+Default.h"

@implementation UIScrollView (ExercisePointsShow)

+(UIScrollView *) exercisePointsShowWithHeigth:(float) height yPos:(float) y exerciseDescription:(NSString *) description exerciseName:(NSString *) exerciseName {
    
    
    UIScrollView *rootView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, DZScreenW+3, 180)];
    UIView *seperateLine = [[UIView alloc] initWithFrame:CGRectMake(15, 36, DZScreenW-30, 1)];
    UIButton *voice = [UIButton DZDefaultLineBtnWithWidth:100 Height:20 xPos:DZScreenW-115 yPos:10 Title:@"开启音频讲解"];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 80, 20)];
    UILabel *contentDetail = [[UILabel alloc] initWithFrame:CGRectMake(15, 38, DZScreenW-30, 100)];
    CGSize size = [contentDetail sizeThatFits:CGSizeMake(contentDetail.frame.size.width, MAXFLOAT)];
    
    rootView.backgroundColor = AppDefaultBarTintColor;
    seperateLine.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1];
    
    title.font = [UIFont boldSystemFontOfSize:12];
    title.text = @"动作要领";
    title.textColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    
    NSLog(@"%f", size.height);
    //contentDetail.frame = CGRectMake(15, 25, DZScreenW-30, size.height);
    
    
    contentDetail.numberOfLines = 0;
    contentDetail.font = [UIFont systemFontOfSize:12];
    contentDetail.lineBreakMode = NSLineBreakByWordWrapping;
    contentDetail.textColor = [UIColor colorWithWhite:0.9 alpha:1];
    contentDetail.text = description;
    
    //set space line
    
    NSRange range = NSMakeRange(0, [description length]);
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:description];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10.0];//调整行间距
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:range];
    [attributedString addAttribute:NSFontAttributeName value:contentDetail.font range:range];
    contentDetail.attributedText = attributedString;
    
    [rootView addSubview:title];
    [rootView addSubview:voice];
    [rootView addSubview:seperateLine];
    [rootView addSubview:contentDetail];
    
    return rootView;
}

@end



//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 300, 100)];
//    label.numberOfLines = 0;
//
//    label.lineBreakMode = NSLineBreakByWordWrapping;
//
//    label.text = @"本店于十一期间特推出一系列优惠，限时限量敬请选购！沙发：钻石品质，首领风范！床垫：华贵典雅，彰显时尚！尊贵而不失奢华，典雅却不失自然！温馨和浪漫的生活，我们与你一同创造！";
//
//    CGSize size = [label sizeThatFits:CGSizeMake(label.frame.size.width, MAXFLOAT)];
//
//    label.frame =CGRectMake(0, 100, 300, size.height);
//
//    label.font = [UIFont systemFontOfSize:14];
