//
//  XYCommonInputView.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYCommonInputView : UIView
@property(nonatomic,strong)UITextField *textField;
@property (nonatomic,assign) NSInteger maxLength;
@property (nonatomic,copy) void(^maxLengthMsg)(NSInteger maxLength);

-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withPlaceHolder:(NSString *)placeHolder left:(CGFloat)left;
@end
