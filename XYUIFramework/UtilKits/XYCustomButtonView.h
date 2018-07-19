//
//  XYCustomButtonView.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageTitleButton.h"

#define XYCustomButtonViewLeftMargin ScaleX750(32)


@interface XYCustomButtonView : UIView
@property (nonatomic, strong) ImageTitleButton *button;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, assign) XYCustomButtonStyle buttonStyle;

@property (nonatomic, copy) XYButtonActionBlock customActionBlock;

- (instancetype)initWithImageTitleButtonType:(ImageTitleButtonType)imageTitleButtonType;
- (instancetype)initWithFrame:(CGRect)frame;

- (void)enabledButton;
- (void)disEnabledButton;
@end
