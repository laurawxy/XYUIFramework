//
//  UIView+XYLayout.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
 
@interface UIView (XYLayout)

@property (nonatomic, strong, readonly) MASViewAttribute *xy_mas_bottom;
@property (nonatomic, strong, readonly) MASViewAttribute *xy_mas_top;

- (void)setLayoutLeftNoWidth;
- (void)setLayoutLeftNoWidthWithViewRight:(UIView*)view offset:(CGFloat)offset;



- (void)setLayoutRightNoWidth;
- (void)setLayoutRightNoSizeWithCenterYView:(UIView *)view;
- (void)setLayoutLeftNoSizeCenterYView:(UIView *)view;


@end
