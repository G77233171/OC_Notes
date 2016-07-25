//
//  LimitInput.m
//  OC_Notes
//
//  Created by fgl on 16/7/25.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "LimitInput.h"
#import <objc/runtime.h>

#define RUNTIME_ADD_PROPERTY(propertyName)      \
-(id)valueForUndefinedKey:(NSString *)key {     \
if ([key isEqualToString:propertyName]) {   \
return objc_getAssociatedObject(self, key.UTF8String);  \
}                                           \
return nil;                                 \
}                                               \
-(void)setValue:(id)value forUndefinedKey:(NSString *)key { \
if ([key isEqualToString:propertyName]) {               \
objc_setAssociatedObject(self, key.UTF8String, value, OBJC_ASSOCIATION_RETAIN); \
}                                                       \
}

#define IMPLEMENT_PROPERTY(className) \
@implementation className (Limit) RUNTIME_ADD_PROPERTY(PROPERTY_NAME) @end

IMPLEMENT_PROPERTY(UITextField)
IMPLEMENT_PROPERTY(UITextView)

@implementation LimitInput

+ (void)load
{
    [super load];
    [LimitInput sharedInstance];
}

+ (LimitInput *)sharedInstance
{
    static LimitInput *limitInput;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        limitInput = [[LimitInput alloc] init];
        limitInput.enableLimitCount = YES;
    });
    
    return limitInput;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        //添加监听
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewDidChange:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}


//实现方法
- (void)textFieldDidChange:(NSNotification *)noti
{
    if (!self.enableLimitCount) return;
    UITextField *textField = (UITextField *)noti.object;
    NSNumber *number = [textField valueForKey:PROPERTY_NAME];
    if (number && textField.text.length > [number integerValue] && textField.markedTextRange == nil)
    {
        textField.text = [textField.text substringWithRange:NSMakeRange(0, [number integerValue])];
    }
}

- (void)textViewDidChange:(NSNotification *)noti
{
    if (!self.enableLimitCount) return;
    UITextView *textView = (UITextView *)noti.object;
    NSNumber *number = [textView valueForKey:PROPERTY_NAME];
    if (number && textView.text.length > [number integerValue] && textView.markedTextRange == nil)
    {
        textView.text = [textView.text substringWithRange:NSMakeRange(0, [number integerValue])];
    }
}

@end
