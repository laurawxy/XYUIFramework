//
//  XYNetWorkApi.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//



#import "XYNetWorkApi.h"
#import "XYServiceUploading.h"
#import "XYBundleInfoHelper.h"
#import "XYMacroConfig.h"
#import "SVProgressHUD+XYCustomization.h"
#import "NSObject+XYUtils.h"
#import "XYUtils.h"
#import <MJExtension/MJExtension.h>
#import "XYMacroConfig.h"
#import "XYNetworkConfig.h"

@interface XYNetWorkApi()

@property (nonatomic,copy) NSDictionary *params;
@property (nonatomic,copy) NSString *actionName;
@property (nonatomic,copy) NSString *requestUrl;
@property (nonatomic,assign) YTKRequestMethod requestMethod;

@end

@implementation XYNetWorkApi

+(XYNetWorkApi *)sharedManager
{
    static XYNetWorkApi *sharedNetworkSingleton = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate,^{
        sharedNetworkSingleton = [[self alloc] init];
    });
    return sharedNetworkSingleton;
}

+(instancetype)request
{
    return [[[self class] alloc] init];
}

- (void)cancelAllOperations{
    [self.manager.operationQueue cancelAllOperations];
}
- (XYHTTPSessionManager *)manager
{
    if (!_manager)
    {
        _manager = [[XYHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:self.requestUrl]];
        _manager.responseSerializer.acceptableContentTypes = [XYNetworkConfig responseAcceptableContentTypes];
        _manager.requestSerializer = self.requestSerializer;
        
        if ([XYNetworkConfig securityPolicyCerPath]) {
            _manager.securityPolicy = self.securityPolicy;
        }
    }
    return _manager;
}

- (AFSecurityPolicy *)securityPolicy{
    if (!_securityPolicy) {
        NSData *certData = [NSData dataWithContentsOfFile:[XYNetworkConfig securityPolicyCerPath]];
        NSSet *certSet = [NSSet setWithObject:certData];
        _securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certSet];
        _securityPolicy.validatesDomainName = NO;
        _securityPolicy.allowInvalidCertificates = YES;
    }
    return _securityPolicy;
}

- (AFHTTPRequestSerializer *)requestSerializer{
    if (!_requestSerializer) {
        _requestSerializer = [AFHTTPRequestSerializer serializer];
        _requestSerializer.timeoutInterval = [XYNetworkConfig requestTimeoutInterval];
        
        NSDictionary *headers = [XYNetworkConfig requestSessionHeader];
        for (NSString *filed in [headers allKeys])
        {
            [_requestSerializer setValue:headers[filed] forHTTPHeaderField:filed];
        }
    }
    return _requestSerializer;
}

- (void)setSingleHTTPRequestHeaders:(NSDictionary *)singleHTTPRequestHeaders{
    if (_singleHTTPRequestHeaders) {
        _requestSerializer = nil;
        self.manager.requestSerializer = self.requestSerializer;
    }
    _singleHTTPRequestHeaders = singleHTTPRequestHeaders;
    
    if (_singleHTTPRequestHeaders) {
        for (NSString *filed in [self.singleHTTPRequestHeaders allKeys])
        {
            [self.requestSerializer setValue:self.singleHTTPRequestHeaders[filed] forHTTPHeaderField:filed];
        }
    }
}

#pragma mark - init

- (instancetype)initWithParams:(id)params requestUrl:(NSString *)requestUrl actionName:(NSString *)actionName requestMethod:(YTKRequestMethod)requestMethod{
    if (self = [super init]) {
        _requestMethod = requestMethod;
        _actionName = actionName;
        _requestUrl = requestUrl;
        _params = params;
    }
    return self;
}


