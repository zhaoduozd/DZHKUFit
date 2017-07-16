//
//  UILabel+SignLabelTitle.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SignLabelTitle)

+ (UILabel *)createDZTitleLabelWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextContent:(NSString *) text;

+ (UILabel *)createDZDetailLabelWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextContent:(NSString *) text;

@end
