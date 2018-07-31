//
//  XYThemeColor.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYThemeColor.h"

@implementation XYThemeColor




static UIColor *_ThemeColor;
+ (UIColor *)ThemeColor{
    if (!_ThemeColor) {
        _ThemeColor = RGB(46, 147, 238);
    }
    return _ThemeColor;
}
+ (void)xy_setThemeColor:(UIColor *)color{
    _ThemeColor = color;
}
+ (UIColor *)ThemeColorAlpha:(CGFloat)alpha{
    return [_ThemeColor colorWithAlphaComponent:alpha];
}

static UIColor *_BlackLevelOneColor;
+ (UIColor *)blackLevelOneColor{
    if (!_BlackLevelOneColor) {
        _BlackLevelOneColor = RGB(51, 51, 51);
    }
    return _BlackLevelOneColor;
}
+ (void)xy_setBlackLevelOneColor:(UIColor *)color{
    _BlackLevelOneColor = color;
}


static UIColor *_BlackLevelTwoColor;
+ (UIColor *)blackLevelTwoColor{
    if (!_BlackLevelTwoColor) {
        _BlackLevelTwoColor = RGB(102, 102, 102);
    }
    return _BlackLevelTwoColor;
}
+ (void)xy_setBlackLevelTwoColor:(UIColor *)color{
    _BlackLevelTwoColor = color;
}

static UIColor *_BlackLevelThreeColor;

+ (UIColor *)blackLevelThreeColor{
    if (!_BlackLevelThreeColor) {
        _BlackLevelThreeColor = RGB(153, 153, 153);
    }
    return _BlackLevelThreeColor;
}
+ (void)xy_setBlackLevelThreeColor:(UIColor *)color{
    _BlackLevelThreeColor = color;
}


static UIColor *_BlackLevelFourColor;
+ (UIColor *)blackLevelFourColor{
    if (!_BlackLevelFourColor) {
        _BlackLevelFourColor = RGB(204, 204, 204);
    }
    return _BlackLevelFourColor;
}
+ (void)xy_setBlackLevelFourColor:(UIColor *)color{
    _BlackLevelFourColor = color;
}

static UIColor *_TableViewBackgroundColor;
+ (UIColor *)tableViewBackgroundColor{
    if (!_TableViewBackgroundColor) {
        _TableViewBackgroundColor = RGB(240,244,248);
    }
    return _TableViewBackgroundColor;
}
+ (void)xy_setTableViewBackgroundColor:(UIColor *)color{
    _TableViewBackgroundColor = color;
}

static UIColor *_ViewBackgroundColor;
+ (UIColor *)viewBackgroundColor{
    if (!_ViewBackgroundColor) {
        _ViewBackgroundColor = RGB(238, 242, 247);
    }
    return _ViewBackgroundColor;
}
+ (void)xy_setViewBackgroundColor:(UIColor *)color{
    _ViewBackgroundColor = color;
}


static UIColor *_BackgroundTwoColor;
+ (UIColor *)backgroundTwoColor{
    if (!_BackgroundTwoColor) {
        _BackgroundTwoColor = RGB(240,244,248);
    }
    return _BackgroundTwoColor;
}
+ (void)xy_setBackgroundTwoColor:(UIColor *)color{
    _BackgroundTwoColor = color;
}

static UIColor *_TagBackgroundColor;
+ (UIColor *)tagBackgroundColor{
    if (!_TagBackgroundColor) {
        _TagBackgroundColor = RGB(238, 242, 247);
    }
    return _TagBackgroundColor;
}
+ (void)xy_setTagBackgroundColor:(UIColor *)color{
    _TagBackgroundColor = color;
}

static UIColor *_HighlightBackgroundColor;
+ (UIColor *)highlightBackgroundColor{
    if (!_HighlightBackgroundColor) {
        _HighlightBackgroundColor = RGB(243, 243, 243);
    }
    return _HighlightBackgroundColor;
}
+ (void)xy_setHighlightBackgroundColor:(UIColor *)color{
    _HighlightBackgroundColor = color;
}

