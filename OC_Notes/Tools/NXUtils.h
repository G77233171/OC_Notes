//
//  NXControl.h
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//
//简化UIView的初始化

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NXUtils: NSObject

/**
 *  初始化UIView
 **/
+ (UIView *)initViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color cornerRadius:(CGFloat)radius;

/**
 * 初始化UILabel，黑色字体，居中对齐
 **/
+ (UILabel *)initLabelWithFrame:(CGRect )frame font:(CGFloat)font text:(NSString *)text;

/**
 * 初始化UIImageView, 并设置userInteractionEnabled=YES
 **/
+ (UIImageView*)initImageViewWithFrame:(CGRect)frame imageName:(NSString*)imageName;

/**
 * 初始化自定义类型的UIButton
 * @param title NormalState
 * @param titleColor NormalState
 **/
+(UIButton *)initButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)radius target:(id)target action:(SEL)action;

/**
 * 初始化UITextField
 **/
+ (UITextField *)initTextFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder secureEntry:(BOOL)isSecureEntry textFont:(CGFloat)font;

@end
