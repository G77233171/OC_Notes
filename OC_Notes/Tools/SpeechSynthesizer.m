//
//  SpeechSynthesizer.m
//  OC_Notes
//
//  Created by fgl on 16/7/26.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "SpeechSynthesizer.h"

@interface SpeechSynthesizer()<AVSpeechSynthesizerDelegate>

@property(nonatomic, strong, readwrite) AVSpeechSynthesizer *speechSynthesizer;

@end

@implementation SpeechSynthesizer

-(instancetype)init
{
    self = [super init];
    if (self)
    {
        [self initSpeechSynthesizer];
    }
    return self;
}


+ (SpeechSynthesizer *)sharedSpeechSynthesizer
{
    static SpeechSynthesizer *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        instance = [[SpeechSynthesizer alloc] init];
    });
    return instance;
}

- (void)initSpeechSynthesizer
{
    if ([[UIDevice currentDevice].systemVersion floatValue] < 7.0) return;
    
    self.speechSynthesizer = [[AVSpeechSynthesizer alloc] init];
    self.speechSynthesizer.delegate = self;
}

- (void)startSpeak:(NSString *)string
{
    if (self.speechSynthesizer)
    {
        AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:string];
        if (self.language)
        {
            [utterance setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:self.language]];
        }else  [utterance setVoice:[AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];
        
        if ([self.speechSynthesizer isSpeaking]) [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
        
        [self.speechSynthesizer speakUtterance:utterance];
    }
}

- (void)stopSpeak
{
    if (self.speechSynthesizer) [self.speechSynthesizer stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

- (void)setVoiceLanguage:(NXSpeechVoiceLanguage)voiceLanguage
{
    NSArray *languages = @[@"zh-CN", @"en-US", @"ja-JP", @"zh-HK", @"zh-TW"];
    if (voiceLanguage >= 0 && voiceLanguage + 1 < [languages count]) self.language = languages[voiceLanguage];
}


//合成结束的回调方法
- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance
{
    if (self.speechSynthesizerDidFinishedSpeech) self.speechSynthesizerDidFinishedSpeech();
}


@end
