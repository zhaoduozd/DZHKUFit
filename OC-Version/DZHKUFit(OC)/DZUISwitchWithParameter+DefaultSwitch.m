//
//  DZUISwitchWithParameter+DefaultSwitch.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 25/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZUISwitchWithParameter+DefaultSwitch.h"

@implementation DZUISwitchWithParameter (DefaultSwitch)

+ (DZUISwitchWithParameter *) defaultSwitchWithY:(float) y {
    DZUISwitchWithParameter *myswitch = [[DZUISwitchWithParameter alloc] initWithFrame:CGRectMake(DZScreenW-75, y, 0, 0)];
    
    myswitch.transform = CGAffineTransformMakeScale(0.7, 0.7);
    myswitch.layer.anchorPoint = CGPointMake(0, 0.3);
    
    return myswitch;
}

@end
