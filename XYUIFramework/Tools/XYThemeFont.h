//
//  XYThemeFont.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define KThemeBoldFont(FONTSIZE) [XYThemeFont ThemeBoldFont:FONTSIZE]
#define KThemeNormalFont(FONTSIZE) [XYThemeFont ThemeFont:FONTSIZE]
#define KThemeMediumFont(FONTSIZE) [XYThemeFont ThemeBoldFont:FONTSIZE]


@interface XYThemeFont : NSObject
@property (nonatomic, strong) NSString *themeNormalFontName;
@property (nonatomic, strong) NSString *themeBoldFontName;

@property (nonatomic, strong) NSString *themeNumberNormalFontName;
@property (nonatomic, strong) NSString *themeNumberBoldFontName;

+ (XYThemeFont *)sharedInstance;

+ (UIFont*)ThemeFont:(CGFloat)fontSize;
+ (UIFont*)ThemeBoldFont:(CGFloat)fontSize;


/**
 tabbar 未选中标题字体
 
 @return font
 */
+ (UIFont*)tabBarNormalTitleFont;
+ (void)xy_setTabBarNormalTitleFont:(UIFont*)tabBarNormalTitleFont;

/**
 tabbar 选中标题字体
 
 @return font
 */
+ (UIFont*)tabBarSelectTitleFont;
+ (void)xy_setTabBarSelectTitleFont:(UIFont*)tabBarSelectTitleFont;




/**
 navigation 大标题字体
 
 @return font
 */
+ (UIFont*)navigationLargeTitleFont;
+ (void)xy_setNavigationLargeTitleFont:(UIFont*)navigationLargeTitleFont;



/**
 navigation 左右button字体
 
 @return font
 */
+ (UIFont*)navigationLeftRightFont;
+ (void)xy_setNavigationLeftRightFont:(UIFont*)navigationLeftRightFont;



/**
 navigation 标题字体
 
 @return font
 */
+ (UIFont*)navigationTitleFont;
+ (void)xy_setNavigationTitleFont:(UIFont*)navigationTitleFont;


/**
 一级标题字体
 
 @return font
 */
+ (UIFont*)titleOneFont;
+ (void)xy_settTitleOneFont:(UIFont*)titleOneFont;


/**
 二级标题字体
 
 @return font
 */
+ (UIFont*)titleTwoFont;
+ (void)xy_settTitleTwoFont:(UIFont*)titleTwoFont;


/**
 三级标题字体
 
 @return font
 */
+ (UIFont*)titleThreeFont;
+ (void)xy_settTitleThreeFont:(UIFont*)titleThreeFont;


/**
 四级标题字体
 
 @return font
 */
+ (UIFont*)titleFourFont;
+ (void)xy_settTitleFourFont:(UIFont*)titleFourFont;

/**
 正文字体
 
 @return font
 */
+ (UIFont*)normalContentFont;
+ (void)xy_settNormalContentFont:(UIFont*)normalContentFont;

/**
 小区域字体
 
 @return font
 */
+ (UIFont*)smallContentFont;
+ (void)xy_settSmallContentFont:(UIFont*)smallContentFont;



@end
