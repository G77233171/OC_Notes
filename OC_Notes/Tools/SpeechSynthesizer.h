//
//  SpeechSynthesizer.h
//  OC_Notes
//
//  Created by fgl on 16/7/26.
//  Copyright © 2016年 fgl. All rights reserved.
//
//iOS7及以上版本可以使用的语音合成

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <AVFoundation/AVSpeechSynthesis.h>

typedef NS_ENUM(NSInteger, NXSpeechVoiceLanguage)
{
    NXSpeechVoiceLanguageDefault = 0, //!<中文
    NXSpeechVoiceLanguageEnglish,       //!<英文
    NXSpeechVoiceLanguageJapanese,     //!<日语
    NXSpeechVoiceLanguageHongKong,  //!<中文-香港
    NXSpeechVoiceLanguageTaiWan       //!<中文-台湾
};


@interface SpeechSynthesizer : NSObject

+ (SpeechSynthesizer *)sharedSpeechSynthesizer;
- (void)startSpeak:(NSString *)string;
- (void)stopSpeak;

/**
 * 以下属性可根据需求选择实现
 **/
@property (nonatomic) NSString *language;//!<直接设置语言
@property (nonatomic) NXSpeechVoiceLanguage voiceLanguage;//!<枚举法设置语言
@property (nonatomic) void(^speechSynthesizerDidFinishedSpeech)();//!<合成结束的回调


@end
