//
//  SVProgressHUD+XYCustomization.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "SVProgressHUD+XYCustomization.h"
#import "XYThemeFont.h"
#import "XYThemeImage.h"

@implementation SVProgressHUD (XYCustomization)
+ (void)setupDefault {
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD setMinimumDismissTimeInterval:3.f];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0.f green:0.f blue:0.f alpha:0.6f]];
    [SVProgressHUD setFont:KThemeNormalFont(15)];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setCornerRadius:4.f];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setDefaultInfoImage];
}

+ (void)setDefaultInfoImage {
    [SVProgressHUD setSuccessImage:[XYThemeImage icon_toast_success]];
    [SVProgressHUD setErrorImage:[XYThemeImage icon_toast_failure]];
}


+ (void)showSuccess:(NSString *)success
{
    [SVProgressHUD setImageViewSize:CGSizeMake(33, 24)];
    [SVProgressHUD setMinimumSize:CGSizeMake(120.f, 120.f)];
    [SVProgressHUD showSuccessWithStatus:success];
}

+ (void)showError:(NSString *)error
{
    [SVProgressHUD setImageViewSize:CGSizeMake(0, -5)];
    [SVProgressHUD setMinimumSize:CGSizeMake(100.f, 43.f)];
    [SVProgressHUD showErrorWithStatus:error];
}

+ (void)showMessage:(NSString *)message
{
    [SVProgressHUD setImageViewSize:CGSizeMake(0, 0)];
    [SVProgressHUD setMinimumSize:CGSizeMake(120.f, 120.f)];
    [SVProgressHUD showWithStatus:message];
}

+ (void)hideHUD
{
    [SVProgressHUD dismiss];
}


@end
