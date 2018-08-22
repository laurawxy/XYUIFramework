//
//  XYMacroConfig.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYMacroConfig.h"

@implementation XYMacroConfig

static NSString *_appStoreAppleId;

+ (NSString*)appStoreAppleId{
    return _appStoreAppleId;
}

+ (void)xy_setAppStoreAppleId:(NSString *)appStoreAppleId{
    _appStoreAppleId = appStoreAppleId;
}



static NSInteger _countDownTime;

+ (NSInteger)countDownTime{
    if (_countDownTime == 0) {
        _countDownTime = 120;
    }
    return _countDownTime;
}

+ (void)xy_setCountDownTime:(NSInteger)countDownTime{
    _countDownTime = countDownTime;
}

static NSInteger _pageSize;

+ (NSInteger)pageSize{
    if (_pageSize == 0) {
        _pageSize = 20;
    }
    return _pageSize;
}

+ (void)xy_setPageSize:(NSInteger)pageSize{
    _pageSize = pageSize;
}

static NSString *_loadingPromptMessage;

+ (NSString*)loadingPromptMessage{
    if (!_loadingPromptMessage) {
        _loadingPromptMessage = @"正在加载...";
    }
    return _loadingPromptMessage;
}

+ (void)xy_setLoadingPromptMessage:(NSString *)loadingPromptMessage{
    _loadingPromptMessage = loadingPromptMessage;
}

static NSString *_uploadingPromptMessage;

+ (NSString*)uploadingPromptMessage{
    if (!_uploadingPromptMessage) {
        _uploadingPromptMessage = @"正在上传...";
    }
    return _uploadingPromptMessage;
}

+ (void)xy_setUploadingPromptMessage:(NSString*)uploadingPromptMessage{
    _uploadingPromptMessage = uploadingPromptMessage;
}

static NSString *_submitPromptMessage;

+ (NSString*)submitPromptMessage{
    if (!_submitPromptMessage) {
        _submitPromptMessage = @"正在提交...";
    }
    return _submitPromptMessage;
}

+ (void)xy_setSubmitPromptMessage:(NSString*)submitPromptMessage{
    _submitPromptMessage = submitPromptMessage;
}

static NSString *_networkAnomalyPromptMessage;

+ (NSString*)networkAnomalyPromptMessage{
    if (!_networkAnomalyPromptMessage) {
        _networkAnomalyPromptMessage = @"网络异常";
    }
    return _networkAnomalyPromptMessage;
}

+ (void)xy_setNetworkAnomalyPromptMessage:(NSString*)networkAnomalyPromptMessage{
    _networkAnomalyPromptMessage = networkAnomalyPromptMessage;
}


@end
