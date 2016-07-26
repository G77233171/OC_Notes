//
//  NXObject.m
//  OC_Notes
//
//  Created by fgl on 16/7/26.
//  Copyright © 2016年 fgl. All rights reserved.
//

#import "NXObject.h"

@implementation NXObject

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%s\nundefinedKey：%@", __func__,  key);
}

- (id)valueForUndefinedKey:(NSString *)key
{
    NSLog(@"%s\nundefinedKey：%@", __func__, key);
    return nil;
}

@end
