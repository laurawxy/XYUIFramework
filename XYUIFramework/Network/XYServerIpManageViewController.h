//
//  XYServerIpManageViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTableViewController.h"
#import "XYCommonDefine.h"

@class IpModel;

@interface XYServerIpManageViewController :  XYTableViewController

@property(nonatomic, copy) ObjectBlock selectIpBlock;

+ (XYServerIpManageViewController*)sharedInstance;

- (IpModel *)currentIpModel;

- (void)addIpModel:(IpModel *)ipModel;

- (void)addIpModels:(NSArray<IpModel *> *)ipModels;


@end

@interface IpModel : NSObject

@property(nonatomic, copy)NSString *name;

@property(nonatomic, copy)NSString *host;
@property(nonatomic, copy)NSString *hostApi;

@property(nonatomic, copy)NSString *wapHost;
@property(nonatomic, copy)NSString *wapHostApi;

@property(nonatomic, copy)NSString *h5Host;

@property(nonatomic, strong)NSString *noInternetAddress;

@end
