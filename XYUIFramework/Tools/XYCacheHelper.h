//
//  XYCacheHelper.h
//  DuiDeRen
//
//  Created by WangXiangyu on 2018/8/3.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYCacheHelper : NSObject

+ (XYCacheHelper*)sharedInstance;


- (BOOL)containsObjectForKey:(NSString *)key;


- (void)containsObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key, BOOL contains))block;


- (id<NSCoding>)objectForKey:(NSString *)key;


- (void)objectForKey:(NSString *)key withBlock:(void(^)(NSString *key, id<NSCoding> object))block;


- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key;


- (void)setObject:(id<NSCoding>)object forKey:(NSString *)key withBlock:(void(^)(void))block;


- (void)removeObjectForKey:(NSString *)key;


- (void)removeObjectForKey:(NSString *)key withBlock:(void(^)(NSString *key))block;


- (void)removeAllObjects;


- (void)removeAllObjectsWithBlock:(void(^)(void))block;


- (void)removeAllObjectsWithProgressBlock:(void(^)(int removedCount, int totalCount))progress
                                 endBlock:(void(^)(BOOL error))end;


@end
