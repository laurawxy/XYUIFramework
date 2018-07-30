//
//  UIView+XYGradientLayer.m
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/30.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIView+XYGradientLayer.h"

@implementation UIView (XYGradientLayer)

- (void)setVerticalGradientLayerWithColors:(NSArray <UIColor*>*)colors{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *gradientColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (int i=0; i<colors.count; i++) {
        [gradientColors addObject:(__bridge id)colors[i].CGColor];
    }
    gradientLayer.colors = gradientColors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1.0);
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}
- (void)setHorizontalGradientLayerWithColors:(NSArray <UIColor*>*)colors{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSMutableArray *gradientColors = [NSMutableArray arrayWithCapacity:colors.count];
    for (int i=0; i<colors.count; i++) {
        [gradientColors addObject:(__bridge id)colors[i].CGColor];
    }
    gradientLayer.colors = gradientColors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}

@end
