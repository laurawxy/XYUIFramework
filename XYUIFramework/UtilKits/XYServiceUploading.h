//
//  XYServiceUploading.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYModelViewController.h"

@interface XYServiceUploading : XYModelViewController
@property (nonatomic, copy) NSString *imageUrl;

+ (XYServiceUploading*)sharedInstance;

@end
