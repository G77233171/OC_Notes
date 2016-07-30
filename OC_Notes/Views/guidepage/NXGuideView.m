//
//  NXGuideViews.m
//  OC_Notes
//
//  Created by fgl on 16/7/30.
//  Copyright © 2016年 fgl. All rights reserved.
//

#define NXWidth [UIScreen mainScreen].bounds.size.width
#define NXHeight [UIScreen mainScreen].bounds.size.height

#import "NXGuideView.h"
@interface NXGuideView ()<UIScrollViewDelegate>

@property(nonatomic)UIWindow *window;
@property(nonatomic)NSArray *imageSource;

@property(nonatomic)UIScrollView *guideScroll;
@property(nonatomic)UIPageControl *guidePageControl;
@property(nonatomic)UIButton *startButton;

@end


@implementation NXGuideView

-(instancetype)initGuideViewWithImageSource:(NSArray *)imageSource
{
    self = [super init];
    if (self){
        
        [self defaultSetting];
        self.imageSource = imageSource;
    }
    return self;
}

- (void)show
{
    //根据版本号来判断是否显示引导页
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *version = [[NSBundle mainBundle].infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    BOOL show = [userDefaults boolForKey:[NSString stringWithFormat:@"version_%@", version]];
    if (!show)
    {
        [self alwaysShow];
    }
    
    //保存新的版本号
    [userDefaults setBool:YES forKey:[NSString stringWithFormat:@"version_%@",version]];
    [userDefaults synchronize];
}

- (void)alwaysShow
{
    [self.window addSubview:self];
    
    [self guideScroll];
    [self guidePageControl];
    [self startButton];
}

#pragma mark——基本方法
- (void)defaultSetting
{
    self.window = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake(0, 0, NXWidth, NXHeight);
    self.buttonTitle = @"马上体验";
    self.titleColor = [UIColor whiteColor];
    self.buttonBackgroundColor = [UIColor redColor];
}

- (void)startAction
{
    [UIView animateWithDuration:2.0f animations:^{
        self.alpha = 0.f;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


#pragma mark——懒加载
- (UIScrollView *)guideScroll
{
    if (_guideScroll == nil)
    {
        self.guideScroll = [[UIScrollView alloc] init];
        self.guideScroll.frame = CGRectMake(0, 0, NXWidth, NXHeight);
        self.guideScroll.pagingEnabled = YES;
        self.guideScroll.bounces = NO;
        self.guideScroll.delegate = self;
        self.guideScroll.showsVerticalScrollIndicator = NO;
        self.guideScroll.showsHorizontalScrollIndicator = NO;
        self.guideScroll.contentSize = CGSizeMake(NXWidth *self.imageSource.count, NXHeight);
        [self addSubview:self.guideScroll];
        
        //添加图片
        for (NSInteger i = 0; i < self.imageSource.count; i ++)
        {
            UIImageView *guideImages = [[UIImageView alloc] init];
            guideImages.frame = CGRectMake(NXWidth *i, 0, NXWidth, NXHeight);
            guideImages.image = [UIImage imageNamed:[self.imageSource objectAtIndex:i]];
            [self.guideScroll addSubview:guideImages];
        }
    }
    
    return _guideScroll;
}

//
- (UIPageControl *)guidePageControl
{
    if (_guidePageControl == nil)
    {
        CGFloat interval = 150.f;
        self.guidePageControl = [[UIPageControl alloc] init];
        self.guidePageControl.frame = CGRectMake(interval, NXHeight - 80, NXWidth - 2 *interval, 30);
//        self.guidePageControl.backgroundColor = [UIColor greenColor];
//        self.guidePageControl.pageIndicatorTintColor = [UIColor whiteColor];
//        self.guidePageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        self.guidePageControl.numberOfPages = self.imageSource.count;
        [self addSubview:self.guidePageControl];
    }
    return _guidePageControl;
}

//
- (UIButton *)startButton
{
    if (_startButton == nil)
    {
        self.startButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.startButton setFrame:CGRectMake(0, 0, 120, 35)];
        CGFloat x = (self.imageSource.count - 0.5) *NXWidth;
        [self.startButton setCenter:CGPointMake(x, NXHeight - 150)];
        self.startButton.layer.cornerRadius = 5.f;
        //self.startButton.alpha = 0.9f;
        self.startButton.titleLabel.font = [UIFont boldSystemFontOfSize:18.0f];
        [self.startButton setTitle:self.buttonTitle forState:UIControlStateNormal];
        [self.startButton setTitleColor:self.titleColor forState:UIControlStateNormal];
        [self.startButton setBackgroundColor:self.buttonBackgroundColor];
        [self.startButton addTarget:self action:@selector(startAction) forControlEvents:UIControlEventTouchUpInside];
        
        [self.guideScroll addSubview:self.startButton];
    }
    return _startButton;
}

#pragma mark——代理方法
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.guidePageControl.currentPage = (scrollView.contentOffset.x / self.frame.size.width);
}

@end
