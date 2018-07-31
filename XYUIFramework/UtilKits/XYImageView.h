//
//  XYImageView.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/31.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class XYImageView;

typedef void (^XYImageViewActionBlock)(XYImageView*imageView);

@interface XYImageView : UIImageView

@property(nonatomic,copy)XYImageViewActionBlock xyImageViewActionBlock;

@end
