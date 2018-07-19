//
//  UINavigationController+XYNavigation.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UINavigationController+XYNavigation.h"

@implementation UINavigationController (XYNavigation)
- (UIViewController *)getViewControllerWithClass:(Class)vcClass{
    for(UIViewController *vc in self.viewControllers){
        if([vc isKindOfClass:vcClass]){
            return vc;
        }
    }
    return nil;
}

- (void)popToViewControllerWithClass:(Class)vcClass{
    UIViewController *vc = [self getViewControllerWithClass:vcClass];
    if(vc){
        [self popToViewController:vc animated:YES];
    }else{
        [self popViewControllerAnimated:YES];
    }
}

- (void)deleteMiddleViewController{
    if (self.viewControllers.count > 2) {
        self.viewControllers = [NSArray arrayWithObjects:[self.viewControllers firstObject],[self.viewControllers lastObject], nil];
    }
}

- (void)deletePreviousViewController{
    NSMutableArray *vcs = [NSMutableArray arrayWithArray:self.viewControllers];
    if (vcs.count > 2) {
        [vcs removeObjectAtIndex:vcs.count-2];
        self.viewControllers = vcs;
    }
}

- (void)deleteLastViewControllerWithClass:(Class)clazz{
    if (!clazz) {
        return;
    }
    NSMutableArray *allVcList = [NSMutableArray arrayWithArray:self.viewControllers];
    [self.viewControllers enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:clazz]) {
            [allVcList removeObject:obj];
            self.viewControllers = allVcList;
            *stop = YES;
        }
    }];
}

- (BOOL)existViewControllerWithClass:(Class)clazz{
    if (!clazz) {
        return NO;
    }
    for(UIViewController *vc in self.viewControllers){
        if ([vc isKindOfClass:clazz]) {
            return YES;
        }
    }
    return NO;
}

/**
 *  获取当前正在显示的UINavigationController
 */
+ (UINavigationController *)getDisplayingNavigationController{
    UIViewController *topVc = [self getDisplayingViewController];
    if ([topVc isKindOfClass:[UINavigationController class]]) {
        return (UINavigationController*)topVc;
    }
    if (topVc) {
        return topVc.navigationController;
    }
    return nil;
}

+ (UIViewController *)getDisplayingViewController{
    return [self getDisplayingViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

+ (UIViewController *)getDisplayingViewControllerWithRootViewController:(UIViewController *)rootViewController{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self getDisplayingViewControllerWithRootViewController:tabBarController.selectedViewController];
        
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self getDisplayingViewControllerWithRootViewController:navigationController.visibleViewController];
        
    } else if (rootViewController.presentedViewController) {
        
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self getDisplayingViewControllerWithRootViewController:presentedViewController];
        
    } else {
        return rootViewController;
    }
}
@end
