//
//  XYWebViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYViewController.h"
#import <WebKit/WebKit.h>
#import "XYWKDelegateController.h"

@interface XYWebViewController : XYViewController

@property (nonatomic, strong) WKWebView *webView;

/**
 JS-OC方法配置
 */
@property (nonatomic, strong) WKWebViewConfiguration *configuration;

@property (nonatomic, strong) WKUserContentController *userContentController;

/**
 注册方法
 */
@property (nonatomic, strong) XYWKDelegateController *delegateController;

@property (nonatomic, copy) NSString *webUrl;

@end
