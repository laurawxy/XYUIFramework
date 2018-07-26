//
//  XYPageControl.h
//  XYUIFrameworkDemo
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPageControl : UIControl
@property (nonatomic, strong) UIScrollView * scrollView;

@property (nonatomic, assign) NSInteger numberOfPages;
@property (nonatomic, strong) UIColor * pageIndicatorColor;
@property (nonatomic, strong) UIColor * currentPageIndicatorColor;
@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) CGFloat indicatorMargin;
@property (nonatomic, assign) CGFloat indicatorWidth;
@property (nonatomic, assign) CGFloat currentIndicatorWidth;
@property (nonatomic, assign) CGFloat indicatorHeight;

- (instancetype)initWithFrame:(CGRect)frame indicatorMargin:(CGFloat)margin indicatorWidth:(CGFloat)indicatorWidth currentIndicatorWidth:(CGFloat)currentIndicatorWidth indicatorHeight:(CGFloat)indicatorHeight;
@end
