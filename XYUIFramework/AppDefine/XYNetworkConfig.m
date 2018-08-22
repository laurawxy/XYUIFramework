//
//  XYNetworkConfig.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYNetworkConfig.h"
#import "XYBundleInfoHelper.h"

@implementation XYNetworkConfig

static BOOL _printRequestSuccessInfo = YES;

+ (BOOL)PrintRequestSuccessInfo{
    return _printRequestSuccessInfo;
}

+ (void)xy_setPrintRequestSuccessInfo:(BOOL)printRequestSuccessInfo{
    _printRequestSuccessInfo = printRequestSuccessInfo;
}

static BOOL _printRequestErrorInfo = YES;

+ (BOOL)PrintRequestErrorInfo{
    return _printRequestErrorInfo;
}

+ (void)xy_setPrintRequestErrorInfo:(BOOL)printRequestErrorInfo{
    _printRequestErrorInfo = printRequestErrorInfo;
}

static BOOL _printRequestCookieInfo = YES;

+ (BOOL)PrintRequestCookieInfo{
    return _printRequestCookieInfo;
}
+ (void)xy_setPrintRequestCookieInfo:(BOOL)printRequestCookieInfo{
    _printRequestCookieInfo = printRequestCookieInfo;
}

static NSString *_formalHostUrl;

+ (NSString*)formalHostUrl{
    if (!_formalHostUrl) {
        _formalHostUrl = @"https://";
    }
    return _formalHostUrl;
}

+ (void)xy_setFormalHostUrl:(NSString*)formalHostUrl{
    _formalHostUrl = formalHostUrl;
}





static NSString *_formalHostApiUrl;

+ (NSString*)formalHostApiUrl{
    if (!_formalHostApiUrl) {
        _formalHostApiUrl = @"https://";
    }
    return _formalHostApiUrl;
}

+ (void)xy_setFormalHostApiUrl:(NSString*)formalHostApiUrl{
    _formalHostApiUrl = formalHostApiUrl;
}





static NSString *_formalH5HostUrl;

+ (NSString*)formalH5HostUrl{
    if (!_formalH5HostUrl) {
        _formalH5HostUrl = @"https://";
    }
    return _formalH5HostUrl;
}

+ (void)xy_setFormalH5HostUrl:(NSString*)formalH5HostUrl{
    _formalH5HostUrl = formalH5HostUrl;
}




static NSString *_formalWapHostUrl;

+ (NSString*)formalWapHostUrl{
    if (!_formalWapHostUrl) {
        _formalWapHostUrl = @"https://";
    }
    return _formalWapHostUrl;
}

+ (void)xy_setFormalWapHostUrl:(NSString*)formalWapHostUrl{
    _formalWapHostUrl = formalWapHostUrl;
}


static NSString *_formalWapHostApiUrl;

+ (NSString*)formalWapHostApiUrl{
    if (!_formalWapHostApiUrl) {
        _formalWapHostApiUrl = @"https://";
    }
    return _formalWapHostApiUrl;
}

+ (void)xy_setFormalWapHostApiUrl:(NSString*)formalWapHostApiUrl{
    _formalWapHostApiUrl = formalWapHostApiUrl;
}


static NSString *_formalNoInternetAddressUrl;

+ (NSString*)formalNoInternetAddressUrl{
    if (!_formalNoInternetAddressUrl) {
        _formalNoInternetAddressUrl = @"https://";
    }
    return _formalNoInternetAddressUrl;
}

+ (void)xy_setFormalNoInternetAddressUrl:(NSString*)formalNoInternetAddressUrl{
    _formalNoInternetAddressUrl = formalNoInternetAddressUrl;
}

static NSString *_securityPolicyCerPath;

+ (NSString*)securityPolicyCerPath{
    return _securityPolicyCerPath;
}
+ (void)xy_setSecurityPolicyCerPath:(NSString*)securityPolicyCerPath{
    _securityPolicyCerPath = securityPolicyCerPath;
}


static NSInteger _requestTimeoutInterval;

+ (NSInteger)requestTimeoutInterval{
    if (_requestTimeoutInterval == 0) {
        _requestTimeoutInterval = 20;
    }
    return _requestTimeoutInterval;
}
+ (void)xy_setRequestTimeoutInterval:(NSInteger)requestTimeoutInterval{
    _requestTimeoutInterval = requestTimeoutInterval;
}



static NSDictionary *_requestSessionHeader;

+ (NSDictionary*)requestSessionHeader{
    return _requestSessionHeader;
}
+ (void)xy_setRequestSessionHeader:(NSDictionary*)requestSessionHeader{
    _requestSessionHeader = requestSessionHeader;
}



static NSSet *_responseAcceptableContentTypes;

+ (NSSet*)responseAcceptableContentTypes{
    if (!_responseAcceptableContentTypes) {
        _responseAcceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain", @"text/html",@"image/*", nil];
    }
    return _responseAcceptableContentTypes;
}
+ (void)xy_setResponseAcceptableContentTypes:(NSSet*)responseAcceptableContentTypes{
    _responseAcceptableContentTypes = responseAcceptableContentTypes;
}


static NSDictionary *_requestDefaultParams;

+ (NSDictionary*)requestDefaultParams{
    if (!_requestDefaultParams) {
        _requestDefaultParams = @{
                                  @"source":@"iOS",
                                  @"appVersion":[XYBundleInfoHelper CFBundleVersion]
                                  };
    }
    return _requestDefaultParams;
}
+ (void)xy_setRequestDefaultParams:(NSDictionary*)requestDefaultParams{
    _requestDefaultParams = requestDefaultParams;
}


@end
