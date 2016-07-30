//
//  AppDelegate.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "AppDelegate.h"
#import "NXGuideView.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self deviceInfo];
    
    RootViewController *rootCtl = [[RootViewController alloc] init];
    //RootViewController *rootCtl = [NSClassFromString(@"RootViewController") new];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:rootCtl];
    [self.window makeKeyAndVisible];
    
    //guide
    NSArray *imageSource = @[@"theme_08.jpg", @"theme_03.jpg"];
    NXGuideView *guideView = [[NXGuideView alloc] initGuideViewWithImageSource:imageSource];
    //guideView.buttonTitle = @"马上开始";
    [guideView show];
    //一直显示
    //[guideView alwaysShow];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark
#pragma mark————基本方法
/**
 * 获取设备信息
 **/
- (void)deviceInfo
{
    UIDevice *device = [UIDevice currentDevice];
    NSLog(@"设备名称：%@  设备型号：%@  系统版本：%@", device.name, device.model,  device.systemVersion);
}


@end
