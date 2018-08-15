//
//  XYNetWorkApi.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "XYCommonDefine.h"
#import "XYHTTPSessionManager.h"

@interface XYNetWorkApi : NSObject{
    AFSecurityPolicy *_securityPolicy;
}

@property (nonatomic, copy) NSDictionary *singleHTTPRequestHeaders;

@property (nonatomic,strong) XYHTTPSessionManager *manager;

@property (nonatomic,strong) AFHTTPRequestSerializer *requestSerializer;

@property (nonatomic, strong) AFSecurityPolicy *securityPolicy;

@property (nonatomic, assign) BOOL showUploadProgress;

@property (nonatomic) XYRequestSuccessBlock successBlock;
@property (nonatomic) XYNetworkFailureBlock failureBlock;


@property (nonatomic) XYRequestSuccessBlock requestSuccessBlock;
@property (nonatomic) XYRequestFailureBlock requestFailureBlock;
@property (nonatomic) XYNetworkFailureBlock networkFailureBlock;

+(XYNetWorkApi *)sharedManager;

- (void)cancelAllOperations;

- (instancetype)initWithParams:(id)params
                    requestUrl:(NSString*)requestUrl
                    actionName:(NSString*)actionName
                 requestMethod:(YTKRequestMethod)requestMethod;

- (void)requestWithSuccessBlock:(XYRequestSuccessBlock)successBlock
            requestFaliureBlock:(XYRequestFailureBlock)requestFaliureBlock
            networkFaliureBlock:(XYNetworkFailureBlock)networkFaliureBlock;

+ (void)startRequestWithParams:(id)params
                    requestUrl:(NSString*)requestUrl
                    actionName:(NSString *)actionName
                 requestMethod:(YTKRequestMethod)requestMethod
           requestSuccessBlock:(XYRequestSuccessBlock)requestSuccessBlock
           requestFaliureBlock:(XYRequestFailureBlock)requestFaliureBlock
           networkFaliureBlock:(XYNetworkFailureBlock)networkFaliureBlock;

+(instancetype)request;

-(void)postPicWithURL:(NSString *)url
               params:(NSDictionary *)parameters
            imageKeys:(NSArray<NSString *> *)imageKeys
              success:(XYRequestSuccessBlock)success
              failure:(XYNetworkFailureBlock)failure;

/**
 需要重写
 */
- (void)configCallback;


@end
