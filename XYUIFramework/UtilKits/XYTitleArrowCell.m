//
//  XYTitleArrowCell.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTitleArrowCell.h"
#import "XYThemeFont.h"
#import "XYThemeColor.h"
#import <Masonry/Masonry.h>
#import "XYAutoLayout.h"
#import "UIView+XYFrame.h"

@implementation XYTitleArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textColor = [XYThemeColor blackLevelOneColor];
        self.titleLabel.font = KThemeNormalFont(16);
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(KCommonLeftMargin);
            make.centerY.mas_equalTo(self);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(SCREEN_WIDTH/2-30);
        }];
        
        self.indicateImageView = [[UIImageView alloc] initWithImage:nil];
        [self.indicateImageView sizeToFit];
        [self.contentView addSubview:self.indicateImageView];
        [self.indicateImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-KCommonLeftMargin);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.indicateImageView.size);
        }];
        
    }
    return self;
}

- (void)setTitleString:(NSString *)titleString {
    _titleString = titleString;
    _titleLabel.text = _titleString;
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo([self.titleLabel sizeThatFits:CGSizeMake(SCREEN_WIDTH-4*KCommonLeftMargin, MAXFLOAT)].width);
    }];
}

- (void)setTitleTextColor:(UIColor *)titleTextColor andtextAlignment:(NSTextAlignment)textAlignment{
    _titleLabel.textColor = titleTextColor;
    _titleLabel.textAlignment = textAlignment;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
