//
//  UIView+XYLine.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIView+XYLine.h"
#import <objc/runtime.h>
#import "XYThemeColor.h"
#import <Masonry.h>
#import "XYAutoLayout.h"

@implementation UIView (XYLine)

- (void)addLeftLine{
    [self addLeftLineWithLeft:0 topBottom:0 color:[XYThemeColor lineColor]];
}
- (void)addLeftLineWithColor:(UIColor *)color{
    [self addLeftLineWithLeft:0 topBottom:0 color:color];
}
- (void)addLeftLineWithLeft:(float)left{
    [self addLeftLineWithLeft:left topBottom:0 color:[XYThemeColor lineColor]];
}
- (void)addLeftLineWithLeft:(float)left color:(UIColor *)color{
    [self addLeftLineWithLeft:left topBottom:0 color:color];
}
- (void)addLeftLineWithLeft:(float)left topBottom:(float)topBottom{
    [self addLeftLineWithLeft:left topBottom:topBottom color:[XYThemeColor lineColor]];
}
- (void)addLeftLineWithLeft:(float)left topBottom:(float)topBottom color:(UIColor *)color{
    if(self && [self isKindOfClass:UIView.class]){
        if (!self.leftLineView) {
            self.leftLineView = [[UIView alloc] init];
            [self addSubview:self.leftLineView];
        }
        self.leftLineView.backgroundColor = color;
        [self.leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineHeight);
            make.bottom.mas_equalTo(-topBottom);
            make.top.mas_equalTo(topBottom);
            make.left.mas_equalTo(left);
        }];
    }
}

- (void)addRightLine{
    [self addRightLineWithRight:0 topBottom:0 color:[XYThemeColor lineColor]];
}
- (void)addRightLineWithColor:(UIColor *)color{
    [self addRightLineWithRight:0 topBottom:0 color:color];
}
- (void)addRightLineWithRight:(float)right{
    [self addRightLineWithRight:right topBottom:0 color:[XYThemeColor lineColor]];
}
- (void)addRightLineWithRight:(float)right color:(UIColor *)color{
    [self addRightLineWithRight:right topBottom:0 color:color];
}
- (void)addRightLineWithRight:(float)right topBottom:(float)topBottom{
    [self addRightLineWithRight:right topBottom:topBottom color:[XYThemeColor lineColor]];
}
- (void)addRightLineWithRight:(float)right topBottom:(float)topBottom color:(UIColor *)color{
    if(self && ![self isKindOfClass:UITableView.class]){
        if (!self.rightLineView) {
            self.rightLineView = [[UIView alloc] init];
            [self addSubview:self.rightLineView];
        }
        self.rightLineView.backgroundColor = color;
        [self.rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineHeight);
            make.bottom.mas_equalTo(-topBottom);
            make.top.mas_equalTo(topBottom);
            make.right.mas_equalTo(right);
        }];
    }
}

- (void)addTopLine{
    [self addTopLineWithTop:0 leftRight:0 color:[XYThemeColor lineColor]];
}
- (void)addTopLineWithColor:(UIColor *)color{
    [self addTopLineWithTop:0 leftRight:0 color:color];
}
- (void)addTopLineWithTop:(float)top{
    [self addTopLineWithTop:top leftRight:0 color:[XYThemeColor lineColor]];
}
- (void)addTopLineWithTop:(float)top color:(UIColor *)color{
    [self addTopLineWithTop:top leftRight:0 color:color];
}
- (void)addTopLineWithTop:(float)top leftRight:(float)leftRight{
    [self addTopLineWithTop:top leftRight:leftRight color:[XYThemeColor lineColor]];
}
- (void)addTopLineWithTop:(float)top leftRight:(float)leftRight color:(UIColor *)color{
    if(self && [self isKindOfClass:UIView.class]){
        if (!self.topLineView) {
            self.topLineView = [[UIView alloc] init];
            [self addSubview:self.topLineView];
        }
        self.topLineView.backgroundColor = color;
        [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LineHeight);
            make.left.mas_equalTo(leftRight);
            make.right.mas_equalTo(-leftRight);
            make.top.mas_equalTo(top);
        }];
    }
    
}
- (void)addBottomLine{
    [self addBottomLineWithBottom:0 leftRight:0 color:[XYThemeColor lineColor]];
}
- (void)addBottomLineWithlineHeight:(CGFloat)lineHeight{
    [self addBottomLineWithBottom:0 leftRight:0 color:[XYThemeColor lineColor] lineHeight:lineHeight];
}

- (void)addBottomLineWithColor:(UIColor *)color{
    [self addBottomLineWithBottom:0 leftRight:0 color:color];
}
- (void)addBottomLineWithColor:(UIColor *)color lineHeight:(CGFloat)lineHeight{
    [self addBottomLineWithBottom:0 leftRight:0 color:color lineHeight:lineHeight];
}

