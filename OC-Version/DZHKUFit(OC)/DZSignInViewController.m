//
//  DZSignInViewController.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZSignInViewController.h"

@interface DZSignInViewController ()

@property(nonatomic, strong) UIView *rootView;
@property(nonatomic, strong) UIView *elementsField;
@property(nonatomic, strong) UIButton *siginButton;
@property(nonatomic, strong) NSMutableArray<UITextField *> *signinTextFields;
@property(nonatomic, strong) NSMutableArray<UILabel *> *signinLabel;
@property(nonatomic, strong) NSMutableArray<UILabel *> *signinDetailLabel;
@property(nonatomic, strong) NSArray<NSString *> *labelTitle;
@property(nonatomic, strong) NSArray<NSString *> *detailLabelContent;

@end

@implementation DZSignInViewController {
    float x0;
    float y0;
    float wSignField;
    float hSignField;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setBasicData];
    [self setUI];
}

- (void)setBasicData {
    _labelTitle = @[@"昵  称: *", @"邮  箱: *", @"密  码: *", @"确认密码: *"];
    _detailLabelContent = @[@" 4~20位字母，数字或中文的组合", @"", @" 8～16位字母，数字的组合", @""];
    x0 = DZScreenW/10;
    y0 = 150;
    wSignField = DZScreenW/5*4;
    hSignField = DZScreenH;
}

- (void)setUI {
    
    _rootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DZScreenW, DZScreenH)];
    _elementsField = [[UIView alloc] initWithFrame:CGRectMake(x0, y0, wSignField, hSignField)];
    
    _rootView.backgroundColor = AppDefaultSubViewBackgroundColor;
    
    [self addSubElements];
    [_rootView addSubview:_elementsField];
    [self.view addSubview:_rootView];
}

- (void)addSubElements {
    
    float wtf = wSignField/4*3, htf = DZScreenH/20;
    float wdl = wtf, hdl = 20;
    float wtl = wSignField/4, htl = DZScreenH/20;
    float wbtn = wSignField/3, hbtn = htl;
    
    float xtl = 0, ytl = 0;
    float xtf = wSignField/4, ytf = 0;
    float xdl = xtf, ydl = htf;
    float xbtn = wSignField/3, ybtn;
    
    for ( int i = 0; i < 4; i++ ) {
        NSString *textmode;
        
        if (i == 3 || i == 2) {
            textmode = @"passw";
        }
        
        UILabel *tmptitle = [UILabel createDZTitleLabelWithWidth:wtl Height:htl xPos:xtl yPos:ytl TextContent:_labelTitle[i]];
        UILabel *tmpdetail = [UILabel createDZDetailLabelWithWidth:wdl Height:hdl xPos:xdl yPos:ydl TextContent:_detailLabelContent[i]];
        UITextField *tmptextfield = [UITextField createDZTextFieldWithWidth:wtf Height:htf xPos:xtf yPos:ytf TextMode:textmode];
        
        [_elementsField addSubview:tmptitle];
        [_elementsField addSubview:tmptextfield];
        [_elementsField addSubview:tmpdetail];
        
        
        
        ytl += (htf + 24);
        ytf += (htf + 24);
        ydl += (htf + 24);
    }
    
    // add sign button
    ybtn = ydl + 10;
    _siginButton = [UIButton DZDefaultBtnWithWidth:wbtn Height:hbtn xPos:xbtn yPos:ybtn Title:@"注册"];
    [_elementsField addSubview:_siginButton];
}

@end
