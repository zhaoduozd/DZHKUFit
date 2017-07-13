//
//  DZLoginViewController.m
//  DZHKUFit(OC)
//
//  Created by Xinhou Jiang on 13/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZLoginViewController.h"
#import "DZMainTabBarViewController.h"

@interface DZLoginViewController ()

@property (nonatomic, weak) IBOutlet UITextField *userInput;
@property (nonatomic, weak) IBOutlet UITextField *passwordInput;
@property (nonatomic, weak) IBOutlet UIButton *loginButton;

@end

@implementation DZLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _userInput.placeholder = @"用户名";
    _passwordInput.placeholder = @"密码";
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login {
    NSLog(@"username:%@ \n password:%@", _userInput.text, _passwordInput.text);
    [self.navigationController pushViewController:[[DZMainTabBarViewController alloc] init] animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
