//
//  XYThemeImage.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYThemeImage : UIImage

+ (UIImage *)icon_navi_back;
+ (UIImage *)icon_noInternet;
+ (UIImage *)icon_noData;

+ (UIImage *)icon_toast_success;
+ (UIImage *)icon_toast_failure;

+ (UIImage *)icon_tabbar_home_default;

+ (UIImage *)icon_tabbar_home_selected;

+ (UIImage *)icon_tabbar_my_default;

+ (UIImage *)icon_tabbar_my_Selected;


+ (CGFloat)scaleHeightWithImage:(UIImage*)image width:(CGFloat)width;

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (NSArray<UIImage*>*)imagesWithGifFile:(NSString*)fileName;

@end
