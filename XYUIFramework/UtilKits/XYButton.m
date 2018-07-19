//
//  XYButton.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYButton.h"
#import "XYThemeImage.h"
#import "XYThemeColor.h"
#import "XYUtils.h"
#import "UIView+XYCornerBorder.h"
#import "XYAutoLayout.h"

@interface XYButton()

@end

@implementation XYButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init{
    return [self initWithBlock];
}

- (instancetype)initWithTitle:(NSString*)title{
    if (self = [self initWithBlock]) {
        [self addCornerAndBorderWithCornerRadius:4.f borderColor:[UIColor clearColor]];
        [self setTitle:title forState:UIControlStateNormal];
    }
    return self;
}
- (instancetype)initWithBlock{
    if(self = [super init]){
        [self addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)buttonAction:(id)sender{
    if(self.xyButtonActionBlock){
        self.xyButtonActionBlock(sender);
    }
}
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    [self setBackgroundImage:[XYThemeImage imageWithColor:backgroundColor] forState:state];
}

- (void)setButtonStyle:(XYCustomButtonStyle)buttonStyle{
    _buttonStyle = buttonStyle;
    switch (_buttonStyle) {
        case XYCustomButtonStyleNormal:{
            [self setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
            [self setTitleColor:RGB(142, 197, 245) forState:UIControlStateHighlighted];
            [self setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateDisabled];

            [self setBackgroundColor:[UIColor clearColor] forState:UIControlStateNormal];
            [self setBackgroundColor:[UIColor clearColor] forState:UIControlStateHighlighted];
            [self setBackgroundColor:[UIColor clearColor] forState:UIControlStateDisabled];
        }
            break;
        case XYCustomButtonStyleThemeWhiteColor:{

            [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setTitleColor:RGB(147, 191, 231) forState:UIControlStateHighlighted];
            [self setTitleColor:RGBA(255,255,255,0.3) forState:UIControlStateDisabled];
            
            [self setBackgroundColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
            [self setBackgroundColor:RGB(40, 128, 208) forState:UIControlStateHighlighted];
            [self setBackgroundColor:RGB(150,201,246) forState:UIControlStateDisabled];

        }
            
            break;
        case XYCustomButtonStyleWhiteThemeColor:{
            
            self.layer.borderColor = [XYThemeColor ThemeColor].CGColor;
            
            [self setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
            [self setTitleColor:[[XYThemeColor ThemeColor] colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
            [self setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateDisabled];

            [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setBackgroundColor:[[XYThemeColor ThemeColor] colorWithAlphaComponent:0.08] forState:UIControlStateHighlighted];
            [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateDisabled];

        }
            break;
        case XYCustomButtonStyleWhiteBlackColor:{
            
            self.layer.borderColor = [XYThemeColor blackLevelFourColor].CGColor;

            [self setTitleColor:[XYThemeColor blackLevelOneColor] forState:UIControlStateNormal];
            [self setTitleColor:RGB(102, 102, 102) forState:UIControlStateHighlighted];
            [self setTitleColor:[XYThemeColor blackLevelOneColor] forState:UIControlStateDisabled];

            [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [self setBackgroundColor:RGB(242,242,242) forState:UIControlStateHighlighted];
            [self setBackgroundColor:[UIColor whiteColor] forState:UIControlStateDisabled];

        }
            break;
        default:
            break;
    }
}

- (void)setButtonSizeType:(XYButtonSizeType)buttonSizeType{
    _buttonSizeType = buttonSizeType;
}

- (CGSize)xySizeToFit{
    if (_buttonStyle == XYCustomButtonStyleNormal) {
        CGSize titleSize;
        if (self.currentAttributedTitle) {
            titleSize = [XYUtils sizeForText:self.currentAttributedTitle.string withWidth:SAFEAREA_WIDTH withFont:self.titleLabel.font];
        }else{
            titleSize = [XYUtils sizeForText:self.currentTitle withWidth:SAFEAREA_WIDTH withFont:self.titleLabel.font];
        }
        return titleSize;
    }else{
        CGSize size = [XYUtils sizeForText:self.currentTitle withWidth:SAFEAREA_WIDTH withFont:self.titleLabel.font];
        if (_buttonSizeType == XYButtonTypeSmall) {
            if (size.width+24 < 64) {
                return CGSizeMake(64, 32);
            }else{
                return CGSizeMake(size.width+12*2, 32);
            }
        }else{
            CGSize titleSize;
            if (self.currentAttributedTitle) {
                titleSize = [XYUtils sizeForText:self.currentAttributedTitle.string withWidth:SAFEAREA_WIDTH withFont:self.titleLabel.font];
            }else{
                titleSize = [XYUtils sizeForText:self.currentTitle withWidth:SAFEAREA_WIDTH withFont:self.titleLabel.font];
            }
            return titleSize;
        }
    }
}

- (void)enabledButton{
    self.enabled = YES;
    self.alpha = 1;
}
- (void)disEnabledButton{
    self.enabled = NO;
    if (_buttonStyle == XYCustomButtonStyleThemeWhiteColor) {
        self.alpha = 1;
    }else{
        self.alpha = 0.3;
    }
    
}


@end
