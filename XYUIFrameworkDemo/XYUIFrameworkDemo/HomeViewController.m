//
//  HomeViewController.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/19.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "HomeViewController.h"
#import "XYThemeColor.h"
#import "XYThemeFont.h"
#import "XYButton.h"
#import "XYAutoLayout.h"
#import "UIView+XYFrame.h"
#import "UIView+XYCornerBorder.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitle:@"首页"];
    
    XYButton *_unLockPhotoButton = [[XYButton alloc] initWithBlock];
    _unLockPhotoButton.buttonFont = KThemeBoldFont(18);
    [_unLockPhotoButton setTitle:@"解锁照片" forState:UIControlStateNormal];
    [_unLockPhotoButton setButtonStyle:XYCustomButtonStyleWhiteBlackColor];
    [_unLockPhotoButton setTitleColor:[XYThemeColor blackLevelTwoColor] forState:UIControlStateNormal];
    _unLockPhotoButton.frame = CGRectMake(XYCommonLeftMargin, 100, SAFEAREA_WIDTH, XYCustomButtonViewHeight);
    [_unLockPhotoButton createCornerRadiusShadowWithCornerRadius:_unLockPhotoButton.height/2 shadowColor:RGB(0,0,0) shadowCornerRadius:0.f offset:CGSizeMake(0, 4.f) opacity:0.1 shadowRadius:10.f];
    
    [self.view addSubview:_unLockPhotoButton];
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
