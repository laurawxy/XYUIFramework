//
//  XYHTTPSessionManager.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYHTTPSessionManager.h"

@implementation XYHTTPSessionManager
// 继承 AFHTTPSessionManager，重写下列方法
- (instancetype)initWithBaseURL:(NSURL *)url{
    #ifdef DEBUG
    // debug 版本的包仍然能够正常抓包
    self = [super initWithBaseURL:url];
    
    #else
    // 由于使用 ephemeralSessionConfiguration session 发起的请求不带 cookie 和使用缓存等
    NSURLSessionConfiguration *conf = [NSURLSessionConfiguration ephemeralSessionConfiguration];
    conf.connectionProxyDictionary = @{};
    self = [super initWithBaseURL:url sessionConfiguration:conf];
    #endif
    return self;
}

@end
