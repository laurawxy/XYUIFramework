//
//  LCContractView.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCContractView : UIView

@property (nonatomic,assign,getter=isAgree) BOOL agree;

@property (nonatomic,strong) NSAttributedString *contractTitle;

@property (nonatomic,copy) void(^labelAction)(void);

@end
