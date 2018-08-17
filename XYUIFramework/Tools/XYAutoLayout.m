//
//  XYAutoLayout.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYAutoLayout.h"
#import "XYViewController.h"
#import "UINavigationController+XYNavigation.h"
#import "UIDevice+XYPlatForm.h"

@implementation XYAutoLayout

+ (float)safeArea_height{
    float height = SAFE_SCREEN_HEIGHT;

    XYViewController *vc = (XYViewController*)[UINavigationController getDisplayingViewController];
    if (vc) {
        if (vc.navigationController.viewControllers.count == 1) {
            height -= TabBarHeight;
        }
    }
    return height;
}

+ (float)notSafeArea_Top{
    float space = 0.0;
    if ([UIDevice isiPhoneX]) {
        if (@available(iOS 11.0, *)){
            space = XY_KEY_WINDOW.safeAreaInsets.top;
        }
    }else{
        return space = 20;
    }
    
    return space;
}

+ (float)notSafeArea_bottom{
    float space = 0.0;
    if (@available(iOS 11.0, *)){
        space = XY_KEY_WINDOW.safeAreaInsets.bottom;
    }else{
        space = 0;
    }
    return space;
}

static CGFloat _CommonLeftMargin;
+ (CGFloat)CommonLeftMargin{
    if (_CommonLeftMargin == 0) {
        _CommonLeftMargin = ScaleX750(20);
    }
    return _CommonLeftMargin;
}
+ (void)xy_setCommonLeftMargin:(CGFloat)CommonLeftMargin{
    _CommonLeftMargin = CommonLeftMargin;
}

static CGFloat _CommonShadowCorner;
+ (CGFloat)CommonShadowCorner{
    if (_CommonShadowCorner == 0) {
        _CommonShadowCorner = 4.f;
    }
    return _CommonShadowCorner;
}
+ (void)xy_setCommonShadowCorner:(CGFloat)CommonShadowCorner{
    _CommonShadowCorner = CommonShadowCorner;
}

static CGFloat _TextFieldHeight;
+ (CGFloat)TextFieldHeight{
    if (_TextFieldHeight == 0) {
        _TextFieldHeight = 46.f;
    }
    return _TextFieldHeight;
}
+ (void)xy_setTextFieldHeight:(CGFloat)TextFieldHeight{
    _TextFieldHeight = TextFieldHeight;
}
static CGFloat _SegmentHeight;

+ (CGFloat)SegmentHeight{
    if (_SegmentHeight == 0) {
        _SegmentHeight = 49.f;
    }
    return _SegmentHeight;
}
+ (void)xy_setSegmentHeight:(CGFloat)SegmentHeight{
    _SegmentHeight = SegmentHeight;
}

static CGFloat _CommonShadowHeight;
+ (CGFloat)CommonShadowHeight{
    if (_CommonShadowHeight == 0) {
        _CommonShadowHeight = 5.f;
    }
    return _CommonShadowHeight;
}
+ (void)xy_setCommonShadowHeight:(CGFloat)CommonShadowHeight{
    _CommonShadowHeight = CommonShadowHeight;
}

static CGFloat _kNormalCellHeight;
+ (CGFloat)NormalCellHeight{
    if (_kNormalCellHeight == 0) {
        _kNormalCellHeight = 48.f;
    }
    return _kNormalCellHeight;
}
+ (void)xy_setNormalCellHeight:(CGFloat)NormalCellHeight{
    _kNormalCellHeight = NormalCellHeight;
}

static CGFloat _LineHeight;
+ (CGFloat)LineHeight{
    if (_LineHeight == 0) {
        _LineHeight = 1.0/[UIScreen mainScreen].scale;
        //[UIScreen mainScreen].scale * 0.2;
    }
    return _LineHeight;
}
+ (void)xy_setLineHeight:(CGFloat)LineHeight{
    _LineHeight = LineHeight/[UIScreen mainScreen].scale;
}

static CGFloat _TapHeight;
+ (CGFloat)TapHeight{
    if (!_TapHeight) {
        _TapHeight = 5.f;
    }
    return _TapHeight;
}
+ (void)xy_setTapHeight:(CGFloat)TapHeight{
    _TapHeight = TapHeight;
}

static CGFloat _CustomButtonViewLeftMargin;
+ (CGFloat)CustomButtonViewLeftMargin{
    if (_CustomButtonViewLeftMargin == 0) {
        _CustomButtonViewLeftMargin = ScaleX750(32);
    }
    return _CustomButtonViewLeftMargin;
}
+ (void)xy_setCustomButtonViewLeftMargin:(CGFloat)CustomButtonViewLeftMargin{
    _CustomButtonViewLeftMargin = CustomButtonViewLeftMargin;
}

static CGFloat _BottomButtonViewHeight;
+ (CGFloat)BottomButtonViewHeight{
    if (_BottomButtonViewHeight == 0) {
        _BottomButtonViewHeight = 50.f;
    }
    return _BottomButtonViewHeight;
}
+ (void)xy_setBottomButtonViewHeight:(CGFloat)BottomButtonViewHeight{
    _BottomButtonViewHeight = BottomButtonViewHeight;
}


static CGFloat _CustomButtonViewHeight;
+ (CGFloat)CustomButtonViewHeight{
    if (_CustomButtonViewHeight == 0) {
        _CustomButtonViewHeight = 49.f;
    }
    return _CustomButtonViewHeight;
}
+ (void)xy_setCustomButtonViewHeight:(CGFloat)CustomButtonViewHeight{
    _CustomButtonViewHeight = CustomButtonViewHeight;
}




@end
