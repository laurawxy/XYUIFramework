//
//  XYAutoLayout.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYAutoLayout.h"
#import "BaseViewController.h"
#import "UINavigationController+XYNavigation.h"
#import "UIDevice+XYPlatForm.h"

@implementation XYAutoLayout

+ (float)safeArea_height{
    float height = SAFE_SCREEN_HEIGHT;

    BaseViewController *vc = (BaseViewController*)[UINavigationController getDisplayingViewController];
    if (vc) {
        if (vc.navigationController.viewControllers.count == 1) {
            height -= TabBarHeight;
        }
    }
    return height;
}

+ (float)notSafeArea_Top{
    float space = 0.0;
    if ([UIDevice isiPhoneX]) {
        if (@available(iOS 11.0, *)){
            space = XY_KEY_WINDOW.safeAreaInsets.top;
        }
    }else{
        return space = 20;
    }
    
    return space;
}

+ (float)notSafeArea_bottom{
    float space = 0.0;
    if (@available(iOS 11.0, *)){
        space = XY_KEY_WINDOW.safeAreaInsets.bottom;
    }else{
        space = 0;
    }
    return space;
}

+ (float)lineHeight{
    return 1.0/[UIScreen mainScreen].scale;
//    return [UIScreen mainScreen].scale * 0.2;
}
@end
