//
//  UIScrollView+ExercisePointsShow.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 19/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (ExercisePointsShow)

+(UIScrollView *) exercisePointsShowWithHeigth:(float) height yPos:(float) y exerciseDescription:(NSString *) decription exerciseName:(NSString *) exerciseName;

@end
