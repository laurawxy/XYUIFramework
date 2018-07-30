//
//  UIView+XYGradientLayer.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/30.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYGradientLayer)

- (void)setVerticalGradientLayerWithColors:(NSArray <UIColor*>*)colors;
- (void)setHorizontalGradientLayerWithColors:(NSArray <UIColor*>*)colors;

@end
