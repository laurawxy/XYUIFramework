//
//  XYTitleDetailArrowCell.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "XYCommonDefine.h"

@interface XYTitleDetailArrowCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *detailString;

@property (nonatomic, strong) UIImageView *indicateImageView;
@property (nonatomic, assign) BOOL showIndicate;

@property (nonatomic) VoidBlock detailClickBlock;

- (void)setTitleTextColor:(UIColor *)titleTextColor andtextAlignment:(NSTextAlignment)textAlignment;
- (void)setDetailTextColor:(UIColor *)detailTextColor andtextAlignment:(NSTextAlignment)textAlignment;

@end
