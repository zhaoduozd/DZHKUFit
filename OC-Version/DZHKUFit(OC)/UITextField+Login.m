//
//  UITextField+Login.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 14/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UITextField+Login.h"

@implementation UITextField (Login)

+ (UITextField *)loginTextFieldWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y placeHolder:(NSString *) placeHolderTitle fieldType: fieldtype {
    
    UITextField *textField = [[UITextField alloc] init];
    NSNumber * value = [NSNumber numberWithInteger:NSTextAlignmentCenter];
    
    
    // define and set placeholder
    NSMutableAttributedString *placeholderstring = [[NSMutableAttributedString alloc] initWithString:placeHolderTitle];
    
    [placeholderstring addAttribute:NSForegroundColorAttributeName value:AppLoginTextColor range:NSMakeRange(0, placeHolderTitle.length)];
    
    [placeholderstring addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:12]
                        range:NSMakeRange(0, placeHolderTitle.length)];
    
    // set frame
    textField.frame = CGRectMake(x, y, width, height);
    textField.layer.borderColor = AppLoginBorderColor;
    textField.layer.borderWidth = 1;
    [textField.layer setCornerRadius:4.0];
    textField.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    // set text font
    textField.font = [UIFont systemFontOfSize:12];
    textField.textColor = AppLoginTextColor;
    textField.textAlignment = UITextAlignmentCenter;
    
    // set keyboard
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    // set placeholder
    textField.attributedPlaceholder = placeholderstring;
    [textField setValue:value forKeyPath:@"_placeholderLabel.textAlignment"];
    
    // set text mode
    if([fieldtype  isEqual: @"passw"]) {
        textField.secureTextEntry = YES;
    }
    
    return textField;
}


@end
