//
//  XYLocalStorageUtil.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYLocalStorageUtil.h"

@implementation XYLocalStorageUtil

+(void) setArray:(NSArray *)info forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:info forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSArray *) getArray:(NSString *)key
{
    NSArray *info = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return info;
}

+(void) setInfo:(NSString *)info forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:info forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *) getInfo:(NSString *)key
{
     NSString *info = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    if (info == nil)
    {
        return @"";
    }
    return info;
}

+ (BOOL) getBoolValue:(NSString *) key
{
	NSNumber *v = (NSNumber *) [[NSUserDefaults standardUserDefaults]
								objectForKey:key];
    BOOL boolValue = v && v.boolValue;
	return boolValue;
}

+(void) setBoolValue:(BOOL) v forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:v]
											  forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void) removeInfo:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
