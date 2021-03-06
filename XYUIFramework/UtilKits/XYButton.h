//
//  XYButton.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, XYCustomButtonStyle) {
    XYCustomButtonStyleNormal,
    XYCustomButtonStyleThemeWhiteColor,
    XYCustomButtonStyleWhiteThemeColor,
    XYCustomButtonStyleWhiteBlackColor
};

typedef NS_ENUM(NSInteger, XYButtonSizeType) {
    XYButtonTypeNormal,
    XYButtonTypeSmall
};


@class XYButton;

typedef void (^XYButtonActionBlock)(XYButton*button);

@interface XYButton : UIButton
@property (nonatomic ) XYButtonActionBlock xyButtonActionBlock;
@property (nonatomic, assign) XYCustomButtonStyle buttonStyle;
@property (nonatomic, assign) XYButtonSizeType buttonSizeType;

@property (nonatomic, strong) UIFont *buttonFont;

@property (nonatomic, strong) UIColor *backgroundImagecolor;

- (instancetype)initWithTitle:(NSString*)title;
- (instancetype)initWithBlock;

- (void)enabledButton;
- (void)disEnabledButton;
- (CGSize)xySizeToFit;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

- (void)setBackgroundColor:(UIColor *)backgroundColor cornerRadious:(CGFloat)cornerRadious forState:(UIControlState)state;

@end
