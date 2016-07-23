//
//  NXControl.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "NXUtils.h"

@implementation NXUtils

+ (UILabel *)initLabelWithFrame:(CGRect )frame font:(CGFloat)font text:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    if (font <= 0)
    {
        font = [UIFont systemFontSize];
    }
    label.font = [UIFont systemFontOfSize:font];
    label.numberOfLines = 0;
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor blackColor];
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.adjustsFontSizeToFitWidth = YES;
    
    return label;
}


@end
