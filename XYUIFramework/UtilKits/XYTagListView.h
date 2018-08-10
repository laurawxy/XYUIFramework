//
//  XYTagListView.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/30.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYMacroConfig.h"
#import "XYCommonDefine.h"
#import "XYButton.h"

@class XYTagModel;

@interface XYTagListView : UIView

@property (nonatomic, assign) BOOL showAddButton;
@property (nonatomic, assign) CGFloat minWidth;

@property (nonatomic, assign) CGSize fittedSize;

@property (nonatomic, assign) CGFloat horizontalPadding;
@property (nonatomic, assign) CGFloat verticalPadding;
@property (nonatomic, assign) CGFloat bottomMargin;
@property (nonatomic, assign) CGFloat labelMargin;


@property (nonatomic, strong) UIColor *normalTextColor;
@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *normalBorderColor;

@property (nonatomic, assign) CGFloat cornerRadious;

@property (nonatomic, strong) UIFont *textFont;

@property (nonatomic, assign) BOOL canClick;

@property (nonatomic, strong) UIColor *selectedBackgroundColor;
@property (nonatomic, strong) UIColor *selectedTextColor;

@property (nonatomic, strong) NSMutableArray<XYTagModel *> *tags;

@property (nonatomic, copy) VoidBlock addTagBlock;

@property(nonatomic, copy)void(^tagClickBlock)(NSInteger tag,XYButton *button);

- (void)display;

@end

@interface XYTagModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *tagId;
@property (nonatomic, assign) BOOL selected;
@end
