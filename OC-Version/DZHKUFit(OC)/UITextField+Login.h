//
//  UITextField+Login.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 14/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Login)

+ (UITextField *)loginTextFieldWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y placeHolder:(NSString *) placeHolderTitle fieldType:(NSString *) fieldtype;

@end
