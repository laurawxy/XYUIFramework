//
//  XYCommonDefine.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "XYResponseObject.h"

//************************** 公共block定义 **************************//

typedef void(^VoidBlock)(void);
typedef void(^StringBlock)(NSString *string);
typedef void(^IntergerBlock)(NSInteger integer);
typedef void(^BoolBlock)(BOOL booL);
typedef void(^ArrayBlock)(NSArray *array);
typedef void(^DictionaryBlock)(NSDictionary *params);
typedef void(^ImageBlock)(UIImage *image);

typedef void(^ObjectBlock)(id object);
typedef void(^ObjectAndObjectBlock)(id object,id object2);

typedef void(^XYRequestSuccessBlock)(XYResponseObject *responseBody);
typedef void(^XYRequestFailureBlock)(XYResponseObject *responseBody);
typedef void(^XYNetworkFailureBlock)(NSError *error);


typedef NS_ENUM(NSInteger, YTKRequestMethod) {
    YTKRequestMethodGET = 0,
    YTKRequestMethodPOST,
    YTKRequestMethodHEAD,
    YTKRequestMethodPUT,
    YTKRequestMethodDELETE,
    YTKRequestMethodPATCH,
    YTKRequestMethodPOSTJSONDATA,
    YTKRequestMethodPOSTDICT,
};

NSString * NSStringFromRequestMethod(YTKRequestMethod requestMethod);

/**
 登录页面关闭方式
 
 - LoginDismissToBackType: 返回上一个页面
 - LoginDismissToHomeType: 返回首页
 - LoginDismissToWeType: 返回我的页面
 - LoginDismissToNoBackType: 不能返回
 */
typedef NS_ENUM(NSInteger,LoginDismissType) {
    LoginDismissToBackType = 0,
    LoginDismissToHomeType = 1,
    LoginDismissToWeType = 2,
    LoginDismissToNoBackType = 3
};

static BOOL queryedNoInternetUrl = NO;


#define XYNotifictionCenterPostLogout @"XYNotifictionCenterPostLogout"  //下线
#define XYNotifictionCenterPostLogin @"XYNotifictionCenterPostLogin"    //上线


@interface XYCommonDefine : NSObject

@end
