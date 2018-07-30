//
//  UIView+XYCornerBorder.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYCornerBorder)

- (void)addCorner;
- (void)addCornerWithCornerRadius:(CGFloat)cornerRadius;

- (void)addCornerAndBorderWithCornerRadius:(CGFloat)cornerRadius;
- (void)addCornerAndBorderWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor;
- (void)createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowCornerRadius:(CGFloat)shadowCornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius;

@end
