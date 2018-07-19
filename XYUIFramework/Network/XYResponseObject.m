//
//  XYResponseObject.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYResponseObject.h"
#import "NSObject+XYUtils.h"

@interface XYResponseObject()
@property (nonatomic, strong)   id data;
@property (nonatomic, strong)   id body;
@end

@implementation XYResponseObject

/**
 可重写此方法
 */
- (id)bodyData{
    if (self.body) {
        return self.body;
    }else if (self.data){
        return self.data;
    }
    return @{};
}
@end
