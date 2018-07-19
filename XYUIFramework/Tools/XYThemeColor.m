//
//  XYThemeColor.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYThemeColor.h"

@implementation XYThemeColor
static UIColor *_currentThemeColor;
static UIColor *_currentBlackLevelOneColor;
static UIColor *_currentBlackLevelTwoColor;
static UIColor *_currentBlackLevelThreeColor;
static UIColor *_currentBlackLevelFourColor;
static UIColor *_currentTableViewBackgroundColor;
static UIColor *_currentViewBackgroundColor;
static UIColor *_currentBackgroundTwoColor;
static UIColor *_currentTagBackgroundColor;
static UIColor *_currentHighlightBackgroundColor;

static UIColor *_currentGreenColor;
static UIColor *_currentRedColor;
static UIColor *_currentOrangeColor;
static UIColor *_currentLightBlueColor;
static UIColor *_currentTextViewPlaceholderTextColor;
static UIColor *_currentPromptColor;
static UIColor *_currentLineColor;
static UIColor *_currentNavigationTitleColor;
static UIColor *_currentNavigationLeftRightColor;

+ (UIColor *)ThemeColorAlpha:(CGFloat)alpha{
    return [_currentThemeColor colorWithAlphaComponent:alpha];
}
+ (UIColor *)ThemeColor{
    if (!_currentThemeColor) {
        _currentThemeColor = RGB(46, 147, 238);
    }
    return _currentThemeColor;
}

+ (void)xy_setThemeColor:(UIColor *)color{
    _currentThemeColor = color;
}

+ (UIColor *)blackLevelOneColor{
    if (!_currentBlackLevelOneColor) {
        _currentBlackLevelOneColor = RGB(51, 51, 51);
    }
    return _currentBlackLevelOneColor;
}
+ (void)xy_setBlackLevelOneColor:(UIColor *)color{
    _currentBlackLevelOneColor = color;
}

+ (UIColor *)blackLevelTwoColor{
    if (!_currentBlackLevelTwoColor) {
        _currentBlackLevelTwoColor = RGB(102, 102, 102);
    }
    return _currentBlackLevelTwoColor;
}
+ (void)xy_setBlackLevelTwoColor:(UIColor *)color{
    _currentBlackLevelTwoColor = color;
}

+ (UIColor *)blackLevelThreeColor{
    if (!_currentBlackLevelThreeColor) {
        _currentBlackLevelThreeColor = RGB(153, 153, 153);
    }
    return _currentBlackLevelThreeColor;
}
+ (void)xy_setBlackLevelThreeColor:(UIColor *)color{
    _currentBlackLevelThreeColor = color;
}

+ (UIColor *)blackLevelFourColor{
    if (!_currentBlackLevelFourColor) {
        _currentBlackLevelFourColor = RGB(204, 204, 204);
    }
    return _currentBlackLevelFourColor;
}
+ (void)xy_setBlackLevelFourColor:(UIColor *)color{
    _currentBlackLevelFourColor = color;
}

+ (UIColor *)tableViewBackgroundColor{
    if (!_currentTableViewBackgroundColor) {
        _currentTableViewBackgroundColor = RGB(240,244,248);
    }
    return _currentTableViewBackgroundColor;
}
+ (void)xy_setTableViewBackgroundColor:(UIColor *)color{
    _currentTableViewBackgroundColor = color;
}


+ (UIColor *)viewBackgroundColor{
    if (!_currentViewBackgroundColor) {
        _currentViewBackgroundColor = RGB(238, 242, 247);
    }
    return _currentViewBackgroundColor;
}
+ (void)xy_setViewBackgroundColor:(UIColor *)color{
    _currentViewBackgroundColor = color;
}

+ (UIColor *)backgroundTwoColor{
    if (!_currentBackgroundTwoColor) {
        _currentBackgroundTwoColor = RGB(240,244,248);
    }
    return _currentBackgroundTwoColor;
}
+ (void)xy_setBackgroundTwoColor:(UIColor *)color{
    _currentBackgroundTwoColor = color;
}

+ (UIColor *)tagBackgroundColor{
    if (!_currentTagBackgroundColor) {
        _currentTagBackgroundColor = RGB(238, 242, 247);
    }
    return _currentTagBackgroundColor;
}
+ (void)xy_setTagBackgroundColor:(UIColor *)color{
    _currentTagBackgroundColor = color;
}

