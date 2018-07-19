//
//  XYViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYTabBarViewController.h"
#import "UIViewController+XYNavigationBarItem.h"
#import "UINavigationController+FDFullscreenPopGesture.h"

@class XYTabBarViewController;

@interface XYViewController : UIViewController{
    BOOL _showLargeTitle;
}
@property (nonatomic, strong) XYNavigationBar *navigationBar;

@property(nonatomic, assign)BOOL showLargeTitle;
@property(nonatomic, assign)CGFloat largeTitleHeight;

- (void) backAction;

@property (nonatomic, assign) BOOL logoutToLoginVC;
@property (nonatomic, assign) BOOL navigationBarHidden;

@property (nonatomic, strong) UIImage *backgroundImage;


- (void)layout;

@property (nonatomic, assign) SEL loginPostAction;
@property (nonatomic, assign) SEL logoutPostAction;


- (void)hideBackBarButton;
- (void)setNavigationTitle:(NSString*)title;

- (void)rightBarButtonClick;

- (void)setLeftBarButtonWithTitle:(NSString*)title completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;
- (void)setLeftBarButtonWithImage:(id)image actioinBlock:(void (^)(XYImageTitleButton *button))actionBlock;

- (void)setRightBarButtonWithTitle:(NSString*)title;
- (void)setRightBarButtonWithTitle:(NSString*)title color:(UIColor*)color;
- (void)setRightBarButtonWithTitle:(NSString*)title actioinBlock:(void(^)(XYImageTitleButton *button))actionBlock;

- (void)setRightBarButtonWithImage:(id)image;
- (void)setRightBarButtonWithImage:(id)image actioinBlock:(void(^)(XYImageTitleButton *button))actionBlock;

- (void)pushViewController:(UIViewController *)viewController;
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)popViewController;
- (void)popViewControllerAnimated:(BOOL)animated;

- (void)popToViewController:(UIViewController *)viewController;
- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated;

- (void)popToViewControllerWithClass:(Class)vcClass;
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated;

- (void)popToRootViewController;
- (void)popToRootViewControllerAnimated:(BOOL)animated;
- (void)popToRootViewControllerAtIndex:(NSInteger)index;


@end
