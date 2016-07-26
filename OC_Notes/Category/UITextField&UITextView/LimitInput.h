//
//  LimitInput.h
//  OC_Notes
//
//  Created by fgl on 16/7/25.
//  Copyright © 2016年 fgl. All rights reserved.
//
//限制textField和textView输入长度
//添加一行代码实现限制文本输入框输入长度的方法
//1. 导入 LimitInput.h和LimitInput.m文件
//2. 在需要的时候，给输入框添加  [inputText setValue:@4 forKey:@"LimitInput"]; 代码即可



#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#define PROPERTY_NAME @"LimitInput"

#define DECLARE_PROPERTY(className) \
@interface className (Limit) @end

DECLARE_PROPERTY(UITextField)
DECLARE_PROPERTY(UITextView)

@interface LimitInput : NSObject

@property (nonatomic, assign)BOOL enableLimitCount;

+ (LimitInput *)sharedInstance;

@end
