//
//  UIView+XYLine.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYLine)

@property (nonatomic,strong) UIView *leftLineView;
@property (nonatomic,strong) UIView *rightLineView;
@property (nonatomic,strong) UIView *topLineView;
@property (nonatomic,strong) UIView *bottomLineView;
@property (nonatomic,strong) UIView *centerXLineView;
@property (nonatomic,strong) UIView *centerYLineView;


- (void)addLeftLine;
- (void)addLeftLineWithColor:(UIColor *)color;
- (void)addLeftLineWithLeft:(float)left;
- (void)addLeftLineWithLeft:(float)left color:(UIColor *)color;
- (void)addLeftLineWithLeft:(float)left topBottom:(float)topBottom;
- (void)addLeftLineWithLeft:(float)left topBottom:(float)topBottom color:(UIColor *)color;


- (void)addRightLine;
- (void)addRightLineWithColor:(UIColor *)color;
- (void)addRightLineWithRight:(float)right;
- (void)addRightLineWithRight:(float)right color:(UIColor *)color;
- (void)addRightLineWithRight:(float)right topBottom:(float)topBottom;
- (void)addRightLineWithRight:(float)right topBottom:(float)topBottom color:(UIColor *)color;


- (void)addTopLine;
- (void)addTopLineWithColor:(UIColor *)color;
- (void)addTopLineWithTop:(float)top;
- (void)addTopLineWithTop:(float)top color:(UIColor *)color;
- (void)addTopLineWithTop:(float)top leftRight:(float)leftRight;
- (void)addTopLineWithTop:(float)top leftRight:(float)leftRight color:(UIColor *)color;


- (void)addBottomLine;
- (void)addBottomLineWithlineHeight:(CGFloat)lineHeight;
- (void)addBottomLineWithColor:(UIColor *)color;
- (void)addBottomLineWithColor:(UIColor *)color lineHeight:(CGFloat)lineHeight;
- (void)addBottomLineWithBottom:(float)bottom;
- (void)addBottomLineWithBottom:(float)bottom lineHeight:(CGFloat)lineHeight;
- (void)addBottomLineWithBottom:(float)bottom color:(UIColor *)color;
- (void)addBottomLineWithBottom:(float)bottom color:(UIColor *)color lineHeight:(CGFloat)lineHeight;
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight;
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight lineHeight:(CGFloat)lineHeight;
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight color:(UIColor *)color;
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight color:(UIColor *)color lineHeight:(CGFloat)lineHeight;

- (void)addCenterXLine;
- (void)addCenterXLineWithLeftRight:(float)leftRight;
- (void)addCenterXLineWithLeftRight:(float)leftRight color:(UIColor *)color;

- (void)addCenterYLine;
- (void)addCenterYLineWithTopBottom:(float)topBottom;
- (void)addCenterYLineWithTop:(float)top bottom:(float)bottom;
- (void)addCenterYLineWithTopBottom:(float)topBottom color:(UIColor *)color;
- (void)addCenterYLineWithTop:(float)top bottom:(float)bottom color:(UIColor *)color;


@end