+ (UIColor *)highlightBackgroundColor{
    if (!_currentHighlightBackgroundColor) {
        _currentHighlightBackgroundColor = RGB(243, 243, 243);
    }
    return _currentHighlightBackgroundColor;
}
+ (void)xy_setHighlightBackgroundColor:(UIColor *)color{
    _currentHighlightBackgroundColor = color;
}


+ (UIColor *)greenColor{
    if (!_currentGreenColor) {
        _currentGreenColor = RGB(86,197,56);
    }
    return _currentGreenColor;
}
+ (void)xy_setGreenColor:(UIColor *)color{
    _currentGreenColor = color;
}

+ (UIColor *)redColor{
    if (!_currentRedColor) {
        _currentRedColor = RGB(253, 84, 84);
    }
    return _currentRedColor;
}
+ (void)xy_setRedColor:(UIColor *)color{
    _currentRedColor = color;
}

+ (UIColor *)orangeColor{
    if (!_currentOrangeColor) {
        _currentOrangeColor = RGBA(255, 146, 0, 1);
    }
    return _currentOrangeColor;
}
+ (void)xy_setOrangeColor:(UIColor *)color{
    _currentOrangeColor = color;
}

+ (UIColor *)lightBlueColor{
    if (!_currentLightBlueColor) {
        _currentLightBlueColor = RGB(104, 179, 246);
    }
    return _currentLightBlueColor;
}

+ (void)xy_setLightBlueColor:(UIColor *)color{
    _currentLightBlueColor = color;
}

+ (UIColor *)textViewPlaceholderTextColor{
    if (!_currentTextViewPlaceholderTextColor) {
        _currentTextViewPlaceholderTextColor = RGB(216,216,216);
    }
    return _currentTextViewPlaceholderTextColor;
}
+ (void)xy_setTextViewPlaceholderTextColor:(UIColor *)color{
    _currentTextViewPlaceholderTextColor = color;
}

+ (UIColor *)promptColor{
    if (!_currentPromptColor) {
        _currentPromptColor = RGB(252, 242, 192);
    }
    return _currentPromptColor;
}
+ (void)xy_setPromptColor:(UIColor *)color{
    _currentPromptColor = color;
}

+ (UIColor *)lineColor{
    if (!_currentLineColor) {
        _currentLineColor = RGB(223, 223, 223);
    }
    return _currentLineColor;
}
+ (void)xy_setLineColor:(UIColor *)color{
    _currentLineColor = color;
}

+ (UIColor *)navigationTitleColor{
    if (!_currentNavigationTitleColor) {
        _currentNavigationTitleColor = RGB(0, 0, 0);
    }
    return _currentNavigationTitleColor;
}

+ (void)xy_setNavigationTitleColor:(UIColor *)color{
    _currentNavigationTitleColor = color;
}

+ (UIColor *)navigationLeftRightColor{
    if (!_currentNavigationLeftRightColor) {
        _currentNavigationLeftRightColor = RGB(51, 51, 51);
    }
    return _currentNavigationLeftRightColor;
}
+ (void)xy_setNavigationLeftRightColor:(UIColor *)color{
    _currentNavigationLeftRightColor = color;
}

static UIColor *_tabBarBarTintColor;
+ (UIColor*)tabBarBarTintColor{
    if (!_tabBarBarTintColor) {
        _tabBarBarTintColor = [UIColor whiteColor];
    }
    return _tabBarBarTintColor;
}
+ (void)xy_setTabBarBarTintColor:(UIColor*)tabBarBarTintColor{
    _tabBarBarTintColor = tabBarBarTintColor;
}


static UIColor *_tabBarTintColor;
+ (UIColor*)tabBarTintColor{
    if (!_tabBarTintColor) {
        _tabBarTintColor = RGB(82, 84, 86);
    }
    return _tabBarTintColor;
}
+ (void)xy_setTabBarTintColor:(UIColor*)tabBarTintColor{
    _tabBarTintColor = tabBarTintColor;
}


static UIColor *_unselectedItemTintColor;
+ (UIColor*)unselectedItemTintColor{
    if (!_unselectedItemTintColor) {
        _unselectedItemTintColor = [XYThemeColor blackLevelThreeColor];
    }
    return _unselectedItemTintColor;
}
+ (void)xy_setUnselectedItemTintColor:(UIColor*)unselectedItemTintColor{
    _unselectedItemTintColor = unselectedItemTintColor;
}


@end
