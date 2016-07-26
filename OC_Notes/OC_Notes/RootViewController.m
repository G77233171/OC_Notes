//
//  ViewController.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "RootViewController.h"
#import "BaiduTranslator.h"

@interface RootViewController ( )<UITextFieldDelegate>

@property (nonatomic, strong)BaiduTranslator *baiduTranslator;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILabel *tipsLabel = [NXUtils initLabelWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 50) font:15 text:@"下午茶时间到了，赶快来领取吧！巴拉拉bla"];
    tipsLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:tipsLabel];
    
    UITextField *text = [NXUtils initTextFieldWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 30) placeholder:@"请输入要翻译的文字" secureEntry:NO textFont:15];
    text.backgroundColor = [UIColor groupTableViewBackgroundColor];
    text.delegate = self;
    [text setValue:@20 forKey:@"LimitInput"];
    [self.view addSubview:text];
    
    NSString *date = [NSString stringWithDateFormat:@"2016-07-08 HH:mm:ss"];
    NSLog(@"date is: %@",date);
    
    
    //[self baiduFanyi];
    _baiduTranslator = [BaiduTranslator sharedTranslator];
    _baiduTranslator.targetLanguage = BDTranslateLanguage_cht;
    _baiduTranslator.speech = NO;
    _baiduTranslator.translatedResults = ^(NSString *results){
        tipsLabel.text = results;
    };
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

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [_baiduTranslator translateString:textField.text];
}

@end
