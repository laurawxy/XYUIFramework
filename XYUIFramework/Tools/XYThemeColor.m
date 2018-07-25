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

static UIColor *_ButtonNormalHighlightedColor;
+ (UIColor *)ButtonNormalHighlightedColor{
    if (!_ButtonNormalHighlightedColor) {
        _ButtonNormalHighlightedColor = RGB(142, 197, 245);
    }
    return _ButtonNormalHighlightedColor;
}
+ (void)xy_setButtonNormalHighlightedColor:(UIColor *)color{
    _ButtonNormalHighlightedColor = color;
}

static UIColor *_ButtonThemeWhiteHighlightedColor;
+ (UIColor *)ButtonThemeWhiteHighlightedColor{
    if (!_ButtonThemeWhiteHighlightedColor) {
        _ButtonThemeWhiteHighlightedColor = RGB(147, 191, 231);
    }
    return _ButtonThemeWhiteHighlightedColor;
}
+ (void)xy_setButtonThemeWhiteHighlightedColor:(UIColor *)color{
    _ButtonThemeWhiteHighlightedColor = color;
}

static UIColor *_ButtonThemeWhiteBackHighlightedColor;
+ (UIColor *)ButtonThemeWhiteBackHighlightedColor{
    if (!_ButtonThemeWhiteBackHighlightedColor) {
        _ButtonThemeWhiteBackHighlightedColor = RGB(40, 128, 208);
    }
    return _ButtonThemeWhiteBackHighlightedColor;
}
+ (void)xy_setButtonThemeWhiteBackHighlightedColor:(UIColor *)color{
    _ButtonThemeWhiteBackHighlightedColor = color;
}


static UIColor *_ButtonThemeWhiteDisabledColor;
+ (UIColor *)ButtonThemeWhiteDisabledColor{
    if (!_ButtonThemeWhiteDisabledColor) {
        _ButtonThemeWhiteDisabledColor = RGBA(255,255,255,0.3);
    }
    return _ButtonThemeWhiteDisabledColor;
}
+ (void)xy_setButtonThemeWhiteDisabledColor:(UIColor *)color{
    _ButtonThemeWhiteDisabledColor = color;
}

static UIColor *_ButtonThemeWhiteBackDisabledColor;
+ (UIColor *)ButtonThemeWhiteBackDisabledColor{
    if (!_ButtonThemeWhiteBackDisabledColor) {
        _ButtonThemeWhiteBackDisabledColor = RGB(150,201,246);
    }
    return _ButtonThemeWhiteBackDisabledColor;
}
+ (void)xy_setButtonThemeWhiteBackDisabledColor:(UIColor *)color{
    _ButtonThemeWhiteBackDisabledColor = color;
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


static UIColor *_ButtonTWhiteBlackHighlightedColor;
+ (UIColor *)ButtonTWhiteBlackHighlightedColor{
    if (!_ButtonTWhiteBlackHighlightedColor) {
        _ButtonTWhiteBlackHighlightedColor = RGB(102, 102, 102);
    }
    return _ButtonTWhiteBlackHighlightedColor;
}
+ (void)xy_setButtonTWhiteBlackHighlightedColor:(UIColor *)color{
    _ButtonTWhiteBlackHighlightedColor = color;
}



static UIColor *_ButtonTWhiteBlackBackHighlightedColor;
+ (UIColor *)ButtonTWhiteBlackBackHighlightedColor{
    if (!_ButtonTWhiteBlackBackHighlightedColor) {
        _ButtonTWhiteBlackBackHighlightedColor = RGB(242,242,242);
    }
    return _ButtonTWhiteBlackBackHighlightedColor;
}
+ (void)xy_setButtonTWhiteBlackBackHighlightedColor:(UIColor *)color{
    _ButtonTWhiteBlackBackHighlightedColor = color;
}


static UIColor *_ButtonTWhiteBlackBackDisabledColor;
+ (UIColor *)ButtonTWhiteBlackBackDisabledColor{
    if (!_ButtonTWhiteBlackBackDisabledColor) {
        _ButtonTWhiteBlackBackDisabledColor = [UIColor whiteColor];
    }
    return _ButtonTWhiteBlackBackDisabledColor;
}
+ (void)xy_setButtonTWhiteBlackBackDisabledColor:(UIColor *)color{
    _ButtonTWhiteBlackBackDisabledColor = color;
}


@end
