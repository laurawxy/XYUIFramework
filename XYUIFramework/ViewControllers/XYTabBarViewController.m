//
//  XYTabBarViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTabBarViewController.h"
#import "XYTabbar.h"
#import "XYUIApperanceConfig.h"
#import "XYThemeFont.h"
#import "XYThemeColor.h"

@interface XYTabBarViewController ()

@end

@implementation XYTabBarViewController

+ (XYTabBarViewController*)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[XYTabBarViewController alloc] init];
    });
    return sharedInstance;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.hidesBackButton= YES;
    
    [self setupBarUI];
    
    
}

- (void)setupBarUI{
    
    [self setValue:[[XYTabbar alloc]init] forKey:@"tabBar"];
    
    self.tabBar.barTintColor = [XYThemeColor tabBarBarTintColor];
    self.tabBar.tintColor = [XYThemeColor tabBarTintColor];
    if ([self.tabBar respondsToSelector:@selector(setUnselectedItemTintColor:)]) {
        if (@available(iOS 10.0, *)) {
            self.tabBar.unselectedItemTintColor = [XYThemeColor unselectedItemTintColor];
        } else {
            // Fallback on earlier versions
        }
    }
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [XYThemeFont tabBarNormalTitleFont],NSFontAttributeName,nil] forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys: [XYThemeFont tabBarSelectTitleFont],NSFontAttributeName,nil] forState:UIControlStateSelected];
    
    NSMutableArray *vcs = [NSMutableArray array];
    
    for (int i=0; i<[XYUIApperanceConfig tabBarViewControllers].count; i++) {
        UITabBarItem *tabbarItem = [[UITabBarItem alloc] initWithTitle:[[XYUIApperanceConfig tabBarTitles] objectAtIndex:i]
            image:[[[XYUIApperanceConfig tabBarNormalImages] objectAtIndex:i]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
            selectedImage:[[[XYUIApperanceConfig tabBarSelectedImages] objectAtIndex:i]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        UIViewController *vc = [[XYUIApperanceConfig tabBarViewControllers] objectAtIndex:i];
        vc.tabBarItem = tabbarItem;

        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];

        [vcs addObject:nav];
    }

    self.viewControllers = vcs;
}


- (void)didReceiveMemoryWarning {
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
