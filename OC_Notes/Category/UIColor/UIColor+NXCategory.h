//
//  UIColor+NXCategory.h
//  OC_Notes
//
//  Created by fgl on 16/7/25.
//  Copyright © 2016年 fgl. All rights reserved.
//
//UIColor的扩展

#import <UIKit/UIKit.h>

@interface UIColor (NXCategory)

//使用16进制字符串表达颜色
+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

//简化RGBColor(0~255可以直接使用)
+ (UIColor *)rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;
+ (UIColor *)rgbColorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

//随机色
+ (UIColor *)randomColor;


@end
