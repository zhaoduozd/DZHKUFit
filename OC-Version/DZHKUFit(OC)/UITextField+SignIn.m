//
//  UITextField+SignIn.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UITextField+SignIn.h"

@implementation UITextField (SignIn)

+ (UITextField *)createDZTextFieldWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextMode:(NSString *) textmode{
    
    UITextField *textfield = [[UITextField alloc] init];
    
    // set frame
    textfield.frame = CGRectMake(x, y, width, height);
    textfield.layer.borderColor = AppDefaultBorderColor;
    textfield.layer.borderWidth = 1;
    [textfield.layer setCornerRadius:4.0];
    
    //textfield.backgroundColor = [UIColor redColor];
    
    // set text font
    textfield.font = [UIFont systemFontOfSize:12];
    textfield.textColor = AppDefaultFontColor;
    
    // set left space
    CGRect frame = [textfield frame];
    frame.size.width = 8.0f;
    [textfield setLeftView:[[UIView alloc] initWithFrame:frame]];
    [textfield setLeftViewMode:UITextFieldViewModeAlways];
    
    // set keyboard
    textfield.keyboardType = UIKeyboardTypeDefault;
    textfield.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    // set text mode
    if ([textmode  isEqual: @"passw"]) {
        textfield.secureTextEntry = YES;
    }
    
    
    return textfield;
}


@end
