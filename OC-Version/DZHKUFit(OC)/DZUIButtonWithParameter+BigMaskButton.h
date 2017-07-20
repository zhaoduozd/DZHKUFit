//
//  DZUIButtonWithParameter+BigMaskButton.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZUIButtonWithParameter.h"

@interface DZUIButtonWithParameter (BigMaskButton)

+ (DZUIButtonWithParameter *) bigMaskButtonWithTitle:(NSString *) title time:(NSString *) time calorie:(NSString *) calorie imageName:(NSString *) imageName xPos:(float) x yPos:(float) y Width:(float) width Height:(float) height;

@end
