//
//  NSString+NXCategory.h
//  OC_Notes
//
//  Created by fgl on 16/7/25.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface NSString (NXCategory)

/**
 * 计算字符串的Size
 * @param string 待计算的字符串
 * @param font 字体大小
 * @param maxWidth 允许的最大width
 **/
+ (CGSize )sizeWithString:(NSString *)string font:(CGFloat)font maxWidth:(CGFloat)maxWidth;

/**
 * 根据指定格式返回当前时间 eg: 2016.07.25
 * @param dateFormat 时间格式
 **/
+ (NSString *)stringWithDateFormat:(NSString *)dateFormat;

/**
 * 校验是否为手机号码
 * @param number
 **/
- (BOOL)isPhonenumber:(NSString *)number;


//SHA224、256、512加密
- (NSString *)sha224;
- (NSString *)sha256;
- (NSString *)sha512;

//md5加密
- (NSString *)md5;

@end
