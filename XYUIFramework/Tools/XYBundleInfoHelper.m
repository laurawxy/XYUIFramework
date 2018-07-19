//
//  XYBundleInfoHelper.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYBundleInfoHelper.h"

@implementation XYBundleInfoHelper
+ (NSDictionary *)buildInfoDictionary{
    return [[NSBundle mainBundle] infoDictionary];
}

+ (NSString *)CFBundleVersion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSString*)CFBundleShortVersionString{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString*)BuildMachineOSBuild{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"BuildMachineOSBuild"];
}

+ (NSString*)CFBundleDevelopmentRegion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleDevelopmentRegion"];
}

+ (NSString*)CFBundleExecutable{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleExecutable"];
}

+ (NSString*)CFBundleIdentifier{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleIdentifier"];
}

+ (NSString*)CFBundleInfoDictionaryVersion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleInfoDictionaryVersion"];
}

+ (NSString*)CFBundleName{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleName"];
}

+ (NSString*)CFBundleNumericVersion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleNumericVersion"];
}

+ (NSString*)CFBundlePackageType{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundlePackageType"];
}

+ (NSString*)CFBundleSignature{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleSignature"];
}

+ (NSString*)DTCompiler{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTCompiler"];
}

+ (NSString*)DTPlatformBuild{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTPlatformBuild"];
}

+ (NSString*)DTPlatformName{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTPlatformName"];
}

+ (NSString*)DTPlatformVersion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTPlatformVersion"];
}

+ (NSString*)DTSDKBuild{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTSDKBuild"];
}

+ (NSString*)DTSDKName{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTSDKName"];
}

+ (NSString*)DTXcode{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTXcode"];
}

+ (NSString*)DTXcodeBuild{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"DTXcodeBuild"];
}

+ (BOOL)LSRequiresIPhoneOS{
    return [[[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"LSRequiresIPhoneOS"] boolValue];
}

+ (NSString*)MinimumOSVersion{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"MinimumOSVersion"];
}

+ (BOOL)UIStatusBarHidden{
    return [[[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UIStatusBarHidden"]boolValue ];
}

+ (UIStatusBarStyle)UIStatusBarStyle{
    return [[[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UIStatusBarStyle"] integerValue];
}

+ (int)UIViewControllerBasedStatusBarAppearance{
    return [[[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UIViewControllerBasedStatusBarAppearance"] intValue];
}

+ (NSArray*)CFBundleSupportedPlatforms{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleSupportedPlatforms"];
}

+ (NSArray*)CFBundleLocalizations{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleLocalizations"];
}

+ (NSArray*)CFBundleURLTypes{
    /*
     CFBundleTypeRole = Editor;
     CFBundleURLName = weixin;
     CFBundleURLSchemes =             (
     wx0fb1ed031af42817
     );
     */
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"CFBundleURLTypes"];
}

+ (NSArray*)LSApplicationQueriesSchemes{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"LSApplicationQueriesSchemes"];
}

+ (NSArray*)UIDeviceFamily{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UIDeviceFamily"];
}

+ (NSArray*)UIRequiredDeviceCapabilities{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UIRequiredDeviceCapabilities"];
}

+ (NSArray*)UISupportedInterfaceOrientations{
    return [[XYBundleInfoHelper buildInfoDictionary] objectForKey:@"UISupportedInterfaceOrientations"];
}


@end
