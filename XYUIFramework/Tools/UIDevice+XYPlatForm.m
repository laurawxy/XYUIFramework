//
//  UIDevice+XYPlatForm.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIDevice+XYPlatForm.h"
#import <sys/utsname.h>
#import "XYAutoLayout.h"

@implementation UIDevice (XYPlatForm)
+ (NSString *)devicePlatForm{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])
        return @"iPhone 2";
    else if ([platform isEqualToString:@"iPhone1,2"])
        return @"iPhone 3";
    if ([platform isEqualToString:@"iPhone2,1"])
        return @"iPhone 3S";
    if ([platform isEqualToString:@"iPhone3,1"])
        return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"])
        return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])
        return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])
        return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"])
        return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"])
        return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"])
        return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"])
        return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"])
        return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"])
        return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"])
        return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"])
        return @"iPhone 6";
    if ([platform isEqualToString:@"iPhone8,1"])
        return @"iPhone 6s";
    if ([platform isEqualToString:@"iPhone8,2"])
        return @"iPhone 6s Plus";
    if ([platform isEqualToString:@"iPhone8,3"])
        return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone8,4"])
        return @"iPhone SE";
    if ([platform isEqualToString:@"iPhone9,1"])
        return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,2"])
        return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone9,3"])
        return @"iPhone 7";
    if ([platform isEqualToString:@"iPhone9,4"])
        return @"iPhone 7 Plus";
    if ([platform isEqualToString:@"iPhone10,1"])
        return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,2"])
        return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,3"])
        return @"iPhone X";
    if ([platform isEqualToString:@"iPhone10,4"])
        return @"iPhone 8";
    if ([platform isEqualToString:@"iPhone10,5"])
        return @"iPhone 8 Plus";
    if ([platform isEqualToString:@"iPhone10,6"])
        return @"iPhone X";

    
    //iPod
    if ([platform isEqualToString:@"iPod1,1"])
        return @"iPod Touch 1";
    if ([platform isEqualToString:@"iPod2,1"])
        return @"iPod Touch 2";
    if ([platform isEqualToString:@"iPod3,1"])
        return @"iPod Touch 3";
    if ([platform isEqualToString:@"iPod4,1"])
        return @"iPod Touch 4";
    if ([platform isEqualToString:@"iPod5,1"])
        return @"iPod Touch 5";
    if ([platform isEqualToString:@"iPod7,1"])
        return @"iPod Touch 6";

    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"])
        return @"iPad 1";
    if ([platform isEqualToString:@"iPad2,1"])
        return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])
        return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])
        return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])
        return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])
        return @"iPad mini 1";
    if ([platform isEqualToString:@"iPad2,6"])
        return @"iPad mini 1";
    if ([platform isEqualToString:@"iPad2,7"])
        return @"iPad mini 1";
    if ([platform isEqualToString:@"iPad3,1"])
        return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])
        return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])
        return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])
        return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])
        return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])
        return @"iPad 4";
    if ([platform isEqualToString:@"iPad4,1"])
        return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])
        return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])
        return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])
        return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,5"])
        return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,6"])
        return @"iPad mini 2";
    if ([platform isEqualToString:@"iPad4,7"])
        return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,8"])
        return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad4,9"])
        return @"iPad mini 3";
    if ([platform isEqualToString:@"iPad5,1"])
        return @"iPad mini 4";
    if ([platform isEqualToString:@"iPad5,2"])
        return @"iPad mini 4";
    if ([platform isEqualToString:@"iPad5,3"])
        return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad5,4"])
        return @"iPad Air 2";
    if ([platform isEqualToString:@"iPad6,3"])
        return @"iPad Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,4"])
        return @"iPad Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,7"])
        return @"iPad Pro(9.7)";
    if ([platform isEqualToString:@"iPad6,8"])
        return @"iPad Pro(12.9)";
    if ([platform isEqualToString:@"iPad6,11"])
        return @"iPad(9.7)";
    if ([platform isEqualToString:@"iPad6,12"])
        return @"iPad(9.7)";
    if ([platform isEqualToString:@"iPad7,1"])
        return @"iPad Pro 2(12.9)";
    if ([platform isEqualToString:@"iPad7,2"])
        return @"iPad Pro 2(12.9)";
    if ([platform isEqualToString:@"iPad7,3"])
        return @"iPad Pro 2(10.5)";
    if ([platform isEqualToString:@"iPad7,4"])
        return @"iPad Pro 2(10.5)";

    
    if ([platform isEqualToString:@"i386"])
        return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])
        return @"iPhone Simulator";
    
    return platform;
}

+ (float)systemVersion{
    return [[[UIDevice currentDevice]systemVersion]floatValue];
}

+ (BOOL)isiPhone{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isiPhoneX{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSASCIIStringEncoding];
    if ([platform isEqualToString:@"i386"] || [platform isEqualToString:@"x86_64"]) {
        // 模拟器下采用屏幕的高度来判断
        return [UIScreen mainScreen].bounds.size.height == 812;
    }
    BOOL isIPhoneX = [platform isEqualToString:@"iPhone10,3"] || [platform isEqualToString:@"iPhone10,6"];
    return isIPhoneX;
}

+ (BOOL)isScreen4{
    if ([UIDevice isiPhone] && (SCREEN_MAX_LENGTH == 568.0)) {
        return YES;
    }
    return NO;
}

+ (BOOL)isScreen4_7{
    if ([UIDevice isiPhone] && (SCREEN_MAX_LENGTH == 667.0)) {
        return YES;
    }
    return NO;
}

+ (BOOL)isScreen5_5{
    if ([UIDevice isiPhone] && (SCREEN_MAX_LENGTH == 736.0)) {
        return YES;
    }
    return NO;
}

+ (BOOL)isScreen5_8{
    if ([UIDevice isiPhone] && (SCREEN_MAX_LENGTH == 812.0)) {
        return YES;
    }
    return NO;
}
@end
