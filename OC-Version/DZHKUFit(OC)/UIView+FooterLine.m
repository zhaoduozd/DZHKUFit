//
//  UIView+FooterLine.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 18/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UIView+FooterLine.h"

@implementation UIView (FooterLine)

+(UIView *) footerLineWithX:(float) x Y:(float) y {
    UIView *uiview = [[UIView alloc] initWithFrame:CGRectMake(x, y, DZScreenW, 1)];
    uiview.backgroundColor = AppDefaultBorderColorUI;
    return uiview;
    
}

@end
