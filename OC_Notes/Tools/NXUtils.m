//
//  NXControl.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "NXUtils.h"

@implementation NXUtils

+ (UIView *)initViewWithFrame:(CGRect)frame backgroundColor:(UIColor *)color cornerRadius:(CGFloat)radius
{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    view.layer.cornerRadius = radius;
    
    
    return view;
}


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

+ (UIImageView *)initImageViewWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = [UIImage imageNamed:imageName];
    imageView.userInteractionEnabled = YES;
    
    
    return imageView;
}

+ (UIButton *)initButtonWithFrame:(CGRect)frame backgroundColor:(UIColor *)backgroundColor title:(NSString *)title titleColor:(UIColor *)titleColor cornerRadius:(CGFloat)radius target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = backgroundColor;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.layer.cornerRadius = radius;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
}

+ (UITextField *)initTextFieldWithFrame:(CGRect)frame placeholder:(NSString *)placeholder secureEntry:(BOOL)isSecureEntry textFont:(CGFloat)font
{
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = frame;
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleNone;
    textField.keyboardType = UIKeyboardTypeDefault;
    //自动纠错
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    textField.font = [UIFont systemFontOfSize:font];

    
    return textField;
}

+ (UIScrollView *)initScrollViewWithFrame:(CGRect)frame contentSize:(CGSize)contentSize
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:frame];
    scrollView.contentSize = contentSize;
    scrollView.pagingEnabled = YES;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    
    
    return scrollView;
}

@end
