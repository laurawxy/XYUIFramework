//
//  XYWebViewControllerActivity.h
//  XYUIFrameworkDemo
//
//  Created by WangXiangyu on 2018/7/26.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYWebViewControllerActivity : UIActivity

/// URL to open.
@property (nonatomic, strong) NSURL *URL;
/// Scheme prefix value.
@property (nonatomic, strong) NSString *scheme;


@end


@interface XYWebViewControllerActivityChrome : XYWebViewControllerActivity
@end
@interface XYWebViewControllerActivitySafari : XYWebViewControllerActivity
@end