static UIColor *_GreenColor;
+ (UIColor *)greenColor{
    if (!_GreenColor) {
        _GreenColor = RGB(86,197,56);
    }
    return _GreenColor;
}
+ (void)xy_setGreenColor:(UIColor *)color{
    _GreenColor = color;
}
static UIColor *_RedColor;
+ (UIColor *)redColor{
    if (!_RedColor) {
        _RedColor = RGB(253, 84, 84);
    }
    return _RedColor;
}
+ (void)xy_setRedColor:(UIColor *)color{
    _RedColor = color;
}

static UIColor *_OrangeColor;
+ (UIColor *)orangeColor{
    if (!_OrangeColor) {
        _OrangeColor = RGBA(255, 146, 0, 1);
    }
    return _OrangeColor;
}
+ (void)xy_setOrangeColor:(UIColor *)color{
    _OrangeColor = color;
}

static UIColor *_TextViewPlaceholderTextColor;

+ (UIColor *)textViewPlaceholderTextColor{
    if (!_TextViewPlaceholderTextColor) {
        _TextViewPlaceholderTextColor = RGB(216,216,216);
    }
    return _TextViewPlaceholderTextColor;
}
+ (void)xy_setTextViewPlaceholderTextColor:(UIColor *)color{
    _TextViewPlaceholderTextColor = color;
}
static UIColor *_PromptColor;
+ (UIColor *)promptColor{
    if (!_PromptColor) {
        _PromptColor = RGB(252, 242, 192);
    }
    return _PromptColor;
}
+ (void)xy_setPromptColor:(UIColor *)color{
    _PromptColor = color;
}

static UIColor *_LineColor;

+ (UIColor *)lineColor{
    if (!_LineColor) {
        _LineColor = RGB(223, 223, 223);
    }
    return _LineColor;
}
+ (void)xy_setLineColor:(UIColor *)color{
    _LineColor = color;
}

static UIColor *_navigationBackgroundColor;

+ (UIColor *)navigationBackgroundColor{
    if (!_navigationBackgroundColor) {
        _navigationBackgroundColor = [UIColor whiteColor];
    }
    return _navigationBackgroundColor;
}

+ (void)xy_setNavigationBackgroundColor:(UIColor *)color{
    _navigationBackgroundColor = color;
}

static UIColor *_NavigationTitleColor;

+ (UIColor *)navigationTitleColor{
    if (!_NavigationTitleColor) {
        _NavigationTitleColor = RGB(0, 0, 0);
    }
    return _NavigationTitleColor;
}

+ (void)xy_setNavigationTitleColor:(UIColor *)color{
    _NavigationTitleColor = color;
}

static UIColor *_NavigationLeftRightColor;

+ (UIColor *)navigationLeftRightColor{
    if (!_NavigationLeftRightColor) {
        _NavigationLeftRightColor = RGB(51, 51, 51);
    }
    return _NavigationLeftRightColor;
}
+ (void)xy_setNavigationLeftRightColor:(UIColor *)color{
    _NavigationLeftRightColor = color;
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

static UIColor *_webViewProgressColor;

+ (UIColor*)webViewProgressColor{
    if (!_webViewProgressColor) {
        _webViewProgressColor = [XYThemeColor ThemeColor];
    }
    return _webViewProgressColor;
}
+ (void)xy_setWebViewProgressColor:(UIColor*)webViewProgressColor{
    _webViewProgressColor = webViewProgressColor;
}


static UIColor *_ButtonWhiteBlackBorderColor;
+ (UIColor *)ButtonWhiteBlackBorderColor{
    if (!_ButtonWhiteBlackBorderColor) {
        _ButtonWhiteBlackBorderColor = [XYThemeColor blackLevelFourColor];
    }
    return _ButtonWhiteBlackBorderColor;
}
+ (void)xy_setButtonWhiteBlackBorderColor:(UIColor *)color{
    _ButtonWhiteBlackBorderColor = color;
}

static UIColor *_ButtonWhiteBlackTitleColor;
+ (UIColor *)ButtonWhiteBlackTitleColor{
    if (!_ButtonWhiteBlackTitleColor) {
        _ButtonWhiteBlackTitleColor = [XYThemeColor blackLevelOneColor];
    }
    return _ButtonWhiteBlackTitleColor;
}
+ (void)xy_setButtonWhiteBlackTitleColor:(UIColor *)color{
    _ButtonWhiteBlackTitleColor = color;
}



@end
