//
//  ViewController.m
//  OC_Notes
//
//  Created by fgl on 16/7/23.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "RootViewController.h"
#import "BaiduTranslator.h"
//iOS7及以上可以引入SpeechSynthesizer.h，朗读翻译结果
#import "SpeechSynthesizer.h"
#import "NXGuideView.h"

@interface RootViewController ( )<UITextFieldDelegate, BaiduTranslateDelegate>

@property (nonatomic, strong)BaiduTranslator *baiduTranslator;
@property (nonatomic, strong)UILabel *tipsLabel;


@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    _tipsLabel = [NXUtils initLabelWithFrame:CGRectMake(20, 100, self.view.frame.size.width - 40, 50) font:15 text:@"下午茶时间到了，赶快来领取吧！巴拉拉bla"];
    _tipsLabel.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_tipsLabel];
    
    UITextField *text = [NXUtils initTextFieldWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 30) placeholder:@"请输入要翻译的文字" secureEntry:NO textFont:15];
    text.backgroundColor = [UIColor groupTableViewBackgroundColor];
    text.delegate = self;
    [text setValue:@20 forKey:@"LimitInput"];
    [self.view addSubview:text];
    
//    根据指定格式返回当前日期时间
//    NSString *date = [NSString stringWithDateFormat:@"2016-07-08 HH:mm:ss"];
//    NSLog(@"date == %@",date);
    
    _baiduTranslator = [BaiduTranslator sharedTranslator];
    _baiduTranslator.targetLanguage = BDTranslateLanguage_en;
    _baiduTranslator.delegate = self;

    //系统支持的语种
    //NSLog(@"%@", [AVSpeechSynthesisVoice speechVoices]);
    
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

//@protocol
- (void)baiduTranslatorDidFinishedTranslated:(NSArray *)results
{
    NSLog(@"results == %@", results);
    NSString *string = @"";
    for (NSDictionary *dict in results)
    {
        NSString *dst = dict[@"dst"];
        string = [string stringByAppendingString:dst];
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        _tipsLabel.text = string;
    });
   
    //朗读翻译结果
    SpeechSynthesizer *speechSynthes = [SpeechSynthesizer sharedSpeechSynthesizer];
    //请保持翻译结果和朗读语种一致
    speechSynthes.voiceLanguage = NXSpeechVoiceLanguageEnglish;
    [speechSynthes startSpeak:string];
}
@end
