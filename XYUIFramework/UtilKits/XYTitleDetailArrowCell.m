//
//  XYTitleDetailArrowCell.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTitleDetailArrowCell.h"
#import "XYAutoLayout.h"
#import <Masonry/Masonry.h>
#import "XYThemeColor.h"
#import "XYThemeFont.h"
#import "UIView+XYFrame.h"

@interface XYTitleDetailArrowCell ()

@end

@implementation XYTitleDetailArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 45);
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textColor = [XYThemeColor blackLevelOneColor];
        self.titleLabel.font = KThemeNormalFont(16);
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(XYCommonLeftMargin);
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(SCREEN_WIDTH/2-30);
        }];
        
        self.indicateImageView = [[UIImageView alloc] initWithImage:nil];
        [self.indicateImageView sizeToFit];
        [self.contentView addSubview:self.indicateImageView];
        [self.indicateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-XYCommonLeftMargin);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.indicateImageView.size);
        }];

        self.detailLabel = [[UILabel alloc] init];
        self.detailLabel.textAlignment = NSTextAlignmentRight;
        self.detailLabel.font = KThemeNormalFont(14);
        self.detailLabel.textColor = [XYThemeColor blackLevelThreeColor];
        self.detailLabel.numberOfLines = 0;
        [self.contentView addSubview:self.detailLabel];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleLabel.mas_right).with.offset(XYCommonLeftMargin);
            make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(-10);
            make.centerY.mas_equalTo(self.titleLabel);
            make.height.mas_equalTo(20);
        }];
    }
    
    return self;
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    _titleLabel.text = _titleString;
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.titleLabel sizeThatFits:CGSizeMake(SCREEN_WIDTH/2-30, MAXFLOAT)].width);
    }];
}

- (void)setDetailString:(NSString *)detailString {
    _detailString = detailString;
    _detailLabel.text = _detailString;
}

- (void)setShowIndicate:(BOOL)showIndicate {
    _showIndicate = showIndicate;
    self.indicateImageView.hidden = !_showIndicate;
    [self.indicateImageView sizeToFit];
    [self.indicateImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.showIndicate ? self.indicateImageView.size:CGSizeZero);
    }];
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.indicateImageView.mas_left).with.offset(self.showIndicate ? -10:0);
    }];
}

- (void)setDetailTextColor:(UIColor *)detailTextColor andtextAlignment:(NSTextAlignment)textAlignment{
    _detailLabel.textColor = detailTextColor;
    _detailLabel.textAlignment = textAlignment;
}

- (void)setTitleTextColor:(UIColor *)titleTextColor andtextAlignment:(NSTextAlignment)textAlignment{
    _titleLabel.textColor = titleTextColor;
    _titleLabel.textAlignment = textAlignment;
}

@end
