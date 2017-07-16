//
//  UILabel+SignLabelTitle.m
//  DZHKUFit(OC)
//
//  Created by Dora Zhao on 16/7/2017.
//  Copyright © 2017 Duo Zhao. All rights reserved.
//

#import "UILabel+SignLabelTitle.h"

@implementation UILabel (SignLabelTitle)

+ (UILabel *)createDZTitleLabelWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextContent:(NSString *) text {
    
    UILabel *titlelabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    //set text content
    titlelabel.text = text;
    
    //set text font style
    titlelabel.textColor = AppDefaultFontColor;
    titlelabel.font = [UIFont systemFontOfSize:14];
    
    return titlelabel;
}

+ (UILabel *)createDZDetailLabelWithWidth:(float) width Height:(float) height xPos:(float) x yPos:(float) y TextContent:(NSString *) text {
    
    UILabel *detaillabel = [[UILabel alloc] initWithFrame:CGRectMake(x, y, width, height)];
    
    //set text content
    detaillabel.text = text;
    
    //set text font style
    detaillabel.textColor = [UIColor blueColor];
    detaillabel.font = [UIFont systemFontOfSize:10];
    
    return detaillabel;
}

@end
