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
    UIColor *borderColor = [UIColor colorWithRed:100/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    NSMutableAttributedString *placeholderstring = [[NSMutableAttributedString alloc] initWithString:placeHolderTitle];
    NSNumber * value = [NSNumber numberWithInteger:NSTextAlignmentCenter];
    [placeholderstring addAttribute:NSForegroundColorAttributeName value:borderColor range:NSMakeRange(0, placeHolderTitle.length)];
    [placeholderstring addAttribute:NSFontAttributeName
                        value:[UIFont boldSystemFontOfSize:12]
                        range:NSMakeRange(0, placeHolderTitle.length)];
    
    
    textField.frame = CGRectMake(x, y, width, height);
    textField.layer.borderColor = borderColor.CGColor;
    textField.layer.borderWidth = 1;
    textField.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    textField.attributedPlaceholder = placeholderstring;
    textField.textColor = borderColor;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.keyboardAppearance = UIKeyboardAppearanceAlert;
    [textField setValue:value forKeyPath:@"_placeholderLabel.textAlignment"];
    textField.font = [UIFont boldSystemFontOfSize:12];
    textField.textAlignment = UITextAlignmentCenter;
    [textField.layer setCornerRadius:4.0];
    
    if([fieldtype  isEqual: @"passw"]) {
        textField.secureTextEntry = YES;
    }
    
    return textField;
}


@end
