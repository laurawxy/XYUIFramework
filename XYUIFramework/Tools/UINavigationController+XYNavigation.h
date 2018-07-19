//
//  UINavigationController+XYNavigation.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (XYNavigation)
/**
 *  导航控制器中pop到特定类名的UIViewController
 *
 *  @param vcClass 类名
 */
- (void)popToViewControllerWithClass:(Class)vcClass;

/**
 *  删除导航控制器中第一个和最后一个中间所有的UIViewController
 */
- (void)deleteMiddleViewController;

/**
 *  删除导航控制器中前一个UIViewController
 */
- (void)deletePreviousViewController;

/**
 *  删除导航控制器中指定类名的UIViewController
 *
 *  @param clazz 类名
 */
- (void)deleteLastViewControllerWithClass:(Class)clazz;

/**
 *  控制器栈中是否有指定类名的实例
 *
 *  @param clazz 类名
 *
 *  @return 结果
 */
- (BOOL)existViewControllerWithClass:(Class)clazz;

/**
 *  获取正在显示的UINavigationController
 */
+ (UINavigationController *)getDisplayingNavigationController;

/**
 *  获取正在显示的UIViewController
 */
+ (UIViewController *)getDisplayingViewController;

- (UIViewController *)getViewControllerWithClass:(Class)vcClass;

+ (UIViewController *)getDisplayingViewControllerWithRootViewController:(UIViewController *)rootViewController;

@end
