//
//  UIDevice+XYPlatForm.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>


#define IOS_VERSION          ([[[UIDevice currentDevice] systemVersion] floatValue])

#define IS_IPHONE [UIDevice isiPhone]


@interface UIDevice (XYPlatForm)


+ (NSString *)devicePlatForm;

+ (float)systemVersion;

+ (BOOL)isiPhone;

+ (BOOL)isiPhoneX;

+ (BOOL)isScreen4;

+ (BOOL)isScreen4_7;

+ (BOOL)isScreen5_5;

+ (BOOL)isScreen5_8;

@end
