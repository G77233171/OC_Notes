//
//  ViewController.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ( )<UITextFieldDelegate>


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *tipsLabel = [NXUtils initLabelWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 50) font:15 text:@"下午茶时间到了，赶快来领取吧！巴拉拉bla"];
    tipsLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tipsLabel];
    
    UITextField *text = [NXUtils initTextFieldWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 50) placeholder:@"输入框blabla" secureEntry:NO textFont:15];
    text.backgroundColor = [UIColor groupTableViewBackgroundColor];
    text.delegate = self;
   // [textField setValue:@4 forKey:@"LimitInput"];
    [self.view addSubview:text];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];

    return YES;
}

@end
