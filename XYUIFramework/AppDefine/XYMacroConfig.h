//
//  XYMacroConfig.h
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NumOrLetter  @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\n"

#define ALPHANUM @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789" //用于限制特殊字符输入


#if __IPHONE_OS_VERSION_MIN_REQUIRED >= __IPHONE_8_0
#define NSYearCalendarUnit  NSCalendarUnitYear
#define NSMonthCalendarUnit  NSCalendarUnitMonth
#define NSDayCalendarUnit  NSCalendarUnitDay
#define NSHourCalendarUnit NSCalendarUnitHour
#define NSMinuteCalendarUnit NSCalendarUnitMinute
#define NSSecondCalendarUnit NSCalendarUnitSecond
#define NSWeekCalendarUnit NSCalendarUnitWeekOfMonth || NSCalendarUnitWeekOfYear
#define NSGregorianCalendar NSCalendarIdentifierGregorian
#define NSChineseCalendar NSCalendarIdentifierChinese
#define NSWeekdayCalendarUnit NSCalendarUnitWeekday
#define NSWeekdayOrdinalCalendarUnit NSCalendarUnitWeekdayOrdinal
#else
#define NSYearCalendarUnit  NSYearCalendarUnit
#define NSMonthCalendarUnit  NSMonthCalendarUnit
#define NSDayCalendarUnit  NSDayCalendarUnit
#define NSHourCalendarUnit NSHourCalendarUnit
#define NSMinuteCalendarUnit NSMinuteCalendarUnit
#define NSSecondCalendarUnit NSSecondCalendarUnit
#define NSGregorianCalendar NSGregorianCalendar
#define NSChineseCalendar NSChineseCalendar
#define NSWeekCalendarUnit NSWeekCalendarUnit
#define NSWeekdayCalendarUnit NSWeekdayCalendarUnit
#define NSWeekdayOrdinalCalendarUnit NSWeekdayOrdinalCalendarUnit
#endif


#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(format, ...)
#define debugMethod()
#endif


#define WeakSelf __weak typeof(self) weakSelf = self;


#define KAlertNowLoading [XYMacroConfig loadingPromptMessage]
#define KAlertUploading [XYMacroConfig uploadingPromptMessage]
#define KAlertConfirming [XYMacroConfig submitPromptMessage]
#define LCNETWORKERROR [XYMacroConfig networkAnomalyPromptMessage]


#define KApp_DownloadUrl [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@",AppStore_AppleId]

#define KApp_ReviewUrl [NSString stringWithFormat:@"itms-apps://itunes.apple.com/app/id%@?action=write-review", AppStore_AppleId]

#define AppStore_AppleId [XYMacroConfig appStoreAppleId]



@interface XYMacroConfig : NSObject

/**
 * APP的AppleId
 */
+ (NSString*)appStoreAppleId;

+ (void)xy_setAppStoreAppleId:(NSString *)appStoreAppleId;


/**
 * 倒计时
 */
+ (NSInteger)countDownTime;

+ (void)xy_setCountDownTime:(NSInteger)countDownTime;


/**
 * 单页数
 */

+ (NSInteger)pageSize;

+ (void)xy_setPageSize:(NSInteger)pageSize;

/**
 * 加载中提示信息
 */

+ (NSString*)loadingPromptMessage;

+ (void)xy_setLoadingPromptMessage:(NSString*)loadingPromptMessage;

/**
 * 上传中提示信息
 */

+ (NSString*)uploadingPromptMessage;

+ (void)xy_setUploadingPromptMessage:(NSString*)uploadingPromptMessage;

/**
 * 提交提示信息
 */

+ (NSString*)submitPromptMessage;

+ (void)xy_setSubmitPromptMessage:(NSString*)submitPromptMessage;

/**
 * 网络异常提示信息
 */

+ (NSString*)networkAnomalyPromptMessage;

+ (void)xy_setNetworkAnomalyPromptMessage:(NSString*)networkAnomalyPromptMessage;


@end
