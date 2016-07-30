//
//  NXGuideViews.h
//  OC_Notes
//
//  Created by fgl on 16/7/30.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NXGuideView : UIView

/**
 * 初始化GuideView,默认铺满整个屏幕
 * @param imageSource 存储图片名称的数据
 **/
- (instancetype)initGuideViewWithImageSource:(NSArray *)imageSource;

//@required
/**
 * 根据版本号来判断是否显示引导页，一般情况每次更新都会显示
 **/
- (void)show;
- (void)alwaysShow;


//@optional
@property (nonatomic)NSString *buttonTitle;//!<开始button的title
@property (nonatomic)UIColor *titleColor;//!<
@property (nonatomic)UIColor *buttonBackgroundColor;//!<button背景颜色

@end
