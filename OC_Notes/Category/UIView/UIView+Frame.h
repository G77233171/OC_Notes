//
//  UIView+Frame.h
//  OC_Notes
//
//  Created by fgl on 16/7/25.
//  Copyright © 2016年 fgl. All rights reserved.
//
//更方便的设置UIView的frame参数

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;
@property (nonatomic, assign) CGPoint origin;


@end
