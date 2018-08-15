//
//  XYViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYViewController.h"
#import "XYTableViewController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "UIView+XYLine.h"
#import "XYMacroConfig.h"
#import "XYThemeImage.h"
#import "XYAutoLayout.h"
#import "UIView+XYFrame.h"

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void) viewDidLoad
{
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    
    self.navigationItem.title = @"";
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    
    self.view.backgroundColor = [UIColor whiteColor];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    if ([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.navigationItem.hidesBackButton = YES;
    _navigationBar = [[XYNavigationBar alloc] init];
    _navigationBar.hideBigTitle = YES;
    _navigationBar.bottomLineView.hidden = YES;
    [self.view addSubview:_navigationBar];
    
    WeakSelf
    if (self.navigationController.viewControllers.count>1) {
        [self addBackBarButtonWithActionBlock:^(UIBarButtonItem *barButtonItem, UIButton *button) {
            [weakSelf backAction];
        }];
        [_navigationBar addLeftButtonWithImage:[XYViewController backImage] completionBlock:^(XYButton * _Nonnull button) {
            [weakSelf backAction];
        }];
    }
    self.showLargeTitle = NO;
    self.largeTitleHeight = 76;
    
}

static UIImage * _backImage;
+ (UIImage *)backImage{
    if (!_backImage) {
        _backImage = [XYThemeImage icon_navi_back];
    }
    return _backImage;
}
+ (void)xy_setBackImage:(UIImage *)backImage{
    _backImage = backImage;
}

//-----设置登录、登出 通知
-(void)setLogoutPostAction:(SEL)logoutPostAction
{
    _logoutPostAction = logoutPostAction;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:_logoutPostAction name:XYNotifictionCenterPostLogout object:nil];
}

-(void)setLoginPostAction:(SEL)loginPostAction
{
    _loginPostAction = loginPostAction;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:_loginPostAction name:XYNotifictionCenterPostLogin object:nil];
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden{
    _navigationBarHidden = navigationBarHidden;
    _navigationBar.hidden = _navigationBarHidden;
    _navigationBar.height = _navigationBarHidden?XY_TOP_ACTIVE_SPACE:NavigationAndStatusHeight;
}

- (void)setBackgroundImage:(UIImage *)backgroundImage{
    _backgroundImage = backgroundImage;
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:_backgroundImage];
    backgroundImageView.frame = self.view.bounds;
    [self.view insertSubview:backgroundImageView atIndex:0];
}

- (void)layout{
    
}
- (void)setShowLargeTitle:(BOOL)showLargeTitle{
    _showLargeTitle = showLargeTitle;
    if (_showLargeTitle) {
        self.navigationBar.showBigTitleAlways = YES;
        self.navigationBar.hideBigTitle = NO;
    }else{
        self.navigationBar.hideBigTitle = YES;
    }
    if ([self isKindOfClass:[XYTableViewController class]]) {
        XYTableViewController *baseTableVC = (XYTableViewController*)self;
        baseTableVC.showLargeTitle = _showLargeTitle;
    }
}

- (void)setLargeTitleHeight:(CGFloat)largeTitleHeight{
    _largeTitleHeight = largeTitleHeight;
    if ([self isKindOfClass:[XYTableViewController class]]) {
        XYTableViewController *baseTableVC = (XYTableViewController*)self;
        baseTableVC.largeTitleView.height = _largeTitleHeight;
    }
}

- (void)hideBackBarButton{
    self.navigationBar.leftButtonItem.hidden = YES;
    self.navigationItem.leftBarButtonItem = nil;
    self.fd_interactivePopDisabled = YES;
}
- (void)setNavigationTitle:(NSString *)title{
    self.navigationItem.title = title;
    self.navigationBar.title = title;
    
    if ([self isKindOfClass:[XYTableViewController class]]) {
        XYTableViewController *baseTableVC = (XYTableViewController*)self;
        baseTableVC.largeTitleTitle = self.navigationBar.title;
    }
}

- (void)setLeftBarButtonWithTitle:(NSString*)title completionBlock:(void (^)(XYImageTitleButton *))completionBlock{
    [self.navigationBar addLeftButtonWithTitle:title completionBlock:completionBlock];
}
- (void)setLeftBarButtonWithImage:(id)image actioinBlock:(void (^)(XYImageTitleButton *button))actionBlock{
    if ([image isKindOfClass:[NSString class]]) {
        [self.navigationBar addLeftButtonWithImage:[UIImage imageNamed:image] completionBlock:^(XYImageTitleButton * button) {
            if (actionBlock) {
                actionBlock(button);
            }
        }];
        
    }else if([image isKindOfClass:[UIImage class]]){
        [self.navigationBar addLeftButtonWithImage:image completionBlock:^(XYImageTitleButton *button) {
            if (actionBlock) {
                actionBlock(button);
            }
        }];
    }
}

