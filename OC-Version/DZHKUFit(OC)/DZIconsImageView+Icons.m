//
//  DZIconsImageView+Icons.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 20/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "DZIconsImageView+Icons.h"

@implementation DZIconsImageView (Icons)

+ (DZIconsImageView *)DZLikeIconWithXPos:(float)x yPos:(float)y IsLike:(BOOL)like {
    UIImage *likeicon;
    if (like) {
        likeicon = [UIImage imageNamed:@"likeit"];
    } else {
        likeicon = [UIImage imageNamed:@"like"];
    }
    DZIconsImageView *likeiconview = [[DZIconsImageView alloc] initWithImage:likeicon];
    
    likeiconview.frame = CGRectMake(DZScreenW-40, 5, 26, 26);
    likeiconview.clipsToBounds = YES;
    [likeiconview setUserInteractionEnabled:YES];
    
    return likeiconview;
}

+ (DZIconsImageView *)DZIconWithXPos:(float)x yPos:(float)y IconName:(NSString *) iconname{
    UIImage *icon;
    icon = [UIImage imageNamed:iconname];
    
    DZIconsImageView *iconview = [[DZIconsImageView alloc] initWithImage:icon];
    
    iconview.frame = CGRectMake(x, y, 20, 20);
    iconview.clipsToBounds = YES;
    //[iconview setUserInteractionEnabled:YES];
    
    return iconview;
}

@end
