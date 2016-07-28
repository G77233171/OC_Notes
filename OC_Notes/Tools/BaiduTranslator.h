//
//  BaiduTranslator.h
//  OC_Notes
//
//  Created by fgl on 16/7/26.
//  Copyright © 2016年 fgl. All rights reserved.
//
//百度翻译说明文档http://api.fanyi.baidu.com/api/trans/product/apidoc


#define BAIDU_TRANSLATOR_APPID @"20160726000025786"
#define BAIDU_TRANSLATOR_APPSECRET @"Z_74qcIgm_bdfYXLUbY2"


#import <Foundation/Foundation.h>

@protocol BaiduTranslateDelegate <NSObject>

@optional
/**
 * 翻译完成的代理方法(可选实现)
 **/
- (void)baiduTranslatorDidFinishedTranslated:(NSArray *)results;

@end


enum BDTranslateLanguage
{
    BDTranslateLanguage_auto,       //!<自动检测，源语言语种不确定时可设置为 auto，目标语言语种不可设置为 auto
    BDTranslateLanguage_zh,      //!<中文
    BDTranslateLanguage_en,      //!<英文
    BDTranslateLanguage_yue,    //!<粤语
    BDTranslateLanguage_jp,       //!<日语
    BDTranslateLanguage_kor,     //!<韩语
    BDTranslateLanguage_fra,      //!<法语
    BDTranslateLanguage_cht,     //!<繁体中文
};

@interface BaiduTranslator : NSObject

+ (BaiduTranslator *)sharedTranslator;
- (void)translateString:(NSString *)sourceString;
@property (nonatomic) id<BaiduTranslateDelegate>delegate;

/**
 * 以下参数可看需求自定义
 **/
@property (nonatomic) NSInteger targetLanguage;//!<设置目标语言，不能设置auto
@property (nonatomic) NSInteger sourceLanguage;//!<设置源语言



@end
