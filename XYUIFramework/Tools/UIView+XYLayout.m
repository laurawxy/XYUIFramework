//
//  UIView+XYLayout.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIView+XYLayout.h"
#import "XYAutoLayout.h"
#import "UIView+XYFrame.h"
#import "UIDevice+XYPlatForm.h"

@implementation UIView (XYLayout)

- (MASViewAttribute *)xy_mas_bottom {
    if (self.height == SCREEN_HEIGHT) {
        if ([UIDevice isiPhoneX]) {
            if (@available(iOS 11.0, *)) {
                return self.mas_safeAreaLayoutGuideBottom;
            }else{
                return self.mas_bottom;
            }
        }else{
            return self.mas_bottom;
        }
    }else{
        return self.mas_bottom;
    }
}

- (MASViewAttribute *)xy_mas_top {
    if (self.height == SCREEN_HEIGHT) {
        if ([UIDevice isiPhoneX]) {
            if (@available(iOS 11.0, *)) {
                return self.mas_safeAreaLayoutGuideTop;
            }else{
                return self.mas_top;
            }
        }else{
            return [[MASViewAttribute alloc] initWithView:self layoutAttribute:NSLayoutAttributeTop];
        }
    }else{
        return self.mas_top;
    }
}

- (void)setLayoutLeftNoWidth{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CommonLeftMargin);
        make.top.bottom.mas_equalTo(0);
    }];
}

- (void)setLayoutLeftNoWidthWithViewRight:(UIView*)view offset:(CGFloat)offset{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(view.mas_right).offset(offset);
        make.top.bottom.mas_equalTo(0);
    }];
}


- (void)setLayoutRightNoWidth{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-CommonLeftMargin);
        make.top.bottom.mas_equalTo(0);
    }];
}

- (void)setLayoutRightNoSizeWithCenterYView:(UIView *)view{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-CommonLeftMargin);
        make.centerY.mas_equalTo(view);
    }];
}

- (void)setLayoutLeftNoSizeCenterYView:(UIView *)view{
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CommonLeftMargin);
        make.centerY.mas_equalTo(view);
    }];
}


@end
