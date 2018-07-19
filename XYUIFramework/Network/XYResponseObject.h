//
//  XYResponseObject.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XYResponseObject : NSObject

@property (nonatomic, copy)     NSString *status;
@property (nonatomic, copy)     NSString *message;
@property (nonatomic, copy)     NSString *code;
@property (nonatomic, strong)   id bodyData;

@end
