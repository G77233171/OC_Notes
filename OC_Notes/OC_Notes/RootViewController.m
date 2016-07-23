//
//  ViewController.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *tipsLabel = [NXUtils initLabelWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 50) font:15 text:@"下午茶时间到了，赶快来领取吧！巴拉拉bla"];
    tipsLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tipsLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
