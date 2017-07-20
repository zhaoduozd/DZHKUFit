//
//  UILabel+DefaultTableLabel.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DefaultTableLabel)

+ (UILabel *)defaultTableLabelWithText:(NSString *) text yPos:(float) y isBold:(BOOL) bold;

@end
