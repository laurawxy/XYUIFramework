//
//  XYCustomButtonView.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYCustomButtonView.h"
#import "UIView+XYCornerBorder.h"
#import <Masonry/Masonry.h>
#import "XYAutoLayout.h"
#import "XYThemeFont.h"
#import "XYThemeColor.h"
#import "XYMacroConfig.h"
#import "NSObject+XYUtils.h"

@interface XYCustomButtonView()

@property (nonatomic, strong) UIColor *buttonaLayerColor;
@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, assign) XYImageTitleButtonType imageTitleButtonType;

@end

@implementation XYCustomButtonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithXYImageTitleButtonType:(XYImageTitleButtonType)imageTitleButtonType{
    self.imageTitleButtonType = imageTitleButtonType;

    if (self = [super init]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        if (self.imageTitleButtonType == XYImageTitleButtonTypeNone) {
            self.imageTitleButtonType = ImageDownTitleUp;
        }
        
        [self addSubview:self.button];
        [self.button addCornerAndBorderWithCornerRadius:4.f borderColor:[UIColor clearColor]];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XYCustomButtonViewLeftMargin);
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-XYCustomButtonViewLeftMargin);
        }];
        
        self.buttonStyle = XYCustomButtonStyleThemeWhiteColor;
        
        self.titleFont = KThemeNormalFont(17);
    }
    return self;
}

- (void)setButtonStyle:(XYCustomButtonStyle)buttonStyle{
    _buttonStyle = buttonStyle;
    self.button.buttonStyle = _buttonStyle;
}

- (void)setImage:(UIImage *)image{
    _image = image;
    [self.button setImage:_image forState:UIControlStateNormal];
    switch (_buttonStyle) {
        case XYCustomButtonStyleThemeWhiteColor:{
            [self.button setImage:[_image setImageWithTintColor:RGB(147, 191, 231)] forState:UIControlStateHighlighted];
        }
            break;
        case XYCustomButtonStyleWhiteThemeColor:{
            [self.button setImage:[_image setImageWithTintColor:RGB(142, 197, 245)] forState:UIControlStateHighlighted];
        }
            break;
        case XYCustomButtonStyleWhiteBlackColor:{
            [self.button setImage:[_image setImageWithTintColor:RGB(102, 102, 102)] forState:UIControlStateHighlighted];
        }
            break;
        default:
            break;
    }

}
- (void)setTitle:(NSString *)title{
    _title = title;
    [self.button setTitle:_title forState:UIControlStateNormal];
}

- (void)setButtonaLayerColor:(UIColor *)buttonaLayerColor{
    _buttonaLayerColor = buttonaLayerColor;
    self.button.layer.borderColor = _buttonaLayerColor.CGColor;
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.button.titleLabel.font = _titleFont;
}

- (XYImageTitleButton *)button{
    if (!_button) {
        _button = [[XYImageTitleButton alloc] initWithType:_imageTitleButtonType andTitleFont:KThemeNormalFont(17) andTitle:@"" andImage:nil andFrame:CGRectZero];
        WeakSelf
        _button.imageTitleButtonActionBlock = ^(XYImageTitleButton *button) {
            if (weakSelf.customActionBlock) {
                weakSelf.customActionBlock(button);
            }
        };
    }
    return _button;
}


- (void)enabledButton{
    self.button.enabled = YES;
    self.button.titleButton.enabled = YES;
    self.button.imageButton.enabled = YES;

    self.alpha = 1;
}
- (void)disEnabledButton{
    self.button.enabled = NO;
    self.button.titleButton.enabled = NO;
    self.button.imageButton.enabled = NO;

    if (_buttonStyle == XYCustomButtonStyleThemeWhiteColor) {
        self.alpha = 1;
    }else{
        self.alpha = 0.3;
    }
}

@end
