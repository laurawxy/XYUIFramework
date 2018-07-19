//
//  AppDelegate+XYConfig.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/7/19.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "AppDelegate+XYConfig.h"
#import <IQKeyboardManager.h>
#import "SVProgressHUD+XYCustomization.h"
#import "XYThemeColor.h"
#import "XYThemeFont.h"

@implementation AppDelegate (XYConfig)
- (void)setUpAppearance{
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    [SVProgressHUD setupDefault];
    
    NSDictionary *normalAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[XYThemeColor navigationTitleColor],NSForegroundColorAttributeName,[XYThemeFont navigationTitleFont],NSFontAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:normalAttributes];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //    [[UINavigationBar appearance] setBarTintColor:NavigationBarColor];
    //隐藏导航栏底部的线条 1、
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}
@end
