//
//  XYBundleInfoHelper.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XYBundleInfoHelper : NSObject
/**
 * 当前App Build版本号
 */
+ (NSString *)CFBundleVersion;

/**
 * 当前App版本号
 */
+ (NSString*)CFBundleShortVersionString;

/**
 * Mac 版本
 */
+ (NSString*)BuildMachineOSBuild;

/**
 * 本地化设置
 */
+ (NSString*)CFBundleDevelopmentRegion;

/**
 * 当前App安装包名称
 */
+ (NSString*)CFBundleExecutable;

/**
 * bundle id
 */
+ (NSString*)CFBundleIdentifier;

/**
 * info.plist格式化版本号
 */
+ (NSString*)CFBundleInfoDictionaryVersion;

/**
 * 程序名称
 */
+ (NSString*)CFBundleName;

/**
 * bundle版本
 */
+ (NSString*)CFBundleNumericVersion;

/**
 * 包类型
 */
+ (NSString*)CFBundlePackageType;

/**
 * Bundle Signature
 */
+ (NSString*)CFBundleSignature;

/**
 * 编译器
 */
+ (NSString*)DTCompiler;

/**
 * 运行平台
 */
+ (NSString*)DTPlatformBuild;

/**
 * 当前运行平台名称
 */
+ (NSString*)DTPlatformName;

/**
 * 当前运行平台版本
 */
+ (NSString*)DTPlatformVersion;

/**
 * 模拟器系统版本
 */
+ (NSString*)DTSDKBuild;

/**
 * 模拟器系统名称
 */
+ (NSString*)DTSDKName;

/**
 * Xcode
 */
+ (NSString*)DTXcode;

/**
 * Xcode版本
 */
+ (NSString*)DTXcodeBuild;

/**
 * 是否只运行在iphone中
 */
+ (BOOL)LSRequiresIPhoneOS;

/**
 * 支持最低系统版本
 */
+ (NSString*)MinimumOSVersion;

/**
 * 状态栏是否隐藏
 */
+ (BOOL)UIStatusBarHidden;

/**
 * 状态栏Style
 */
+ (UIStatusBarStyle)UIStatusBarStyle;

/**
 * 当前App安装包名称
 */
+ (int)UIViewControllerBasedStatusBarAppearance;

/**
 * 支持的平台
 */
+ (NSArray*)CFBundleSupportedPlatforms;

/**
 * 本地化
 */
+ (NSArray*)CFBundleLocalizations;

/**
 * URLTypes
 */
+ (NSArray*)CFBundleURLTypes;

/**
 * ApplicationQueriesSchemes
 */
+ (NSArray*)LSApplicationQueriesSchemes;

/**
 * UIDeviceFamily
 */
+ (NSArray*)UIDeviceFamily;

/**
 * 针对哪些指令集进行编译
 */
+ (NSArray*)UIRequiredDeviceCapabilities;

/**
 * 支持屏幕旋转方向
 */
+ (NSArray*)UISupportedInterfaceOrientations;



@end
