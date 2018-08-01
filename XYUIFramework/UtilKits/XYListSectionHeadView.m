//
//  XYListSectionHeadView.m
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYListSectionHeadView.h"
#import "XYImageTitleButton.h"
#import "XYThemeColor.h"
#import "XYThemeFont.h"
#import <Masonry/Masonry.h>
#import "XYAutoLayout.h"
#import "XYMacroConfig.h"
#import "UIView+XYFrame.h"
#import "NSObject+XYUtils.h"

@interface XYListSectionHeadView ()
@property (nonatomic, strong) UIView *leftView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) XYImageTitleButton *rightButton;
@end

@implementation XYListSectionHeadView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupViews];
    }
    return self;
}

-(void)setupViews
{
    _leftView = [[UIView alloc] init];
    _leftView.backgroundColor = [XYThemeColor ThemeColor];
    [self addSubview:_leftView];
    [_leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(XYCommonLeftMargin);
        make.bottom.mas_equalTo(-16);
        make.width.mas_equalTo(4);
        make.height.mas_equalTo(16);
    }];
    
    _titleLabel = [UILabel new];
    _titleLabel.textColor = [XYThemeColor blackLevelOneColor];
    _titleLabel.font = KThemeBoldFont(16);
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftView.mas_right).offset(8);
        make.height.mas_equalTo(16);
        make.centerY.mas_equalTo(self.leftView);
    }];
    
    _rightButton = [[XYImageTitleButton alloc] initWithType:ImageRightTitleLeft andTitleFont:KThemeNormalFont(16) andTitle:@"查看更多" andImage:nil andFrame:CGRectZero];
    _rightButton.buttonStyle = XYCustomButtonStyleNormal;
    _rightButton.imageTitleMargin = 4.f;
    [_rightButton setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
    [_rightButton sizeToFitXYImageTitleButton];
    [self addSubview:_rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-XYCommonLeftMargin);
        make.centerY.mas_equalTo(self.titleLabel);
        make.height.mas_equalTo(self.rightButton.height);
        make.width.mas_equalTo(self.rightButton.width);
    }];
    WeakSelf
    _rightButton.imageTitleButtonActionBlock = ^(XYImageTitleButton *button) {
        if(weakSelf.clickAction) {
            weakSelf.clickAction();
        }
    };
    
    self.showRightButton = NO;
}

- (void)setTopMargin:(CGFloat)topMargin{
    _topMargin = topMargin;
    
    [_leftView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topMargin);
        make.left.mas_equalTo(XYCommonLeftMargin);
        make.width.mas_equalTo(4);
        make.height.mas_equalTo(16);
    }];
}

-(void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = _title;
    [_titleLabel sizeToFitLabelWidth];
}

- (void)setShowRightButton:(BOOL)showRightButton{
    _showRightButton = showRightButton;
    _rightButton.hidden = !_showRightButton;
}

- (void)setShowLeftView:(BOOL)showLeftView{
    _showLeftView = showLeftView;
    _leftView.hidden = !_showLeftView;
    if (_showLeftView) {
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftView.mas_right).offset(8);
            make.height.mas_equalTo(16);
            make.centerY.mas_equalTo(self.leftView);
        }];
    }else{
        [_titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XYCommonLeftMargin);
            make.height.mas_equalTo(16);
            make.centerY.mas_equalTo(self.leftView);
        }];
    }
}

- (void)setRightButtonTitle:(NSString *)rightButtonTitle{
    _rightButtonTitle = rightButtonTitle;
    [_rightButton setTitle:_rightButtonTitle forState:UIControlStateNormal];
    [_rightButton sizeToFitXYImageTitleButton];
    [_rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.rightButton.height);
        make.width.mas_equalTo(self.rightButton.width);
    }];
    
}

- (void)setRightButtonImage:(UIImage *)rightButtonImage{
    _rightButtonImage = rightButtonImage;
    [_rightButton setImage:_rightButtonImage forState:UIControlStateNormal];
    [_rightButton sizeToFitXYImageTitleButton];
    [_rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.rightButton.height);
        make.width.mas_equalTo(self.rightButton.width);
    }];
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    _titleLabel.font = titleFont;
    [_titleLabel sizeToFitLabelWidth];
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    _titleLabel.textColor = _titleColor;
}

- (void)setRightButtonColor:(UIColor *)rightButtonColor{
    _rightButtonColor = rightButtonColor;
    [_rightButton setTitleColor:rightButtonColor forState:UIControlStateNormal];
}
- (void)setRightButtonFont:(UIFont *)rightButtonFont{
    _rightButtonFont = rightButtonFont;
    _rightButton.titleButton.titleLabel.font = _rightButtonFont;
    [_rightButton sizeToFitXYImageTitleButton];
    [_rightButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.rightButton.height);
        make.width.mas_equalTo(self.rightButton.width);
    }];
}
@end
