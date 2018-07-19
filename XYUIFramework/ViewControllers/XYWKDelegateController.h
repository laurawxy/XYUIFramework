//
//  XYWKDelegateController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
@protocol XYWKDelegate <NSObject>

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

@end

@interface XYWKDelegateController : UIViewController <WKScriptMessageHandler>
@property (weak , nonatomic) id<XYWKDelegate> XYDelegate;

@end
