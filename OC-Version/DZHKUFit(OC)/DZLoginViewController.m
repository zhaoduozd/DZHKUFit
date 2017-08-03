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
@property(nonatomic, strong) UIButton *forgetPassw;
@property(nonatomic, strong) UIButton *signin;

@end

@implementation DZLoginViewController {
    //set positions
    float yInputField;
    float xInput;
    
    //set sizes
    float hInput;
    float wInput;
    
    float xBtn;
    float yBtn;
    float wBtn;
    float hBtn;
};

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    [self resetUI];
}

- (void)resetUI {
    
    [self setRootUI];
    [self setTextInputs];
    [self setLoginBtn];
    [self setSigninAndPassw];
}

- (void)setRootUI {
    
    //set background image
    UIColor *bgUIColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"loginBackground"]];
    [self.view setBackgroundColor:bgUIColor];
    
    // create and set mask
    CALayer *maskLayer = [[CALayer alloc] init];
    maskLayer.frame = self.view.frame;
    maskLayer.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.45].CGColor;
    
    [[self.view layer] addSublayer:maskLayer];
}

- (void)setTextInputs {
    yInputField = DZScreenH * 1 / 3;
    xInput = DZScreenW * (1 - 1/1.5) / 2;
    hInput = DZScreenH / 20;
    wInput = DZScreenW / 1.5;
    
    _userInput = [UITextField loginTextFieldWidth:wInput Height:hInput xPos: xInput yPos: yInputField placeHolder:@"用户名" fieldType:@"username"];
    
    _passwInput = [UITextField loginTextFieldWidth:wInput Height:hInput xPos: xInput yPos: (yInputField+hInput+8) placeHolder:@"密码" fieldType:@"passw"];
    
    _userInput.delegate = self;
    _passwInput.delegate = self;
    
    [self.view addSubview:_userInput];
    [self.view addSubview:_passwInput];
}

- (void)setLoginBtn {
    xBtn = DZScreenW / 3;
    yBtn = yInputField + hInput*2 + 50;
    wBtn = DZScreenW / 3;
    hBtn = DZScreenH / 20;
    NSString *btnTitle = @"登录";
    
    _loginButton = [UIButton DZDefaultBtnWithWidth:wBtn Height:hBtn xPos:xBtn yPos:yBtn Title:btnTitle];
    
    SEL eventHandler = @selector(login);
    [_loginButton addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginButton];
}

- (void)setSigninAndPassw {
    _forgetPassw = [[UIButton alloc] init];
    _signin = [[UIButton alloc] init];
    
    float y = hInput * 2 + 8 + yInputField;
    float xleft = xInput;
    float xright = xInput + wInput - 76;
    
    UIColor *fontColor = [UIColor colorWithRed:130/255.0 green:130/255.0 blue:130/255.0 alpha:1];
    

    _signin.frame = CGRectMake(xleft, y, 100, 26);
    _forgetPassw.frame = CGRectMake(xright, y, 100, 26);
    
    [_signin setTitle:@"没有账号？注册！" forState:UIControlStateNormal];
    [_signin setTitleColor: fontColor forState:UIControlStateNormal];
    _signin.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [_forgetPassw setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [_forgetPassw setTitleColor: fontColor forState:UIControlStateNormal];
    _forgetPassw.titleLabel.font = [UIFont systemFontOfSize:12];
    
    SEL eventHandler = @selector(signIn);
    [_signin addTarget:self action:eventHandler forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_signin];
    [self.view addSubview:_forgetPassw];
}



- (void)login {
    //NSLog(@"username:%@ \n password:%@", _userInput.text, _passwInput.text);
    
    //NSArray *array = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"user" ofType:@"plist"]];
    //NSLog(@"");

    
    UIViewController *main = [[DZMainTabBarViewController alloc] init];
    [self presentViewController:main animated:YES completion:nil];
}

- (void)signIn {
    DZSignInViewController *signUIView = [[DZSignInViewController alloc] init];
    [self.navigationController pushViewController:signUIView animated:YES];
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
