//
//  XYImageTitleButton.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYButton.h"

@class XYImageTitleButton;

typedef void (^XYImageTitleButtonActionBlock)(XYImageTitleButton*button);

typedef NS_ENUM(NSInteger ,XYImageTitleButtonType){
    XYImageTitleButtonTypeNone = 0,
    ImageTopTitleBottom,
    ImageBottomTitleTop,
    ImageLeftTitleRight,
    ImageRightTitleLeft,
    ImageDownTitleUp //image和title重叠
};

@interface XYImageTitleButton : XYButton
@property (nonatomic,strong) XYButton *imageButton;
@property (nonatomic,strong) XYButton *titleButton;
@property (nonatomic,assign) CGFloat imageTitleMargin;
@property (nonatomic,assign) XYImageTitleButtonType type;

- (instancetype)initWithType:(XYImageTitleButtonType)type andTitleFont:(UIFont*)font andTitle:(NSString*)title andImage:(UIImage*)image andFrame:(CGRect)frame;
@property(nonatomic,copy)XYImageTitleButtonActionBlock imageTitleButtonActionBlock;

- (void)sizeToFitXYImageTitleButton;
- (void)transformMakeRotation:(CGFloat)angle;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@end
