//
//  ImageTitleButton.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYButton.h"

@class ImageTitleButton;

typedef void (^ImageTitleButtonActionBlock)(ImageTitleButton*button);

typedef NS_ENUM(NSInteger ,ImageTitleButtonType){
    ImageTitleButtonTypeNone = 0,
    ImageTopTitleBottom,
    ImageBottomTitleTop,
    ImageLeftTitleRight,
    ImageRightTitleLeft,
    ImageDownTitleUp //image和title重叠
};

@interface ImageTitleButton : XYButton
@property (nonatomic,strong) XYButton *imageButton;
@property (nonatomic,strong) XYButton *titleButton;
@property (nonatomic,assign) CGFloat imageTitleMargin;
@property (nonatomic,assign) ImageTitleButtonType type;

- (instancetype)initWithType:(ImageTitleButtonType)type andTitleFont:(UIFont*)font andTitle:(NSString*)title andImage:(UIImage*)image andFrame:(CGRect)frame;
@property(nonatomic,copy)ImageTitleButtonActionBlock imageTitleButtonActionBlock;

- (void)sizeToFitImageTitleButton;
- (void)transformMakeRotation:(CGFloat)angle;

- (void)setTitle:(NSString *)title forState:(UIControlState)state;

@end
