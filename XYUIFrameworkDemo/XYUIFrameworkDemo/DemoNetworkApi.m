//
//  DemoNetworkApi.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/20.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "DemoNetworkApi.h"
#import "XYMacroConfig.h"

#import "SVProgressHUD+XYCustomization.h"

@implementation DemoNetworkApi
- (void)configCallback{
    WeakSelf
    self.successBlock = ^(id responseObject){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [SVProgressHUD dismiss];
        if(responseObject){
            if([responseObject[@"code"] integerValue] == 200){
                if(weakSelf.requestSuccessBlock){
                    weakSelf.requestSuccessBlock(responseObject);
                }
            }else{
                if(weakSelf.requestFailureBlock){
                    weakSelf.requestFailureBlock(responseObject);
                }
            }
        }else {
            if(weakSelf.requestFailureBlock){
                weakSelf.requestFailureBlock(nil);
            }
        }
    };
    self.failureBlock = ^(NSError *error){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [SVProgressHUD showError:LCNETWORKERROR];
        if(weakSelf.networkFailureBlock){
            weakSelf.networkFailureBlock(error);
        }
    };
}
@end
