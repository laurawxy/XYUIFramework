//
//  XYBottomButtonView.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYBottomButtonView.h"
#import <Masonry.h>
#import "XYThemeColor.h"
#import "XYAutoLayout.h"
#import "XYThemeFont.h"
#import "XYMacroConfig.h"

@interface XYBottomButtonView()
@property (nonatomic, strong) XYButton *leftButton;
@property (nonatomic, strong) XYButton *rightButton;

@end

@implementation XYBottomButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    if (self = [super init]) {
        
        [self addSubview:self.leftButton];
        [self addSubview:self.rightButton];
        [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(0);
        }];
        [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.mas_equalTo(0);
        }];
        
        self.leftButtonTitleColor= [XYThemeColor ThemeColor];
        self.leftButtonBckgroundColor = [UIColor whiteColor];
        self.leftWidth = SCREEN_WIDTH/2;
        self.leftTitleFont = KThemeNormalFont(17);
        self.leftButtonStyle = XYCustomButtonStyleWhiteThemeColor;
        
        self.rightButtonTitleColor= [UIColor whiteColor];
        self.rightButtonBckgroundColor = [XYThemeColor ThemeColor];
        self.rightWidth = SCREEN_WIDTH/2;
        self.rightTitleFont = KThemeNormalFont(17);
        self.rightButtonStyle = XYCustomButtonStyleThemeWhiteColor;

    }
    return self;
}

- (void)setLeftButtonStyle:(XYCustomButtonStyle)leftButtonStyle{
    _leftButtonStyle = leftButtonStyle;
    self.leftButton.buttonStyle = _leftButtonStyle;
}

- (void)setRightButtonStyle:(XYCustomButtonStyle)rightButtonStyle{
    _rightButtonStyle = rightButtonStyle;
    self.rightButton.buttonStyle = _rightButtonStyle;
}


- (void)setLeftImage:(UIImage *)leftImage{
    _leftImage = leftImage;
    self.leftButtonStyle = XYCustomButtonStyleNormal;
    [self.leftButton setImage:_leftImage forState:UIControlStateNormal];
}
- (void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    [self.leftButton setTitle:_leftTitle forState:UIControlStateNormal];
}
- (void)setLeftButtonBckgroundColor:(UIColor *)leftButtonBckgroundColor{
    _leftButtonBckgroundColor = leftButtonBckgroundColor;
    [self.leftButton setBackgroundColor:_leftButtonBckgroundColor];
}
- (void)setLeftButtonTitleColor:(UIColor *)leftButtonTitleColor{
    _leftButtonTitleColor = leftButtonTitleColor;
    [self.leftButton setTitleColor:_leftButtonTitleColor forState:UIControlStateNormal];
}
- (void)setLeftWidth:(CGFloat)leftWidth{
    _leftWidth = leftWidth;
    [self.leftButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.leftWidth);
    }];
}
- (void)setLeftTitleFont:(UIFont *)leftTitleFont{
    _leftTitleFont = leftTitleFont;
    self.leftButton.titleLabel.font = _leftTitleFont;
}


- (void)setRightImage:(UIImage *)rightImage{
    _rightImage = rightImage;
    [self.rightButton setImage:_rightImage forState:UIControlStateNormal];
    self.rightButtonStyle = XYCustomButtonStyleNormal;
}
- (void)setRightTitle:(NSString *)rightTitle{
    _rightTitle = rightTitle;
    [self.rightButton setTitle:_rightTitle forState:UIControlStateNormal];
}
- (void)setRightButtonBckgroundColor:(UIColor *)rightButtonBckgroundColor{
    _rightButtonBckgroundColor = rightButtonBckgroundColor;
    [self.rightButton setBackgroundColor:_rightButtonBckgroundColor];
}
- (void)setRightButtonTitleColor:(UIColor *)rightButtonTitleColor{
    _rightButtonTitleColor = rightButtonTitleColor;
    [self.rightButton setTitleColor:_rightButtonTitleColor forState:UIControlStateNormal];
}
- (void)setRightWidth:(CGFloat)rightWidth{
    _rightWidth = rightWidth;
    [self.rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.rightWidth);
    }];
}
- (void)setRightTitleFont:(UIFont *)rightTitleFont{
    _rightTitleFont = rightTitleFont;
    self.rightButton.titleLabel.font = _rightTitleFont;
}


- (XYButton *)leftButton{
    if (!_leftButton) {
        _leftButton = [[XYButton alloc] initWithBlock];
        WeakSelf
        _leftButton.xyButtonActionBlock = ^(XYButton *button) {
            if (weakSelf.leftActionBlock) {
                weakSelf.leftActionBlock(button);
            }
        };
    }
    return _leftButton;
}
- (XYButton *)rightButton{
    if (!_rightButton) {
        _rightButton = [[XYButton alloc] initWithBlock];
        WeakSelf
        _rightButton.xyButtonActionBlock = ^(XYButton *button) {
            if (weakSelf.rightActionBlock) {
                weakSelf.rightActionBlock(button);
            }
        };
    }
    return _rightButton;
}

- (void)enabledLeftButton{
    [self.leftButton enabledButton];
}
- (void)disEnabledLeftButton{
    [self.leftButton disEnabledButton];
}
- (void)enabledRightButton{
    [self.rightButton enabledButton];
}
- (void)disEnabledRightButton{
    [self.rightButton disEnabledButton];
}


@end
