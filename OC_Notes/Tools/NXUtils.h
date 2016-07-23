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
 * 初始化UILabel，黑色字体，居中对齐
 **/
+ (UILabel *)initLabelWithFrame:(CGRect )frame font:(CGFloat)font text:(NSString *)text;



@end