- (void)setRightBarButtonWithTitle:(NSString *)title{
    WeakSelf
    [self.navigationBar addRightButtonWithTitle:title completionBlock:^(XYImageTitleButton *button) {
        [weakSelf rightBarButtonClick];
    }];
}
- (void)setRightBarButtonWithTitle:(NSString *)title color:(UIColor *)color{
    WeakSelf
    [self.navigationBar addRightButtonWithTitle:title textColor:color completionBlock:^(XYImageTitleButton * button) {
        [weakSelf rightBarButtonClick];
    }];
}

- (void)setRightBarButtonWithImage:(id)image{
    WeakSelf
    if ([image isKindOfClass:[NSString class]]) {
        [self.navigationBar addRightButtonWithImage:[UIImage imageNamed:image] completionBlock:^(XYImageTitleButton * _Nonnull button) {
            [weakSelf rightBarButtonClick];
        }];
        
    }else if([image isKindOfClass:[UIImage class]]){
        [self.navigationBar addRightButtonWithImage:image completionBlock:^(XYImageTitleButton * button) {
            [weakSelf rightBarButtonClick];
        }];
    }
}
- (void)setRightBarButtonWithTitle:(NSString *)title actioinBlock:(void (^)(XYImageTitleButton *))actionBlock{
    [self.navigationBar addRightButtonWithTitle:title completionBlock:^(XYImageTitleButton * button) {
        if (actionBlock) {
            actionBlock(button);
        }
    }];
}
- (void)setRightBarButtonWithImage:(id)image actioinBlock:(void (^)(XYImageTitleButton *))actionBlock{
    if ([image isKindOfClass:[NSString class]]) {
        [self.navigationBar addRightButtonWithImage:[UIImage imageNamed:image] completionBlock:^(XYImageTitleButton * button) {
            if (actionBlock) {
                actionBlock(button);
            }
        }];
    }else if([image isKindOfClass:[UIImage class]]){
        [self.navigationBar addRightButtonWithImage:image completionBlock:^(XYImageTitleButton * button) {
            if (actionBlock) {
                actionBlock(button);
            }
        }];
    }
    
}

- (void)rightBarButtonClick{
    
}

//-----导航按钮
- (void) backAction
{
    [self popViewController];
}


-(void)setRightImage:(NSString *)imageName action:(SEL)action{
    
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:action];
    [rightBtn setTintColor:[UIColor blackColor]];
    
    self.navigationItem.rightBarButtonItem = rightBtn;
    
}


-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

//返回
-(void)touchEvent{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -- push
- (void)pushViewController:(UIViewController *)viewController{
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    viewController.hidesBottomBarWhenPushed = YES;
    viewController.navigationItem.hidesBackButton = YES;
    [self.navigationController pushViewController:viewController animated:animated];
}

#pragma mark -- pop
- (void)popViewController{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)popViewControllerAnimated:(BOOL)animated{
    [self.navigationController popViewControllerAnimated:animated];
}
- (void)popToViewController:(UIViewController *)viewController{
    [self.navigationController popToViewController:viewController animated:YES];
    
}

- (void)popToViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [self.navigationController popToViewController:viewController animated:YES];
    
}
- (void)popToViewControllerWithClass:(Class)vcClass{
    UIViewController *vc = [self getViewControllerWithClass:vcClass];
    if(vc){
        [self popToViewController:vc];
    }else{
        [self popViewController];
    }
}
- (void)popToViewControllerWithClass:(Class)vcClass animated:(BOOL)animated{
    UIViewController *vc = [self getViewControllerWithClass:vcClass];
    if(vc){
        [self popToViewController:vc animated:animated];
    }else{
        [self popViewControllerAnimated:animated];
    }
}
- (UIViewController *)getViewControllerWithClass:(Class)vcClass{
    for(UIViewController *vc in self.navigationController.viewControllers){
        if([vc isKindOfClass:vcClass]){
            return vc;
        }
    }
    return nil;
}
-(void)popToChildWithClass:(Class)class
                  callback:(void(^)(id obj))callback
{
    [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
     {
         if ([obj isKindOfClass:class])
         {
             if(callback) callback(obj);
             [self.navigationController popToViewController:obj animated:YES];
             *stop = YES;
         }
     }];
}
- (void)popToRootViewController{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (void)popToRootViewControllerAnimated:(BOOL)animated{
    [self.navigationController popToRootViewControllerAnimated:animated];
}
- (void)popToRootViewControllerAtIndex:(NSInteger)index {
    UIViewController *selectedViewController = [XYTabBarViewController sharedInstance].selectedViewController;
    [XYTabBarViewController sharedInstance].selectedIndex = index;
    if ([XYTabBarViewController sharedInstance].presentedViewController) {
        [[XYTabBarViewController sharedInstance] dismissViewControllerAnimated:NO completion:nil];
    }
    if ([selectedViewController isKindOfClass:[UINavigationController class]]) {
        [(UINavigationController *)selectedViewController popToRootViewControllerAnimated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
