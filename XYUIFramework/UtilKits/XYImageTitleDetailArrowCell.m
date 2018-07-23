//
//  XYImageTitleDetailArrowCell.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//


#import "XYImageTitleDetailArrowCell.h"
#import "XYAutoLayout.h"
#import <Masonry/Masonry.h>
#import "UIView+XYLine.h"
#import "XYThemeColor.h"
#import "XYThemeFont.h"
#import "UIView+XYFrame.h"
#import "UIView+XYCornerBorder.h"
#import "NSObject+XYUtils.h"

#define TitleMaxWidth (SCREEN_WIDTH/2-2*XYCommonLeftMargin)
#define TitleTopBottomHeight XYCommonLeftMargin

@interface XYImageTitleDetailArrowCell()
@property(nonatomic, strong) UIImageView  *leftImageView;
@property(nonatomic, strong) UILabel      *titleLabel;
@property(nonatomic, strong) UILabel      *detailLabel;
@property(nonatomic, strong) UIImageView  *indicateImageView;
@property(nonatomic, strong) UILabel      *flagLabel;

@end

@implementation XYImageTitleDetailArrowCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, XYNormalCellHeight);
        
        [self addBottomLine];
        [self.bottomLineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_left);
            make.right.bottom.mas_equalTo(0);
            make.height.mas_equalTo(XYLineHeight);
        }];
        
        self.leftImageName = @"";
        self.titleString = @"";
        self.detailString = @"";
        self.showIndicate = YES;
        self.showLine = YES;
        self.showFlag = NO;
        
    }
    return self;
}
- (UIImageView *)leftImageView{
    if (!_leftImageView) {
        _leftImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XYCommonLeftMargin);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeZero);
        }];
    }
    return _leftImageView;
}


- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 0;
        _titleLabel.textColor = [XYThemeColor blackLevelOneColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftImageView.mas_right).offset(15);
            make.centerY.mas_equalTo(self.contentView);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(TitleMaxWidth);
        }];
    }
    return _titleLabel;
}

- (UIImageView *)indicateImageView{
    if (!_indicateImageView) {
        _indicateImageView = [[UIImageView alloc] initWithImage:nil];
        [_indicateImageView sizeToFit];
        [self.contentView addSubview:_indicateImageView];
        [_indicateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-XYCommonLeftMargin);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(self.indicateImageView.size);
        }];

    }
    return _indicateImageView;
}

- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textAlignment = NSTextAlignmentRight;
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textColor = [XYThemeColor blackLevelThreeColor];
        _detailLabel.numberOfLines = 0;
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(XYCommonLeftMargin);
            make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(-10);
            make.centerY.mas_equalTo(self.contentView);
            make.height.mas_equalTo(20);
        }];
    }
    return _detailLabel;
}

- (UILabel *)flagLabel{
    if (!_flagLabel) {
        _flagLabel = [[UILabel alloc]init];
        _flagLabel.backgroundColor = [XYThemeColor redColor];
        [_flagLabel addCornerWithCornerRadius:5.f];
        [self.contentView addSubview:_flagLabel];
        [_flagLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-XYCommonLeftMargin);
            make.centerY.mas_equalTo(self.contentView);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    return _flagLabel;
}

- (void)setLeftImageName:(NSString *)leftImageName{
    _leftImageName = leftImageName;
    self.leftImageView.image = [UIImage imageNamed:leftImageName];
    [self.leftImageView sizeToFit];
    [self.leftImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.leftImageView.size);
    }];
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    self.titleLabel.text = _titleString;
    
    CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(TitleMaxWidth, MAXFLOAT)];
    CGSize selfSize = self.size;
    if ((size.height+2*TitleTopBottomHeight)>selfSize.height) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, (size.height+2*TitleTopBottomHeight));
    }
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
        make.height.mas_equalTo(size.height);
    }];
}

- (void)setTitleAttributedString:(NSAttributedString *)titleAttributedString{
    _titleAttributedString = titleAttributedString;
    self.titleLabel.attributedText = _titleAttributedString;
}

- (void)setDetailString:(NSString *)detailString {
    _detailString = detailString;
    self.detailLabel.text = _detailString;
    
    CGSize size = [self.detailLabel sizeThatFits:CGSizeMake(TitleMaxWidth, MAXFLOAT)];
    CGSize selfSize = self.size;
    if ((size.height+2*TitleTopBottomHeight)>selfSize.height) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, (size.height+2*TitleTopBottomHeight));
    }
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(size.height);
    }];
}

- (void)setDetailAttributedString:(NSAttributedString *)detailAttributedString{
    _detailAttributedString = detailAttributedString;
    self.detailLabel.attributedText = _detailAttributedString;
}

- (void)setShowIndicate:(BOOL)showIndicate {
    _showIndicate = showIndicate;
    self.indicateImageView.hidden = !_showIndicate;
    [self.indicateImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.showIndicate ? self.indicateImageView.image.size:CGSizeZero);
    }];
    
    [_detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(XYCommonLeftMargin);
        make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(self.showIndicate ? -10:0);
        make.centerY.mas_equalTo(self.contentView);
        make.height.mas_equalTo([self.detailLabel labelHeight]);
    }];
}

- (void)setShowLine:(BOOL)showLine{
    _showLine = showLine;
    self.bottomLineView.hidden = !_showLine;
}

- (void)setShowFlag:(BOOL)showFlag{
    _showFlag = showFlag;
    self.flagLabel.hidden = !_showFlag;
    [_flagLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(self.showIndicate ? -10:0);
        make.centerY.mas_equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(10, 10));
    }];
    if (_showFlag) {
        [_detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(XYCommonLeftMargin);
            make.right.mas_equalTo(self.flagLabel.mas_left).with.offset(-8);
            make.centerY.mas_equalTo(self.contentView);
            make.height.mas_equalTo([self.detailLabel labelHeight]);
        }];
    }else{
        [_detailLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(XYCommonLeftMargin);
            make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(self.showIndicate ? -10:0);
            make.centerY.mas_equalTo(self.contentView);
            make.height.mas_equalTo([self.detailLabel labelHeight]);
        }];
    }
    
}

- (void)setDetailTextColor:(UIColor *)detailTextColor andtextAlignment:(NSTextAlignment)textAlignment{
    self.detailLabel.textColor = detailTextColor;
    self.detailLabel.textAlignment = textAlignment;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor andtextAlignment:(NSTextAlignment)textAlignment{
    self.titleLabel.textColor = titleTextColor;
    self.titleLabel.textAlignment = textAlignment;
}


- (void)setTitleFont:(UIFont *)titleTextFont{
    self.titleLabel.font = titleTextFont;
}
- (void)setDetailFont:(UIFont *)detailTextFont{
    self.detailLabel.font = detailTextFont;
}

@end