- (void)configCallback{
    WeakSelf
    _successBlock = ^(id responseObject){
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
    _failureBlock = ^(NSError *error){
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        [SVProgressHUD showError:LCNETWORKERROR];
        if(weakSelf.networkFailureBlock){
            weakSelf.networkFailureBlock(error);
        }
    };
}

#pragma mark - 请求
- (void)requestWithSuccessBlock:(XYRequestSuccessBlock)requestSuccessBlock requestFaliureBlock:(XYRequestFailureBlock)requestFaliureBlock networkFaliureBlock:(XYNetworkFailureBlock)networkFaliureBlock{
    self.requestSuccessBlock = requestSuccessBlock;
    self.requestFailureBlock = requestFaliureBlock;
    self.networkFailureBlock = networkFaliureBlock;
    [self configCallback];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if (_requestMethod == YTKRequestMethodPOST) {
        [self postUploadDataWithURL:_requestUrl params:_params success:self.successBlock failure:self.failureBlock];
    }else if(_requestMethod == YTKRequestMethodGET){
        [self getDataWithURL:_requestUrl params:_params success:self.successBlock failure:self.failureBlock];
    }else if (_requestMethod == YTKRequestMethodPOSTJSONDATA){
        [self postJsonDataWithURL:_requestUrl jsonString:[XYUtils convertDictionaryToString:_params] success:self.successBlock failure:self.failureBlock];
    }else if (_requestMethod == YTKRequestMethodPOSTDICT){
        [self postDictWithURL:_requestUrl dictData:_params success:self.successBlock failure:self.failureBlock];
    }
}

#pragma mark - GET
-(void)getDataWithURL:(NSString *)url
               params:(NSDictionary*)parameters
              success:(XYRequestSuccessBlock)success
              failure:(XYNetworkFailureBlock)failure
{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];

    url = [XYUtils encodeUrl:url];
    
    [self.manager GET:url parameters:muParams progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self responseSuccessCookie:task];
        [self logSuccessMessage:responseObject url:task.currentRequest.URL];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logFailureMessage:error url:task.currentRequest.URL];
        if (failure) {
            failure(error);
        }
    }];
    self.singleHTTPRequestHeaders = nil;
}


#pragma mark - POST
-(void)postUploadDataWithURL:(NSString *)url
                      params:(NSDictionary *)parameters
                     success:(XYRequestSuccessBlock)success
                     failure:(XYNetworkFailureBlock)failure
{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];
    
    url = [XYUtils encodeUrl:url];
    
    [self.manager POST:url parameters:muParams progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self responseSuccessCookie:task];
        [self logSuccessMessage:responseObject url:task.currentRequest.URL];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logFailureMessage:error url:task.currentRequest.URL];
        if (failure) {
            failure(error);
        }
    }];

    self.singleHTTPRequestHeaders = nil;
    
}
-(void)postPicWithURL:(NSString *)url
               params:(NSDictionary *)parameters
            imageKeys:(NSArray< NSString *> *)imageKeys
              success:(XYRequestSuccessBlock)success
              failure:(XYNetworkFailureBlock)failure
{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];
    
    url = [XYUtils encodeUrl:url];
    [self.manager POST:url parameters:muParams constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [imageKeys enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
         {
             NSData  *imageData = parameters[obj];
             // 上传文件
             NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
             formatter.dateFormat = @"yyyyMMddHHmmss";
             NSString *str = [formatter stringFromDate:[NSDate date]];
             
             NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
             [formData appendPartWithFileData:imageData
                                         name:obj
                                     fileName:fileName
                                     mimeType:@"image/png"];
         }];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (self.showUploadProgress) {
            [SVProgressHUD showProgress:uploadProgress.fractionCompleted status:KAlertUploading];
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self responseSuccessCookie:task];
        [self logSuccessMessage:responseObject url:task.currentRequest.URL];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logFailureMessage:error url:task.currentRequest.URL];
        if (failure) {
            failure(error);
        }
    }];
}

#pragma nark - POST JSON Data
- (void)postJsonDataWithURL:(NSString *)url
                 jsonString:(NSString *)jsonString
                    success:(XYRequestSuccessBlock)success
                    failure:(XYNetworkFailureBlock)failure{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionary];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];
    
    url = [XYUtils encodeUrl:url];
    
    AFHTTPSessionManager *manager = [self manager];
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:muParams error:nil];
    [request addValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    NSData *body  =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:body];
    
    [[manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [self logFailureMessage:error url:response.URL];
            if (failure) {
                failure(error);
            }
        }else{
            [self logSuccessMessage:responseObject url:response.URL];
            if (success) {
                success(responseObject);
            }
        }
    }] resume];
}
#pragma nark - POST Dict
- (void)postDictWithURL:(NSString *)url
               dictData:(NSDictionary *)dictData
                success:(XYRequestSuccessBlock)success
                failure:(XYNetworkFailureBlock)failure{

    for (NSString *key in [XYNetworkConfig requestDefaultParams].allKeys) {
        if ([url containsString:@"?"]) {
            url = [url stringByAppendingString:[NSString stringWithFormat:@"&%@=%@",key,[[XYNetworkConfig requestDefaultParams] objectForKey:key]]];
        }else{
            url = [url stringByAppendingString:[NSString stringWithFormat:@"?%@=%@",key,[[XYNetworkConfig requestDefaultParams] objectForKey:key]]];
        }
    }

    url = [XYUtils encodeUrl:url];
    
    
    AFHTTPSessionManager *manager = [self manager];
    
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    [request addValue:@"application/json"forHTTPHeaderField:@"Content-Type"];
    NSData *body  = [NSJSONSerialization dataWithJSONObject:dictData options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPBody:body];
    
    //发起请求
    [[manager dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (error) {
            [self logFailureMessage:error url:response.URL];
            if (failure) {
                failure(error);
            }
        }else{
            [self logSuccessMessage:responseObject url:response.URL];
            if (success) {
                success(responseObject);
            }
        }
    }] resume];
}


