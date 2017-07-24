//
//  DZIconsImageView+Icons.h
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZIconsImageView.h"

@interface DZIconsImageView (Icons)

+ (DZIconsImageView *)DZLikeIconWithXPos:(float)x yPos:(float)y IsLike:(BOOL)like;
+ (DZIconsImageView *)DZIconWithXPos:(float)x yPos:(float)y IconName:(NSString *) iconname;

@end
