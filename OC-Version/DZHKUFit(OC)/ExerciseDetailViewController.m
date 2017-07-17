//
//  ExerciseDetailViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 18/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "ExerciseDetailViewController.h"

@interface ExerciseDetailViewController ()

@property(nonatomic, strong) UIView *exerciseShowpart;

@end

@implementation ExerciseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _exerciseShowpart = [UIView exerciseShowViewWithTitle:@"西西里卷腹" ImageName:@"defaultPosition" xPos:0 yPos:80];
    
    [self.view addSubview:_exerciseShowpart];
    
    
}


@end