- (void)addBottomLineWithBottom:(float)bottom{
    [self addBottomLineWithBottom:bottom leftRight:0 color:[XYThemeColor lineColor]];
}
- (void)addBottomLineWithBottom:(float)bottom lineHeight:(CGFloat)lineHeight{
    [self addBottomLineWithBottom:bottom leftRight:0 color:[XYThemeColor lineColor] lineHeight:lineHeight];
}
- (void)addBottomLineWithBottom:(float)bottom color:(UIColor *)color{
    [self addBottomLineWithBottom:bottom leftRight:0 color:color];
}
- (void)addBottomLineWithBottom:(float)bottom color:(UIColor *)color lineHeight:(CGFloat)lineHeight{
    [self addBottomLineWithBottom:bottom leftRight:0 color:color lineHeight:lineHeight];
}
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight{
    [self addBottomLineWithBottom:bottom leftRight:leftRight color:[XYThemeColor lineColor]];
}
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight lineHeight:(CGFloat)lineHeight{
    [self addBottomLineWithBottom:bottom leftRight:leftRight color:[XYThemeColor lineColor] lineHeight:lineHeight];
}

- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight color:(UIColor *)color{
    [self addBottomLineWithBottom:bottom leftRight:leftRight color:color lineHeight:LineHeight];
}
- (void)addBottomLineWithBottom:(float)bottom leftRight:(float)leftRight color:(UIColor *)color lineHeight:(CGFloat)lineHeight{
    if(self && [self isKindOfClass:UIView.class]){
        if (!self.bottomLineView) {
            self.bottomLineView = [[UIView alloc] init];
            [self addSubview:self.bottomLineView];
        }
        self.bottomLineView.backgroundColor = color;
        [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(lineHeight);
            make.left.mas_equalTo(leftRight);
            make.right.mas_equalTo(-leftRight);
            make.bottom.mas_equalTo(bottom);
        }];
    }
    
}

- (void)addCenterXLine{
    [self addCenterXLineWithLeftRight:0 color:[XYThemeColor lineColor]];
}
- (void)addCenterXLineWithLeftRight:(float)leftRight{
    [self addCenterXLineWithLeftRight:leftRight color:[XYThemeColor lineColor]];
    
}
- (void)addCenterXLineWithLeftRight:(float)leftRight color:(UIColor *)color{
    if(self && [self isKindOfClass:UIView.class]){
        if (!self.centerXLineView) {
            self.centerXLineView = [[UIView alloc] init];
            [self addSubview:self.centerXLineView];
        }
        self.centerXLineView.backgroundColor = color;
        [self.centerXLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(LineHeight);
            make.left.mas_equalTo(leftRight);
            make.right.mas_equalTo(-leftRight);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
}


- (void)addCenterYLine{
    [self addCenterYLineWithTopBottom:0 color:[XYThemeColor lineColor]];
}
- (void)addCenterYLineWithTopBottom:(float)topBottom{
    
    [self addCenterYLineWithTopBottom:topBottom color:[XYThemeColor lineColor]];
}
- (void)addCenterYLineWithTop:(float)top bottom:(float)bottom{
    [self addCenterYLineWithTop:top bottom:bottom color:[XYThemeColor lineColor]];
}
- (void)addCenterYLineWithTopBottom:(float)topBottom color:(UIColor *)color{
    [self addCenterYLineWithTop:topBottom bottom:topBottom color:[XYThemeColor lineColor]];
}
- (void)addCenterYLineWithTop:(float)top bottom:(float)bottom color:(UIColor *)color{
    if(self && [self isKindOfClass:UIView.class]){
        if (!self.centerYLineView) {
            self.centerYLineView = [[UIView alloc] init];
            [self addSubview:self.centerYLineView];
        }
        self.centerYLineView.backgroundColor = color;
        [self.centerYLineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(LineHeight);
            make.top.mas_equalTo(top);
            make.bottom.mas_equalTo(-bottom);
            make.centerX.mas_equalTo(self.mas_centerX);
        }];
    }
}



- (void)setLeftLineView:(UIView *)leftLineView {
    objc_setAssociatedObject(self, @selector(leftLineView), leftLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)leftLineView {
    return objc_getAssociatedObject(self, @selector(leftLineView));
}

- (void)setRightLineView:(UIView *)rightLineView {
    objc_setAssociatedObject(self, @selector(rightLineView), rightLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)rightLineView {
    return objc_getAssociatedObject(self, @selector(rightLineView));
}


- (void)setTopLineView:(UIView *)topLineView {
    objc_setAssociatedObject(self, @selector(topLineView), topLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)topLineView {
    return objc_getAssociatedObject(self, @selector(topLineView));
}

- (void)setBottomLineView:(UIView *)bottomLineView{
    objc_setAssociatedObject(self, @selector(bottomLineView), bottomLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)bottomLineView{
    return objc_getAssociatedObject(self, @selector(bottomLineView));
}

- (void)setCenterXLineView:(UIView *)centerXLineView{
    objc_setAssociatedObject(self, @selector(centerXLineView), centerXLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)centerXLineView{
    return objc_getAssociatedObject(self, @selector(centerXLineView));
}

- (void)setCenterYLineView:(UIView *)centerYLineView{
    objc_setAssociatedObject(self, @selector(centerYLineView), centerYLineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)centerYLineView{
    return objc_getAssociatedObject(self, @selector(centerYLineView));
}


@end
