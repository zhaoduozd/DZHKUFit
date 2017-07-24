//
//  UIButton+Default.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZUIButtonWithParameter.h"


@interface UIButton (Default)

+ (UIButton *)DZDefaultBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float)y Title:(NSString *) btntitle;
+ (UIButton *)DZDefaultLineBtnWithWidth:(float)width Height:(float)height xPos:(float)x yPos:(float)y Title:(NSString *) btntitle;

+ (DZUIButtonWithParameter *)DZParameterLineBtnWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y Title:(NSString *) btntitle;

@end
