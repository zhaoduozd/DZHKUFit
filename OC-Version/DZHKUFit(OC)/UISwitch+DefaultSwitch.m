//
//  UISwitch+DefaultSwitch.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UISwitch+DefaultSwitch.h"

@implementation UISwitch (DefaultSwitch)

+ (UISwitch *) defaultSwitchWithY:(float) y {
    UISwitch *myswitch = [[UISwitch alloc] initWithFrame:CGRectMake(DZScreenW-75, y, 0, 0)];
    
    myswitch.transform = CGAffineTransformMakeScale(0.7, 0.7);
    myswitch.layer.anchorPoint = CGPointMake(0, 0.3);
    
    return myswitch;
}

@end
