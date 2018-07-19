//
//  XYUIApperanceConfig.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/19.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYUIApperanceConfig.h"
#import "XYThemeColor.h"
#import "XYThemeFont.h"
#import "XYThemeImage.h"

@implementation XYUIApperanceConfig


static NSArray <NSString *> *_tabBarTitles;
+ (NSArray <NSString *> *)tabBarTitles{
    if (!_tabBarTitles) {
        _tabBarTitles = @[@"首页",@"我的"];
    }
    return _tabBarTitles;
}
+ (void)xy_setTabBarTitles:(NSArray <NSString *> *)tabBarTitles{
    _tabBarTitles = tabBarTitles;
}


static NSArray <UIImage *> *_tabBarNormalImages;
+ (NSArray <UIImage *> *)tabBarNormalImages{
    if (!_tabBarNormalImages) {
        _tabBarNormalImages = @[[XYThemeImage icon_tabbar_home_default],[XYThemeImage icon_tabbar_my_default]];
    }
    return _tabBarNormalImages;
}
+ (void)xy_setTabBarNormalImages:(NSArray<UIImage *> *)tabBarNormalImages{
    _tabBarNormalImages = tabBarNormalImages;
}

static NSArray <UIImage *> *_tabBarSelectedImages;
+ (NSArray <UIImage *> *)tabBarSelectedImages{
    if (!_tabBarSelectedImages) {
        _tabBarSelectedImages = @[[XYThemeImage icon_tabbar_home_selected],[XYThemeImage icon_tabbar_my_Selected]];
    }
    return _tabBarSelectedImages;
}
+ (void)xy_setTabBarSelectedImages:(NSArray<UIImage *> *)tabBarSelectedImages{
    _tabBarSelectedImages = tabBarSelectedImages;
}


static NSArray <UIViewController *> *_tabBarViewControllers;
+ (NSArray <UIViewController *> *)tabBarViewControllers{
    if (!_tabBarViewControllers) {
        _tabBarViewControllers = @[[UIViewController new],[UIViewController new]];
    }
    return _tabBarViewControllers;
}
+ (void)xy_setTabBarViewControllers:(NSArray <UIViewController *> *)tabBarViewControllers{
    _tabBarViewControllers = tabBarViewControllers;
}



static BOOL _navigationBottomLineHide;
+ (BOOL)navigationBottomLineHide{
    return _navigationBottomLineHide;
}
+ (void)xy_setNavigationBottomLineHide:(BOOL)navigationBottomLineHide{
    _navigationBottomLineHide = navigationBottomLineHide;
}




@end
