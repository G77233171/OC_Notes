//
//  BaiduTranslator.m
//  OC_Notes
//
//  Created by fgl on 16/7/26.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "BaiduTranslator.h"
#import "NSString+NXCategory.h"

@interface BaiduTranslator ()

@property (nonatomic) NSMutableArray *languages;//!<所有支持的语种
@property (nonatomic) NSString *source;//!<source language, default is auto:automatic recognition
@property (nonatomic) NSString *catalanguage;//!<catalanguage, default is cn:chinese
@property (nonatomic, copy)NSString *query;//!<待翻译的文本
@property (nonatomic, copy)NSString *salt;//!<随机字符串

@end

@implementation BaiduTranslator

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self defaultSetting];
    }
    return self;
}

+ (BaiduTranslator *)sharedTranslator
{
    static BaiduTranslator *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[BaiduTranslator alloc] init];
    });
    return instance;
}


- (void)translateString:(NSString *)sourceString
{
    if (!sourceString) return;
    _query = sourceString;
    
    //网络请求，获取翻译结果
    //iOS7以上可以使用NSURLSession，也可以使用第三方的比如: AFNetworking
    NSURL *url = [NSURL URLWithString:[self splicingCompleteRequestAddress]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%s\n%@", __func__, error);
            NSLog(@"error request");
        }
        else
        {
            NSDictionary *dict =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
            NSArray *results = [NSArray arrayWithObject:dict[@"trans_result"]];
            [self.delegate baiduTranslatorDidFinishedTranslated:[results firstObject]];
        }
        
        
    }];
    [dataTask resume];
}



//拼接完整的请求地址
- (NSString *)splicingCompleteRequestAddress
{
    //示例:把'apple'翻译成中文
    //@" http://api.fanyi.baidu.com/api/trans/vip/translate?q=apple&from=en&to=zh&appid=2015063000000001&salt=1435660288&sign=f89f9594663708c1605f3d736d01d2d4";

    //url encode
    NSString *utf8Source = [_query stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //此处必须先获取签名，否则不能生成salt，造成请求地址出错
    NSString *signature = [self signature];
    
    NSString *url = [NSString stringWithFormat:@"http://api.fanyi.baidu.com/api/trans/vip/translate?q=%@&from=%@&to=%@&appid=%@&salt=%@&sign=%@", utf8Source, self.source, self.catalanguage, BAIDU_TRANSLATOR_APPID, _salt, signature];
 
    return url;
}


//生成签名
- (NSString *)signature
{
    //生成一个随机8位数作为salt
    NSString *salt = @"";
    for (int i = 0 ; i < 8; i ++)
    {
       // arc4random_uniform(10); // 生成一个0~9的随机数
        salt = [salt stringByAppendingFormat:@"%i", arc4random()%10];
    }
    _salt = salt;
    
    NSString *sign = [NSString stringWithFormat:@"%@%@%@%@", BAIDU_TRANSLATOR_APPID, _query, salt, BAIDU_TRANSLATOR_APPSECRET];
    
    //md5加密后返回sign
    return [sign md5];
}


//默认设置
//语言列表：http://api.fanyi.baidu.com/api/trans/product/apidoc
- (void)defaultSetting
{
    _source = @"auto";
    _catalanguage = @"zh";
}


//加载所有支持的语言
- (NSMutableArray *)languages
{
    if (!_languages)
    {
        _languages = [NSMutableArray array];
        [_languages addObject:@"auto"];
        [_languages addObject:@"zh"];
        [_languages addObject:@"en"];
        [_languages addObject:@"yue"];
        [_languages addObject:@"jp"];
        [_languages addObject:@"kor"];
        [_languages addObject:@"fra"];
        [_languages addObject:@"cht"];
    }
    return _languages;
}

//设置源语言
- (void)setSourceLanguage:(NSInteger)sourceLanguage
{
    if (sourceLanguage >= 0 && sourceLanguage + 1 <= [self languages].count)
    {
        self.source = self.languages[sourceLanguage];
    }
}

//设置目标语言
- (void)setTargetLanguage:(NSInteger)targetLanguage
{
    if (targetLanguage >= 1 && targetLanguage + 1 <= [self languages].count)
    {
        self.catalanguage = self.languages[targetLanguage];
    }
}


@end
