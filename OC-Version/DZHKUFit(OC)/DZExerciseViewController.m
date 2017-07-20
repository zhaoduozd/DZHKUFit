//
//  DZExerciseViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZExerciseViewController.h"
#import "DZUIButtonWithParameter+BigMaskButton.h"

@interface DZExerciseViewController ()

@property(nonatomic, strong) UIScrollView *scrollRootView;
@property(nonatomic, strong) NSMutableArray<ExerciseTableData *> *exerciseList;

@end

@implementation DZExerciseViewController {
    double yPosition;
    double xDefaultPosition;
    
    float btnW;
    float btnH;
    float totalScrollHeight;
    float sectionTitleHeight;
}

- (void)viewDidLoad {
    
    xDefaultPosition = 5;
    yPosition = 0;
    
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = @"";
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    
    [super viewDidLoad];
    [self initdata];
    [self request];
    [self setRootView];
    [self setExerciseWrapper];
    
}

#pragma -mark 自定义函数

-(void) initdata {
    btnW = (DZScreenW - 45)/ 2;
    btnH = btnW * 0.6;
    totalScrollHeight = 0;
    sectionTitleHeight = 30;
}

-(void)setRootView {
    _scrollRootView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollRootView.backgroundColor = AppDefaultBackgroundColor;
    _scrollRootView.contentSize = CGSizeMake(DZScreenW, DZScreenH);
    [self.view addSubview:_scrollRootView];
}
-(void)setScrollHeight:(float) height {
    _scrollRootView.contentSize = CGSizeMake(DZScreenW, height);
}

- (void)setExerciseWrapper {
    
    NSLog(@"%@", @"exercise wrapper");
    
    float sectionHeight = 0;
    for (int i = 0; i < _exerciseList.count; i++) {
        
        ExerciseTableData *exerciseTableSection = [_exerciseList objectAtIndex:i];
        NSString *sectionTitle = exerciseTableSection.sectionTile;
        sectionHeight = ((exerciseTableSection.sectionData.count+1)/2) * (btnH + 10) + sectionTitleHeight;
        
        UIView *section = [self exerciseSection:sectionTitle xPos:0 yPos:yPosition Height: sectionHeight SectionNo: i];
        [_scrollRootView addSubview:section];
        yPosition += (sectionHeight - sectionTitleHeight + 10);
        
        totalScrollHeight += sectionHeight + 10;
    }
    [self setScrollHeight:totalScrollHeight];
}

- (UIView *)exerciseSection:(NSString *) sectionName xPos:(float) x yPos:(float)y Height:(float) height SectionNo:(int) secno {
    
    //create an exercise section
    UIView *exerciseSection = [[UIView alloc] init];
    UILabel *sectionTitle = [self exerciseSectionName:sectionName];
    
    //set button position
    float btnX = 15;
    float btnY = sectionTitleHeight;
    
    ExerciseTableData *exerciseTableSection = [_exerciseList objectAtIndex:secno];
    NSMutableArray *exerciseBtns = exerciseTableSection.sectionData;
    
    exerciseSection.frame = CGRectMake(x, y, DZScreenW, height);
    exerciseSection.backgroundColor = AppDefaultSubViewBackgroundColor;
    exerciseSection.layer.borderWidth = 1;
    exerciseSection.layer.borderColor = AppDefaultBorderColor;
    
    [exerciseSection addSubview:sectionTitle];
    
    for (int i = 0; i < exerciseBtns.count; i++) {
        
        ExerciseListData *btn = [exerciseBtns objectAtIndex:i];
        
        DZUIButtonWithParameter *tmpButton = [DZUIButtonWithParameter bigMaskButtonWithTitle:btn.exerciseName time: btn.exerciseTime calorie:btn.exerciseCalorie imageName:btn.exerciseImage xPos:btnX yPos:btnY Width:btnW Height:btnH];
        
        tmpButton.parameters = [[NSMutableDictionary alloc] init];
        [tmpButton.parameters setObject:btn.exerciseName forKey:@"pageTitle"];
        
        SEL eventHandler = @selector(goToExerciseDetail:);
        [tmpButton addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
        
        [exerciseSection addSubview:tmpButton];
        
        btnX += (btnW + 15);
        
        if((i + 1) % 2 == 0) {
            btnX = 15;
            btnY += (btnH + 10);
        }
    }
    
    return exerciseSection;
}

- (UILabel *)exerciseSectionName:(NSString *) sectionName {
    //create an label
    float labelHeight = sectionTitleHeight;
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:13.0];
    label.text = sectionName;
    label.frame = CGRectMake(15, 0, DZScreenW, labelHeight);
    label.textColor = AppDefaultFontColor;
    
    yPosition += labelHeight;
    return label;
}

- (void)goToExerciseDetail:(id) sender {
    DZUIButtonWithParameter *btn = (DZUIButtonWithParameter *)sender;
    ExerciseDetailViewController *exerciseUIView = [[ExerciseDetailViewController alloc] init];
    exerciseUIView.pageTitle = btn.parameters[@"pageTitle"];
    [self.navigationController pushViewController:exerciseUIView animated:YES];
}

- (void)request {
    _exerciseList =[[NSMutableArray alloc] init];
    
    // 制作section数据模型
    for (int i = 0; i < 10; i++) {
        ExerciseTableData *sectioni = [ExerciseTableData section];
        sectioni.sectionData = [[NSMutableArray alloc] init];
        
        // 1.section名字
        NSString *tmpexercisename = [NSString stringWithFormat:@"腹部训练 %d",i];
        sectioni.sectionTile = tmpexercisename;
        
        // 2.section数据
        for (int j = 0; j <= i; j++ ) {
            ExerciseListData *tmpContentData = [[ExerciseListData alloc] init];
            tmpContentData.exerciseName = [NSString stringWithFormat:@"西西里卷腹 %d & %d",i, j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.exerciseTime = [NSString stringWithFormat:@"一组10分钟 %d & %d",i, j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.exerciseCalorie = [NSString stringWithFormat:@"78Kcal %d & %d",i, j];//[tmpallnumber stringByAppendingString: tmpallunit];
            tmpContentData.exerciseImage = @"defaultPosition";//[tmpallnumber stringByAppendingString: tmpallunit];
            [sectioni.sectionData addObject:tmpContentData];
        }
        
        [_exerciseList addObject:sectioni];
        
        //NSLog(@"%lu",(unsigned long)_exerciseList.count);
    }
    
    

}

@end
