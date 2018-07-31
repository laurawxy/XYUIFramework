//
//  XYThemeColor.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//色值
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


@interface XYThemeColor : NSObject
+ (UIColor *)ThemeColor;//主色 提醒、链接等重要信息
+ (UIColor *)ThemeColorAlpha:(CGFloat)alpha;
+ (void)xy_setThemeColor:(UIColor *)color;

+ (UIColor *)blackLevelOneColor;//重要级文字信息、标题信息  333333
+ (void)xy_setBlackLevelOneColor:(UIColor *)color;

+ (UIColor *)blackLevelTwoColor;//文字信息 666666
+ (void)xy_setBlackLevelTwoColor:(UIColor *)color;

+ (UIColor *)blackLevelThreeColor;//辅助文字 999999
+ (void)xy_setBlackLevelThreeColor:(UIColor *)color;

+ (UIColor *)blackLevelFourColor;//失效文字、输入框文字、次要级文字 cccccc
+ (void)xy_setBlackLevelFourColor:(UIColor *)color;

+ (UIColor *)tableViewBackgroundColor;//TableView背景色
+ (void)xy_setTableViewBackgroundColor:(UIColor *)color;

+ (UIColor *)viewBackgroundColor;//
+ (void)xy_setViewBackgroundColor:(UIColor *)color;

+ (UIColor *)backgroundTwoColor;//分割模块底色、分割线
+ (void)xy_setBackgroundTwoColor:(UIColor *)color;

+ (UIColor *)tagBackgroundColor;//消息中心标签背景色
+ (void)xy_setTagBackgroundColor:(UIColor *)color;

+ (UIColor *)highlightBackgroundColor;//背景色
+ (void)xy_setHighlightBackgroundColor:(UIColor *)color;

+ (UIColor *)greenColor;//绿色
+ (void)xy_setGreenColor:(UIColor *)color;

+ (UIColor *)redColor;//红色
+ (void)xy_setRedColor:(UIColor *)color;

+ (UIColor *)orangeColor;//橙色
+ (void)xy_setOrangeColor:(UIColor *)color;


+ (UIColor *)textViewPlaceholderTextColor;
+ (void)xy_setTextViewPlaceholderTextColor:(UIColor *)color;

+ (UIColor *)promptColor;
+ (void)xy_setPromptColor:(UIColor*)color;

+ (UIColor *)lineColor;
+ (void)xy_setLineColor:(UIColor *)color;

+ (UIColor *)navigationBackgroundColor;
+ (void)xy_setNavigationBackgroundColor:(UIColor *)color;

+ (UIColor *)navigationTitleColor;
+ (void)xy_setNavigationTitleColor:(UIColor *)color;

+ (UIColor *)navigationLeftRightColor;
+ (void)xy_setNavigationLeftRightColor:(UIColor *)color;


/**
 tabbar bar颜色
 
 @return color
 */
+ (UIColor*)tabBarBarTintColor;
+ (void)xy_setTabBarBarTintColor:(UIColor*)tabBarBarTintColor;

/**
 tabbar 选中item颜色
 
 @return color
 */
+ (UIColor*)tabBarTintColor;
+ (void)xy_setTabBarTintColor:(UIColor*)tabBarTintColor;

/**
 tabbar 未选中item颜色
 
 @return color
 */
+ (UIColor*)unselectedItemTintColor;
+ (void)xy_setUnselectedItemTintColor:(UIColor*)unselectedItemTintColor;

/**
 webView ProgressColor
 
 @return color
 */
+ (UIColor*)webViewProgressColor;
+ (void)xy_setWebViewProgressColor:(UIColor*)webViewProgressColor;


+ (UIColor *)ButtonWhiteBlackTitleColor;
+ (void)xy_setButtonWhiteBlackTitleColor:(UIColor *)color;


@end
