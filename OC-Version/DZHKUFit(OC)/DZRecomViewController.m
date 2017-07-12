//
//  DZRecomViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZRecomViewController.h"

@interface DZRecomViewController ()

@property (nonatomic, strong) UIScrollView *scrollRootView;
@property (nonatomic, strong) UIView *exerciseRecom;
@property (nonatomic, strong) UIView *foodRecom;
@property (nonatomic, strong) UIImage *defaultImage;

@end

@implementation DZRecomViewController {
    double yPosition;
    double xDefaultPosition;
    
    UIColor *backgroundColor;
    UIColor *subViewBackgroundColor;
    
    UIColor *defaultBorderColor;
    
    UIColor *fontDefaultColor;
    UIColor *fontDetailColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDefaultColors];
    [self setXYPosition];
    [self setRootUI];
    [self setUIElements];
}


#pragma -mark 自定义函数
- (void)setDefaultColors {
    
    //set background colors
    backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    subViewBackgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1];
    
    //set font colors
    fontDefaultColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    
    //set border colors
    defaultBorderColor = [UIColor colorWithRed:228.0/255.0 green:228.0/255.0 blue:228.0/255.0 alpha:1];
}

- (void)setXYPosition {
    xDefaultPosition = 5;
    yPosition = 0;
}

- (void)setRootUI {
    _scrollRootView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollRootView.backgroundColor = backgroundColor;
    _scrollRootView.contentSize = CGSizeMake(DZScreenW, 2*DZScreenH);
    [self.view addSubview:_scrollRootView];
}

- (void)setUIElements {
    [self setExerciseRecomUI];
    [self setFoodRecomUI];
}

- (void)setExerciseRecomUI {
    //create exerciseRecom UIView
    float titleHeight = 26;
    float exerciseRecomHeight = DZScreenW * 0.6;
    float exerciseListHeight = 70;
    float thisHeight = titleHeight + exerciseRecomHeight + exerciseListHeight;
    
    _exerciseRecom = [[UIView alloc] init];
    _exerciseRecom.frame = CGRectMake(-1, 0, DZScreenW + 3, thisHeight);
    _exerciseRecom.backgroundColor = subViewBackgroundColor;
    
    NSLog(@"%@", subViewBackgroundColor);
    _exerciseRecom.layer.borderColor = defaultBorderColor.CGColor;
    _exerciseRecom.layer.borderWidth = 1;
    
    //create UI elements in exerciseRecom
    UILabel *recomTitle = [self recomTitleLabel:@"今日为您运动"];
    UIImageView *exerciseView = [self exerciseShow];
    UIScrollView *exerciseList = [self horizontalScrollWithWidth:DZScreenW Height:exerciseListHeight andTitle:@"exercise"];
    
    //add UI elements into exerciseRecom
    [_exerciseRecom addSubview:recomTitle];
    [_exerciseRecom addSubview:exerciseView];
    [_exerciseRecom addSubview:exerciseList];
    
    //add exerciseRecom into Root View
    [_scrollRootView addSubview:_exerciseRecom];
    
    yPosition = thisHeight + 10;
}

- (void)setFoodRecomUI {
    //create foodRecomUIView
    float titleHeight = 26;
    float foodRecomHeight = 180;
    float thisHeight = titleHeight + foodRecomHeight;
    
    _foodRecom = [[UIView alloc] init];
    _foodRecom.frame = CGRectMake(-1, yPosition, DZScreenW + 2, thisHeight);
    _foodRecom.backgroundColor = subViewBackgroundColor;
    _foodRecom.layer.borderColor = defaultBorderColor.CGColor;
    _foodRecom.layer.borderWidth = 1;
     NSLog(@"%@", subViewBackgroundColor);
    
    //create UI elements in foodRecom
    UILabel *recomTitle = [self recomTitleLabel:@"今日为您推荐美食"];
    
    
    //add UI elements into foodRecom
    [_foodRecom addSubview:recomTitle];
    
    //add foodRecom into Root View
    [_scrollRootView addSubview:_foodRecom];
}


//create custom views

- (UILabel *)recomTitleLabel:(NSString *) textContent {
    float labelHeight = 26;
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"Arial" size:12];
    label.text = textContent;
    label.frame = CGRectMake(xDefaultPosition, 0, DZScreenW, labelHeight);
    label.textColor = fontDefaultColor;
    
    yPosition += labelHeight;
    return label;
}

- (UIImageView *)exerciseShow {
    UIImageView *exerciseShow =[[UIImageView alloc] init];
    
    _defaultImage = [[UIImage alloc] init];
    _defaultImage = [UIImage imageNamed:@"defaultPosition"];
    
    exerciseShow.frame = CGRectMake(-1, yPosition, DZScreenW+2, DZScreenW*0.6);
    //exerciseShow.layer.borderColor = defaultBorderColor.CGColor;
    //exerciseShow.layer.borderWidth = 1;
    exerciseShow.image = _defaultImage;
    
    yPosition += DZScreenW * 0.6;
    
    return exerciseShow;
}

- (UIScrollView *)horizontalScrollWithWidth:(float) width Height:(float) height andTitle:(NSString *) title{
    
    float btnXPos = 5;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    scrollView.frame = CGRectMake(0, yPosition, width, height);
    scrollView.backgroundColor = subViewBackgroundColor;
    scrollView.contentSize = CGSizeMake(width*2, height);
    
    for (int i = 0; i < 10; i++) {
        [scrollView addSubview:[self buttonWithMaskWithButtonWidth:70 buttonHeight:48 xPos:btnXPos yPos:10 backgroundImageName:@"defaultPosition" buttonName:@"运动"]];
        btnXPos += 74;
    }
    
    yPosition += height;
    return scrollView;
}

- (UIButton *)buttonWithMaskWithButtonWidth:(float) width buttonHeight:(float) height xPos:(float) x yPos:(float) y backgroundImageName:(NSString *) backImage buttonName:(NSString *) buttonName{
    
    UIButton *button = [[UIButton alloc] init];
    CALayer *maskLayer = [[CALayer alloc] init];

    button.frame = CGRectMake(x, y, width, height);
    [button setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateNormal];
    //[button setTitle:buttonName forState:UIControlStateNormal];
    [button.layer setMasksToBounds:YES];
    [button.layer setCornerRadius:4.0];
    
    maskLayer.frame = CGRectMake(0, 0, width, height);
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5].CGColor;
    
    [[button layer] addSublayer:maskLayer];
    
    return button;
}

@end
