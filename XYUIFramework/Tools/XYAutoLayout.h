//
//  XYAutoLayout.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS11_OR_LATER_SPACE(par) ({ float space = 0.0; if (@available(iOS 11.0, *)) space = par; (space); })
#define XY_KEY_WINDOW [UIApplication sharedApplication].keyWindow

//顶部非安全区  iOS11 22
#define XY_TOP_ACTIVE_SPACE IOS11_OR_LATER_SPACE(MAX(0, XY_KEY_WINDOW.safeAreaInsets.top-20))

//底部非安全区 iOS11 34
#define XY_BOTTOM_SPACE [XYAutoLayout notSafeArea_bottom]

//顶部非安全区 状态栏高度
#define StatusBarHeight [XYAutoLayout notSafeArea_Top]


//Tab高度
#define TabBarHeight 49

//title导航高度
#define NavigationAndStatusHeight (StatusBarHeight+NavigationHeight)

//导航栏高度
#define NavigationHeight 44

//屏幕
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

//屏幕安全区
#define SAFE_SCREEN_HEIGHT (SCREEN_HEIGHT-XY_TOP_ACTIVE_SPACE-XY_BOTTOM_SPACE)
#define SAFE_SCREEN_WIDTH SCREEN_WIDTH

//安全区
#define SAFEAREA_WIDTH (SCREEN_WIDTH-2*CommonLeftMargin)
#define SAFEAREA_HEIGHT [XYAutoLayout safeArea_height]

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && (SCREEN_MAX_LENGTH < 568.0))
#define IS_IPHONE_5 (IS_IPHONE && (SCREEN_MAX_LENGTH == 568.0))
#define IS_IPHONE_6 (IS_IPHONE && (SCREEN_MAX_LENGTH == 667.0))
#define IS_IPHONE_6P (IS_IPHONE && (SCREEN_MAX_LENGTH == 736.0))
#define IS_IPHONE_X (IS_IPHONE && (SCREEN_MAX_LENGTH == 812.0))


//////////////////////////////////////////////////
//  控件 View 坐标(x,y)和宽高(width,height)test
////////////////////////////////////////////////
#define X(v)               (v).frame.origin.x
#define Y(v)               (v).frame.origin.y
#define MAX_X(v)           CGRectGetMaxX(v.frame)
#define MIN_X(v)           CGRectGetMinX(v.frame)
#define MAX_Y(v)           CGRectGetMaxY(v.frame)
#define MIN_Y(v)           CGRectGetMinY(v.frame)
#define WIDTH(v)           (v).frame.size.width
#define HEIGHT(v)          (v).frame.size.height



#define XYBottomButtonViewHeight 50.f
#define XYCustomButtonViewHeight 49.f

//底部按钮
#define KBottomOneButtonViewHeight 65.f
#define KBottomOneButtonHeight 45.f
#define KBottomOneButtonLeftMargin ScaleX750(20)

#define KBottomMoreButtonViewHeight 70.f
#define KBottomMoreButtonHeight 40.f
#define KBottomMoreButtonsMargin 12.f
#define KBottomMoreButtonLeftMargin CommonLeftMargin

#define KCustomOneButtonViewHeight 75.f
#define KCustomOneButtonHeight 45.f
#define KCustomOneButtonLeftMargin CommonLeftMargin

#define KCustomMoreButtonViewHeight 70.f
#define KCustomMoreButtonHeight 45.f
#define KCustomMoreButtonsMargin 14.f
#define KCustomMoreButtonLeftMargin CommonLeftMargin

//Segment
#define kSegmentHeight 49.f
#define kSegmentHeight_Low 35.f
#define kSegmentHeight_Center 40.f

#define kNormalCellHeight 48.f

#define kCellHeight_72 72.f
#define kCellHeight_64 64.f

#define KOriginY 0

//Login
#define TextFieldHeight 46.f

#define ScaleSafeX750(x) (x)*SAFEAREA_WIDTH/(375-40)
#define ScaleX750(x) (x)*SCREEN_WIDTH/375
#define CommonLeftMargin ScaleX750(20)
#define CommonShadowCorner ScaleX750(5)

#define CommonSpacing 40
#define CommonShadowHeight 5
#define DefaultTableViewHeaderFooterHeight 0.01f

#define LineHeight [XYAutoLayout lineHeight]
#define TapHeight 5.f

@interface XYAutoLayout : NSObject

+ (float)safeArea_height;
+ (float)notSafeArea_Top;
+ (float)notSafeArea_bottom;
+ (float)lineHeight;

@end
