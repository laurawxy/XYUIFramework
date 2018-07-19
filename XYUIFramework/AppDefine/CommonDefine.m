//
//  CommonDefine.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "CommonDefine.h"

@implementation CommonDefine


NSString * NSStringFromRequestMethod(YTKRequestMethod requestMethod) {
    switch (requestMethod) {
        case YTKRequestMethodGET:
            return @"GET";
            break;
        case YTKRequestMethodPOST:
            return @"POST";
            break;
        case YTKRequestMethodHEAD:
            return @"HEAD";
            break;
        case YTKRequestMethodPUT:
            return @"PUT";
            break;
        case YTKRequestMethodDELETE:
            return @"DELETE";
            break;
        case YTKRequestMethodPATCH:
            return @"PATCH";
            break;
        case YTKRequestMethodPOSTJSONDATA:
            return @"POSTJSONDATA";
            break;
        case YTKRequestMethodPOSTDICT:
            return @"POSTDICT";
            break;
        default:
            return @"";
            break;
    }
}


@end
