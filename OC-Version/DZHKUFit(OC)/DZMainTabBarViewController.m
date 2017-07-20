//
//  DZMainTabBarViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 9/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZMainTabBarViewController.h"
#import "DZRecomViewController.h"
#import "DZExerciseViewController.h"
#import "DZFoodTableViewController.h"
#import "DZPersonalTableViewController.h"

@interface DZMainTabBarViewController ()

@property(nonatomic, strong) NSArray *Titles;
@property(nonatomic, strong) NSArray *Icons;
@property(nonatomic, strong) NSArray *ClassNames;

@end

@implementation DZMainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _Titles = @[@"推荐",@"运动",@"食物",@"我"];
    _Icons = @[@"recom",@"exercise",@"food",@"personal"];
    _ClassNames = @[@"DZRecomViewController",@"DZExerciseViewController",@"DZFoodTableViewController",@"DZPersonalTableViewController"];

    [self addChildVC];
    self.tabBar.tintColor = AppDefaultColor;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


- (void) addChildVC {
    for (int i = 0; i<_Titles.count; i++) {
        Class class = NSClassFromString(_ClassNames[i]);
        UIViewController *vc = [[class alloc] init];
        
        vc.title = _Titles[i];
        
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        nav.tabBarItem.title = _Titles[i];
        nav.tabBarItem.image = [UIImage imageNamed:_Icons[i]];
        
        //nav.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",_Icons[i]]];
        
        // 导航栏背景色
        [nav.navigationBar setBarTintColor:AppDefaultBarTintColor];
        nav.navigationBar.translucent = NO;
        [nav.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
        
//        if([_Titles[i] isEqual: @"我"]) {
//            nav.navigationItem.title = @"";
//        }
        
        [self addChildViewController:nav];
    }
}


@end
