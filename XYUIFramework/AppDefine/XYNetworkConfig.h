//
//  XYNetworkConfig.h
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYNetworkConfig : NSObject


+ (NSString*)formalHostUrl;
+ (void)xy_setFormalHostUrl:(NSString*)formalHostUrl;


+ (NSString*)formalHostApiUrl;
+ (void)xy_setFormalHostApiUrl:(NSString*)formalHostApiUrl;


+ (NSString*)formalH5HostUrl;
+ (void)xy_setFormalH5HostUrl:(NSString*)formalH5HostUrl;


+ (NSString*)formalWapHostUrl;
+ (void)xy_setFormalWapHostUrl:(NSString*)formalWapHostUrl;


+ (NSString*)formalWapHostApiUrl;
+ (void)xy_setFormalWapHostApiUrl:(NSString*)formalWapHostApiUrl;


+ (NSString*)formalNoInternetAddressUrl;
+ (void)xy_setFormalNoInternetAddressUrl:(NSString*)formalNoInternetAddressUrl;


+ (NSString*)securityPolicyCerPath;
+ (void)xy_setSecurityPolicyCerPath:(NSString*)securityPolicyCerPath;


+ (NSInteger)requestTimeoutInterval;
+ (void)xy_setRequestTimeoutInterval:(NSInteger)requestTimeoutInterval;


+ (NSDictionary*)requestSessionHeader;
+ (void)xy_setRequestSessionHeader:(NSDictionary*)requestSessionHeader;


+ (NSSet*)responseAcceptableContentTypes;
+ (void)xy_setResponseAcceptableContentTypes:(NSSet*)responseAcceptableContentTypes;


+ (NSDictionary*)requestDefaultParams;
+ (void)xy_setRequestDefaultParams:(NSDictionary*)requestDefaultParams;



@end
