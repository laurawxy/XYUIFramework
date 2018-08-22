//
//  UIView+XYCornerBorder.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIView+XYCornerBorder.h"
#import "XYThemeColor.h"
#import "XYAutoLayout.h"
#import "XYButton.h"

@implementation UIView (XYCornerBorder)

- (void)addCorner{
    self.layer.cornerRadius = KCommonShadowCorner;
    self.layer.masksToBounds = YES;
}
- (void)addCornerWithCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}
- (void)addCornerAndBorderWithCornerRadius:(CGFloat)cornerRadius{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [XYThemeColor ThemeColor].CGColor;
    self.layer.borderWidth = KLineHeight;
}
- (void)addCornerAndBorderWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor{
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = KLineHeight;
}
- (void)createCornerRadiusShadowWithCornerRadius:(CGFloat)cornerRadius shadowColor:(UIColor *)shadowColor shadowCornerRadius:(CGFloat)shadowCornerRadius offset:(CGSize)offset opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius{
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOpacity = opacity;
    self.layer.shadowOffset = offset;
    self.layer.shadowRadius = shadowRadius;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.cornerRadius = cornerRadius;
    self.layer.shadowPath = [[UIBezierPath bezierPathWithRoundedRect:[self bounds] cornerRadius:shadowCornerRadius] CGPath];
    self.layer.masksToBounds = NO;
    if ([self isKindOfClass:[XYButton class]]) {
        XYButton *button = (XYButton *)self;
        [button setBackgroundColor:button.backgroundImagecolor cornerRadious:cornerRadius forState:UIControlStateNormal];
    }
}



@end
