//
//  UITextField+SignIn.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SignIn)

+ (UITextField *)createDZTextFieldWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextMode:(NSString *) textmode;

@end
