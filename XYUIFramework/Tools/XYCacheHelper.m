//
//  XYCacheHelper.m
//  DuiDeRen
//
//  Created by WangXiangyu on 2018/8/3.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYCacheHelper.h"
#import <YYCache/YYCache.h>

@interface XYCacheHelper ()

@property(nonatomic, strong)YYCache *globalCache;

@end

@implementation XYCacheHelper
+ (XYCacheHelper*)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[self alloc] initSingleton];
    });
    return sharedInstance;
}

- (instancetype)initSingleton{
    self = [super init];
    if(self){
        NSString* cachesDirectory = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
        cachesDirectory = [[[cachesDirectory stringByAppendingPathComponent:[[NSBundle mainBundle] bundleIdentifier]] stringByAppendingPathComponent:@"YYCacheDirectory"] copy];
        _globalCache = [[YYCache alloc] initWithPath:cachesDirectory];
        _globalCache.memoryCache.countLimit = 100;
        _globalCache.diskCache.countLimit = 300;
    }
    return self;
}

- (instancetype)init{
    return [XYCacheHelper sharedInstance];
}

- (BOOL)containsObjectForKey:(NSString *)key{
    return [_globalCache containsObjectForKey:key];
}

- (void)containsObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key, BOOL contains))block{
    [_globalCache containsObjectForKey:key withBlock:block];
}

- (id<NSCoding>)objectForKey:(NSString *)key{
    return [_globalCache objectForKey:key];
}

- (void)objectForKey:(NSString *)key withBlock:(void(^)(NSString *key, id<NSCoding> object))block{
    [_globalCache objectForKey:key withBlock:block];
}

- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key{
    [_globalCache setObject:object forKey:key];
}


- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withBlock:(void(^)(void))block{
    [_globalCache setObject:object forKey:key withBlock:block];
}


- (void)removeObjectForKey:(NSString *)key{
    [_globalCache removeObjectForKey:key];
}


- (void)removeObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key))block{
    [_globalCache removeObjectForKey:key withBlock:block];
}


- (void)removeAllObjects{
    [_globalCache removeAllObjects];
}


- (void)removeAllObjectsWithBlock:(void(^)(void))block{
    [_globalCache removeAllObjectsWithBlock:block];
}


- (void)removeAllObjectsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                                 endBlock:(void(^)(BOOL error))end{
    [_globalCache removeAllObjectsWithProgressBlock:progress endBlock:end];
}


@end
