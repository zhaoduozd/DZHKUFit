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

@end

@implementation DZRecomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUI];
}

#pragma -mark 自定义函数
- (void)setUI {
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.backgroundColor = [UIColor colorWithRed:248.0/255.0 green:248.0/255.0 blue:248.0/255.0 alpha:1];
    _scrollView.contentSize = CGSizeMake(DZScreenW, 2*DZScreenH);
    [self.view addSubview:_scrollView];
    
}

@end