#pragma mark - PUT
-(void)putDataWithURL:(NSString *)url
               params:(NSDictionary*)parameters
              success:(XYRequestSuccessBlock)success
              failure:(XYNetworkFailureBlock)failure
{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];
    
    url = [XYUtils encodeUrl:url];
    [self.manager PUT:url parameters:muParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self responseSuccessCookie:task];
        [self logSuccessMessage:responseObject url:task.currentRequest.URL];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logFailureMessage:error url:task.currentRequest.URL];
        if (failure) {
            failure(error);
        }
    }];
    self.singleHTTPRequestHeaders = nil;
}

#pragma mark - DELETE
-(void)deleteDataWithURL:(NSString *)url
                  params:(NSDictionary*)parameters
                 success:(XYRequestSuccessBlock)success
                 failure:(XYNetworkFailureBlock)failure
{
    NSMutableDictionary *muParams = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [muParams addEntriesFromDictionary:[XYNetworkConfig requestDefaultParams]];
    
    url = [XYUtils encodeUrl:url];
    [self.manager DELETE:url parameters:muParams success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self responseSuccessCookie:task];
        [self logSuccessMessage:responseObject url:task.currentRequest.URL];
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self logFailureMessage:error url:task.currentRequest.URL];
        if (failure) {
            failure(error);
        }
    }];
    self.singleHTTPRequestHeaders = nil;
}


+ (void)startRequestWithParams:(id)params requestUrl:(NSString *)requestUrl actionName:(NSString *)actionName requestMethod:(YTKRequestMethod)requestMethod requestSuccessBlock:(XYRequestSuccessBlock)requestSuccessBlock requestFaliureBlock:(XYRequestFailureBlock)requestFaliureBlock networkFaliureBlock:(XYNetworkFailureBlock)networkFaliureBlock{
    
    XYNetWorkApi *network = [[XYNetWorkApi alloc] initWithParams:params requestUrl:requestUrl actionName:actionName requestMethod:requestMethod];    
    [network requestWithSuccessBlock:requestSuccessBlock requestFaliureBlock:requestFaliureBlock networkFaliureBlock:networkFaliureBlock];
}

- (void)responseSuccessCookie:(NSURLSessionDataTask*)task{
    NSHTTPURLResponse * response = (NSHTTPURLResponse *)task.response;
    if ([response.allHeaderFields.allKeys containsObject:@"Set-Cookie"])
    {
        NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject: cookiesData forKey:@"Cookie"];
        [defaults synchronize];
    }
    if ([XYNetworkConfig PrintRequestCookieInfo]) {
        NSLog(@"%@-allHeaderFields:%@",self.actionName,response.allHeaderFields);
    }
}

- (void)logSuccessMessage:(id)responseObject url:(NSURL*)URL{
    if ([XYNetworkConfig PrintRequestSuccessInfo]) {
        NSLog(@"%@-%@--%@数据成功\n\n--------------------\n\n%@\n\n--------------------\n\n",self.actionName,URL,NSStringFromRequestMethod(self.requestMethod),[[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding]);
    }
}

- (void)logFailureMessage:(NSError *)error url:(NSURL*)URL{
    
    if ([XYNetworkConfig PrintRequestErrorInfo]) {
        NSLog(@"%@-%@--%@数据失败\n\n--------------------\n\n%@\n\n--------------------\n\n",self.actionName,URL,NSStringFromRequestMethod(self.requestMethod),error);
    }
}



@end
