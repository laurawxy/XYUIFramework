//
//  XYHorizontalScrollViewItem.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, XYHorizontalScrollViewItemType) {
    XYHorizontalScrollViewItemDefaultType,
    XYHorizontalScrollViewItemTextType,
    XYHorizontalScrollViewItemImageType
};

@interface XYHorizontalScrollViewItem : UIView
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *reuseIdentifer;
@property (nonatomic, assign) BOOL isSelected;

/**
 *  初始化可重用的item
 *
 *  @param type            BaseType、TextType、ImageType
 *  @param reuseIdentifier 重用标识符
 *
 *  @return MinScrollMenuItem实例
 */
- (instancetype)initWithType:(XYHorizontalScrollViewItemType)type reuseIdentifier:(NSString *)reuseIdentifier;

@end
