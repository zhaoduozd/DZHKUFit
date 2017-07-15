//
//  DZLoginViewController.m
//  DZHKUFit(OC)
//
//  Created by Xinhou Jiang on 13/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZLoginViewController.h"
#import "DZMainTabBarViewController.h"
#import "UITextField+Login.h"

@interface DZLoginViewController ()

@property(nonatomic, strong) UITextField *userInput;
@property(nonatomic, strong) UITextField *passwInput;
@property(nonatomic, strong) UIButton *loginButton;


@end

@implementation DZLoginViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetUI];
    
    
    
    // Do any additional setup after loading the view from its nib.
    //NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"]];
    //NSLog(@"");
}

- (void)resetUI {
    
    /** set root view background  **/

    //set background image
    UIColor *bgUIColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackground"]];
    [self.view setBackgroundColor:bgUIColor];
    
    // create and set mask
    CALayer *maskLayer = [[CALayer alloc] init];
    maskLayer.frame = self.view.frame;
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45].CGColor;
    [[self.view layer] addSublayer:maskLayer];

    
    /** set elements' UI  **/
    
    //set positions
    float yInputField = DZScreenH * 1 / 3;
    float xInput = DZScreenW * (1 - 1/1.5) / 2;
    float xBtn = DZScreenW / 3;
    //set sizes
    float hInput = DZScreenH / 20;
    float wInput = DZScreenW / 1.5;
    float wBtn = DZScreenW / 3;
    float hBtn = DZScreenH / 20;
    
    //init elements
    _userInput = [UITextField loginTextFieldWidth:wInput Height:hInput xPos: xInput yPos: yInputField placeHolder:@"用户名" fieldType:@"username"];
    
    _passwInput = [UITextField loginTextFieldWidth:wInput Height:hInput xPos: xInput yPos: (yInputField+hInput+8) placeHolder:@"密码" fieldType:@"passw"];
    
    _loginButton = [[UIButton alloc] init];
    _loginButton.backgroundColor = AppColor;
    _loginButton.frame = CGRectMake(xBtn, yInputField + hInput*2 + 50, wBtn, hBtn);
    _loginButton.backgroundColor = AppColor;
    [_loginButton.layer setCornerRadius:4.0];
    [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:12];
    
    SEL eventHandler = @selector(login);
    [_loginButton addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    
    _userInput.delegate = self;
    _passwInput.delegate = self;
    
    
    //add elements into root view
    [self.view addSubview:_loginButton];
    [self.view addSubview:_userInput];
    [self.view addSubview:_passwInput];
    
    
}

- (void)login {
    NSLog(@"username:%@ \n password:%@", _userInput.text, _passwInput.text);
    UIViewController *main = [[DZMainTabBarViewController alloc] init];
    [self presentViewController:main animated:YES completion:nil];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES]; //实现该方法是需要注意view需要是继承UIControl而来的
}


@end
