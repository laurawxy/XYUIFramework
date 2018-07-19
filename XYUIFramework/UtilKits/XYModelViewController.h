//
//  XYModelViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

//弹窗优先级
typedef NS_ENUM(NSInteger, ShowWindowLevel) {
    ShowWindowLevelAlert = 11,
    ShowWindowLevelServiceUpdate = 10,
    ShowWindowLevelAppUpdate = 9,
    ShowWindowLevelRegisterRed = 8,
    ShowWindowLevelActivity = 7,
};


@interface XYModelViewController : UIViewController{
    UIView *_animateView;
}
@property (nonatomic, strong) UIView *animateView;
@property (nonatomic, assign) ShowWindowLevel windowLevel;

@end
