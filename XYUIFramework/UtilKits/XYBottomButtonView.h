//
//  XYBottomButtonView.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYButton.h"

@interface XYBottomButtonView : UIView

@property (nonatomic, copy) NSString *leftTitle;
@property (nonatomic, strong) UIColor *leftButtonTitleColor;
@property (nonatomic, strong) UIColor *leftButtonBckgroundColor;
@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, assign) CGFloat leftWidth;
@property (nonatomic, strong) UIFont *leftTitleFont;
@property (nonatomic, copy) XYButtonActionBlock leftActionBlock;


@property (nonatomic, copy) NSString *rightTitle;
@property (nonatomic, strong) UIColor *rightButtonTitleColor;
@property (nonatomic, strong) UIColor *rightButtonBckgroundColor;
@property (nonatomic, strong) UIImage *rightImage;
@property (nonatomic, assign) CGFloat rightWidth;
@property (nonatomic, strong) UIFont *rightTitleFont;
@property (nonatomic, copy) XYButtonActionBlock rightActionBlock;

@property (nonatomic, assign) XYCustomButtonStyle leftButtonStyle;
@property (nonatomic, assign) XYCustomButtonStyle rightButtonStyle;

- (void)enabledLeftButton;
- (void)disEnabledLeftButton;
- (void)enabledRightButton;
- (void)disEnabledRightButton;
    
@end
