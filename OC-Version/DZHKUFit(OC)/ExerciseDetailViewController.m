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
@property(nonatomic, strong) UIScrollView *exercisePoints;

@end

@implementation ExerciseDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _exerciseShowpart = [UIView exerciseShowViewWithTitle:@"" ImageName:@"defaultPosition" xPos:0 yPos:0];
    _exercisePoints = [UIScrollView exercisePointsShowWithHeigth:180 yPos:(DZScreenW*0.6+1) exerciseDescription:@"卷腹时要呼气，动作还原时要吸气\n卷腹时要呼气，动作还原时要吸气\n卷腹时要呼气，动作还原时要吸气\n感受腹肌用力，控制脖子不要用力\n" exerciseName:@"西西里卷腹"];
    
    [self.view addSubview:_exerciseShowpart];
    [self.view addSubview:_exercisePoints];
}


@end
