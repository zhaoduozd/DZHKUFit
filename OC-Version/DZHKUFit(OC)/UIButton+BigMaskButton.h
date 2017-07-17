//
//  UIButton+BigMaskButton.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BigMaskButton)

+ (UIButton *) bigMaskButtonWithTitle:(NSString *) title time:(NSString *) time calorie:(NSString *) calorie imageName:(NSString *) imageName xPos:(float) x yPos:(float) y Width:(float) width Height:(float) height;

@end
