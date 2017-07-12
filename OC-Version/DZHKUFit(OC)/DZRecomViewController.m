//
//  DZRecomViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZRecomViewController.h"

@interface DZRecomViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIImageView *exerciseShow;
@property (nonatomic, strong) UIImage *defaultImage;
@property (nonatomic, strong) UILabel *erecomTitle;
@property (nonatomic, strong) UILabel *frecomTitle;

@end

@implementation DZRecomViewController {
    double yPosition;
    double xDefaultPosition;
    UIColor *fontDefaultColor;
    UIColor *subViewColor;
    UIColor *defaultBorderColor;
    UIColor *backgroundColor;
}

- (void)viewDidLoad {
    yPosition = 0;
    xDefaultPosition = 10;
    backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    subViewColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1];
    fontDefaultColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    defaultBorderColor = [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1];
    [super viewDidLoad];
    [self setUI];
}

#pragma -mark 自定义函数
- (void)setUI {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.backgroundColor = backgroundColor;
    _scrollView.contentSize = CGSizeMake(DZScreenW, 2*DZScreenH);
    [self.view addSubview:_scrollView];
    [self setImageViewUI];
    //[_scrollView addSubview: [self setRecomTitleUI:@"今日运动列表"]];
    [_scrollView addSubview: [self setHorizontalScroll:100 andWidth:DZScreenW*1.5 andTitle:@"今日运动"]];
    [_scrollView addSubview: [self setHorizontalScroll:300 andWidth:DZScreenW*1.5 andTitle:@"今日饮食"]];
    //[_scrollView addSubview: [self setRecomTitleUI:@"今日饮食推荐"]];

}

- (void)setImageViewUI {
    yPosition = DZScreenW * 0.6 + 5;
    _defaultImage = [[UIImage alloc] init];
    _defaultImage = [UIImage imageNamed:@"defaultPosition"];
    _exerciseShow = [[UIImageView alloc] init];
    _exerciseShow.frame = CGRectMake(0, 0, DZScreenW, DZScreenW*0.6);
    //_exerciseShow.layer.borderColor = defaultBorderColor.CGColor;
    //_exerciseShow.layer.borderWidth = 1;
    _exerciseShow.image = _defaultImage;
    [_scrollView addSubview:_exerciseShow];
}

- (UILabel *)setRecomTitleUI:(NSString *) textContent {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"Arial" size:12];
    label.text = textContent;
    label.frame = CGRectMake(xDefaultPosition, 0, DZScreenW, 26);
    label.textColor = fontDefaultColor;
    yPosition += 26;
    return label;
}

- (UIScrollView *)setHorizontalScroll:(float) viewHeight andWidth:(float) viewWidth andTitle:(NSString *) recomTitle{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.backgroundColor = subViewColor;
    scrollView.frame = CGRectMake(0, yPosition, viewWidth, viewHeight);
    scrollView.layer.borderColor = defaultBorderColor.CGColor;
    scrollView.layer.borderWidth = 1;
    [scrollView addSubview:[self setRecomTitleUI:recomTitle]];
    
    [scrollView addSubview:[self maskArrangement:80 :48 :xDefaultPosition :26 backgroundImageName:@"defaultPosition" buttonName:@"运动"]];
    
    yPosition += viewHeight;
    return scrollView;
}

- (UIButton *)maskArrangement:(float) maskW :(float) maskH :(float) x :(float) y backgroundImageName:(NSString *) backImage buttonName:(NSString *) buttonName{
    UIButton *button = [[UIButton alloc] init];
    UIImage *buttonBackground = [[UIImage alloc] init];
    buttonBackground = [UIImage imageNamed:backImage];
    button.frame = CGRectMake(x, y, maskW, maskH);
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    CALayer *maskLayer = [[CALayer alloc] init];
    maskLayer.frame = CGRectMake(0, 0, maskW, maskH);
    maskLayer.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5].CGColor;
    //[button setTitle:buttonName forState:UIControlStateNormal];
    //button.titleLabel.textColor = [UIColor whiteColor];
    [[button layer] addSublayer:maskLayer];
    
    return button;
}

@end
