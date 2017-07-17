//
//  DZExerciseViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZExerciseViewController.h"

@interface DZExerciseViewController ()

@property(nonatomic, strong) UIScrollView *scrollRootView;

@end

@implementation DZExerciseViewController {
    double yPosition;
    double xDefaultPosition;
}

- (void)viewDidLoad {
    
    xDefaultPosition = 5;
    yPosition = 0;
    
    [super viewDidLoad];
    [self setRootView];
    [self setExerciseWrapper];
    
}

#pragma -mark 自定义函数

-(void)setRootView {
    _scrollRootView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollRootView.backgroundColor = AppDefaultBackgroundColor;
    _scrollRootView.contentSize = CGSizeMake(DZScreenW, 2*DZScreenH);
    [self.view addSubview:_scrollRootView];
}

- (void)setExerciseWrapper {
    float sectionHeight = 400;
    NSLog(@"123");
    for (int i = 0; i < 10; i++) {
        UIView *section = [self exerciseSection:@"腹部训练" xPos:0 yPos:yPosition Height: sectionHeight SectionNo: i];
        [_scrollRootView addSubview:section];
        yPosition += (sectionHeight);
    }
}

- (UIView *)exerciseSection:(NSString *) sectionName xPos:(float) x yPos:(float)y Height:(float) height SectionNo:(int) secno {
    //create an exercise section
    UIView *exerciseSection = [[UIView alloc] init];
    UILabel *sectionTitle = [self exerciseSectionName:sectionName];
    
    //set button size
    float btnW = (DZScreenW - 30)/ 2;
    float btnH = btnW * 0.6;
    float btnX = 5;
    float btnY = 26;
    
    exerciseSection.frame = CGRectMake(x, y, DZScreenW, height);
    exerciseSection.backgroundColor = AppDefaultSubViewBackgroundColor;
    exerciseSection.layer.borderWidth = 1;
    exerciseSection.layer.borderColor = AppDefaultBorderColor;
    
    [exerciseSection addSubview:sectionTitle];
    for (int i = 0; i < 6; i++) {
        UIButton *tmpButton = [UIButton bigMaskButtonWithTitle:@"西西里卷腹" time:@"一组10分钟" calorie:@"78 Kcal" imageName:@"defaultPosition" xPos:btnX yPos:btnY Width:btnW Height:btnH];
        
        SEL eventHandler = @selector(goToExerciseDetail);
        [tmpButton addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
        
        [exerciseSection addSubview:tmpButton];
        
        btnX += (btnW + 10);
        
        if((i + 1) % 2 == 0) {
            btnX = 5;
            btnY += (btnH + 10);
        }
    }
    
    return exerciseSection;
}

- (UILabel *)exerciseSectionName:(NSString *) sectionName {
    //create an label
    float labelHeight = 26;
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont fontWithName:@"Arial" size:12];
    label.text = sectionName;
    label.frame = CGRectMake(xDefaultPosition, 0, DZScreenW, labelHeight);
    label.textColor = AppDefaultFontColor;
    
    yPosition += labelHeight;
    return label;
}

- (void)goToExerciseDetail {
    ExerciseDetailViewController *exerciseUIView = [[ExerciseDetailViewController alloc] init];
    [self.navigationController pushViewController:exerciseUIView animated:YES];
}

@end
