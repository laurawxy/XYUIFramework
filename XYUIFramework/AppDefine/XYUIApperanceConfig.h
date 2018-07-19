//
//  XYUIApperanceConfig.h
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/19.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XYUIApperanceConfig : NSObject


/**
 tabbar titles

 @return titles
 */
+ (NSArray <NSString *> *)tabBarTitles;
+ (void)xy_setTabBarTitles:(NSArray <NSString *> *)tabBarTitles;


/**
 tabbar 未选中images

 @return images
 */
+ (NSArray <UIImage *> *)tabBarNormalImages;
+ (void)xy_setTabBarNormalImages:(NSArray <UIImage *> *)tabBarNormalImages;


/**
 tabbar 选中images
 
 @return images
 */
+ (NSArray <UIImage *> *)tabBarSelectedImages;
+ (void)xy_setTabBarSelectedImages:(NSArray <UIImage *> *)tabBarSelectedImages;


/**
 tabbar viewcontrollers

 @return viewcontrollers
 */
+ (NSArray <UIViewController *> *)tabBarViewControllers;
+ (void)xy_setTabBarViewControllers:(NSArray <UIViewController *> *)tabBarViewControllers;



/**
 navigation 底部线条是否隐藏

 @return bool
 */
+ (BOOL)navigationBottomLineHide;
+ (void)xy_setNavigationBottomLineHide:(BOOL)navigationBottomLineHide;





@end
