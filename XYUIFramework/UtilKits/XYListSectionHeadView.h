//
//  XYListSectionHeadView.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYCommonDefine.h"

@interface XYListSectionHeadView : UIView
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) UIFont *titleFont;
@property (nonatomic,strong) UIColor *titleColor;

@property (nonatomic,assign) BOOL showRightButton;
@property (nonatomic,copy) NSString *rightButtonTitle;
@property (nonatomic,strong) UIImage *rightButtonImage;
@property (nonatomic,strong) UIFont *rightButtonFont;
@property (nonatomic,strong) UIColor *rightButtonColor;

@property (nonatomic,assign) CGFloat topMargin;
@property (nonatomic,assign) BOOL showLeftView;

@property (nonatomic) VoidBlock clickAction;

@end
