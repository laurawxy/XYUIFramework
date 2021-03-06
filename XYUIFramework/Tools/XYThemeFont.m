//
//  XYThemeFont.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYThemeFont.h"



@implementation XYThemeFont

+ (XYThemeFont *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
+ (UIFont *)ThemeFont:(CGFloat)fontSize{
    if ([XYThemeFont sharedInstance].themeNormalFontName) {
        return [UIFont fontWithName:[XYThemeFont sharedInstance].themeNormalFontName size:fontSize];
    }else{
        return [UIFont systemFontOfSize:fontSize];
    }
}
+ (UIFont *)ThemeBoldFont:(CGFloat)fontSize{
    if ([XYThemeFont sharedInstance].themeBoldFontName) {
        return [UIFont fontWithName:[XYThemeFont sharedInstance].themeBoldFontName size:fontSize];
    }else{
        return [UIFont boldSystemFontOfSize:fontSize];
    }
}

+ (UIFont *)ThemeNumberFont:(CGFloat)fontSize{
    if ([XYThemeFont sharedInstance].themeNumberNormalFontName) {
        return [UIFont fontWithName:[XYThemeFont sharedInstance].themeNumberNormalFontName size:fontSize];
    }else{
        return [UIFont systemFontOfSize:fontSize];
    }
}

+ (UIFont *)ThemeNumberBoldFont:(CGFloat)fontSize{
    if ([XYThemeFont sharedInstance].themeNumberBoldFontName) {
        return [UIFont fontWithName:[XYThemeFont sharedInstance].themeNumberBoldFontName size:fontSize];
    }else{
        return [UIFont boldSystemFontOfSize:fontSize];
    }
}

static UIFont *_navigationLargeTitleFont;
+ (UIFont*)navigationLargeTitleFont{
    if (!_navigationLargeTitleFont) {
        _navigationLargeTitleFont = KThemeBoldFont(32);
    }
    return _navigationLargeTitleFont;
}
+ (void)xy_setNavigationLargeTitleFont:(UIFont*)navigationLargeTitleFont{
    _navigationLargeTitleFont = navigationLargeTitleFont;
}

static UIFont *_navigationLeftRightFont;
+ (UIFont*)navigationLeftRightFont{
    if (!_navigationLeftRightFont) {
        _navigationLeftRightFont = KThemeNormalFont(16);
    }
    return _navigationLeftRightFont;
}
+ (void)xy_setNavigationLeftRightFont:(UIFont*)navigationLeftRightFont{
    _navigationLeftRightFont = navigationLeftRightFont;
}

static UIFont *_navigationTitleFont;
+ (UIFont*)navigationTitleFont{
    if (!_navigationTitleFont) {
        _navigationTitleFont = KThemeBoldFont(18);
    }
    return _navigationTitleFont;
}
+ (void)xy_setNavigationTitleFont:(UIFont*)navigationTitleFont{
    _navigationTitleFont = navigationTitleFont;
}


static UIFont *_tabBarNormalTitleFont;
+ (UIFont*)tabBarNormalTitleFont{
    if (!_tabBarNormalTitleFont) {
        _tabBarNormalTitleFont = KThemeNormalFont(10);
    }
    return _tabBarNormalTitleFont;
}
+ (void)xy_setTabBarNormalTitleFont:(UIFont*)tabBarNormalTitleFont{
    _tabBarNormalTitleFont = tabBarNormalTitleFont;
}

static UIFont *_tabBarSelectTitleFont;
+ (UIFont*)tabBarSelectTitleFont{
    if (!_tabBarSelectTitleFont) {
        _tabBarSelectTitleFont = KThemeNormalFont(10);
    }
    return _tabBarSelectTitleFont;
}
+ (void)xy_setTabBarSelectTitleFont:(UIFont*)tabBarSelectTitleFont{
    _tabBarSelectTitleFont = tabBarSelectTitleFont;
}

static UIFont *_titleOneFont;
+ (UIFont*)titleOneFont{
    if (!_titleOneFont) {
        _titleOneFont = KThemeBoldFont(24);
    }
    return _titleOneFont;
}
+ (void)xy_settTitleOneFont:(UIFont*)titleOneFont{
    _titleOneFont = titleOneFont;
}


static UIFont *_titleTwoFont;
+ (UIFont*)titleTwoFont{
    if (!_titleTwoFont) {
        _titleTwoFont = KThemeBoldFont(20);
    }
    return _titleTwoFont;
}
+ (void)xy_settTitleTwoFont:(UIFont*)titleTwoFont{
    _titleTwoFont = titleTwoFont;
}


static UIFont *_titleThreeFont;
+ (UIFont*)titleThreeFont{
    if (!_titleThreeFont) {
        _titleThreeFont = KThemeBoldFont(16);
    }
    return _titleThreeFont;
}
+ (void)xy_settTitleThreeFont:(UIFont*)titleThreeFont{
    _titleThreeFont = titleThreeFont;
}

static UIFont *_titleFourFont;
+ (UIFont*)titleFourFont{
    if (!_titleFourFont) {
        _titleFourFont = KThemeBoldFont(12);
    }
    return _titleFourFont;
}
+ (void)xy_settTitleFourFont:(UIFont*)titleFourFont{
    _titleFourFont = titleFourFont;
}

static UIFont *_normalContentFont;
+ (UIFont*)normalContentFont{
    if (!_normalContentFont) {
        _normalContentFont = KThemeNormalFont(16);
    }
    return _normalContentFont;
}
+ (void)xy_settNormalContentFont:(UIFont*)normalContentFont{
    _normalContentFont = normalContentFont;
}

static UIFont *_smallContentFont;
+ (UIFont*)smallContentFont{
    if (!_smallContentFont) {
        _smallContentFont = KThemeNormalFont(12);
    }
    return _smallContentFont;
}
+ (void)xy_settSmallContentFont:(UIFont*)smallContentFont{
    _smallContentFont = smallContentFont;
}


@end
