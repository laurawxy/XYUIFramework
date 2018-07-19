//
//  XYLocalStorageUtil.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/7/18.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYLocalStorageUtil : NSObject

+ (void) setArray:(NSArray *)info forKey:(NSString *)key;
+ (NSArray *) getArray:(NSString *)key;

+ (void) setInfo:(NSString *)info forKey:(NSString *)key;
+ (NSString *) getInfo:(NSString *)key;

+ (BOOL) getBoolValue:(NSString *) key;
+ (void) setBoolValue:(BOOL) v forKey:(NSString *)key;

+ (void) removeInfo:(NSString *)key;


@end
