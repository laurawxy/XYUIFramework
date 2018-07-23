//
//  XYImageTitleDetailArrowCell.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface XYImageTitleDetailArrowCell : UITableViewCell
/**
 图片
 */
@property(nonatomic,strong)NSString *leftImageName;

/**
 内容
 */
@property(nonatomic,strong)NSString *titleString;
@property(nonatomic,strong)NSAttributedString *titleAttributedString;

/**
 详细内容
 */
@property(nonatomic,strong)NSString *detailString;
@property(nonatomic,strong)NSAttributedString *detailAttributedString;

/**
 箭头
 */
@property(nonatomic,assign)BOOL showIndicate;

/**
 小红点
 */
@property(nonatomic,assign)BOOL showFlag;

/**
 线
 */
@property(nonatomic,assign)BOOL showLine;

- (void)setTitleTextColor:(UIColor *)titleTextColor andtextAlignment:(NSTextAlignment)textAlignment;
- (void)setDetailTextColor:(UIColor *)detailTextColor andtextAlignment:(NSTextAlignment)textAlignment;
- (void)setTitleFont:(UIFont *)titleTextFont;
- (void)setDetailFont:(UIFont *)detailTextFont;
@end
