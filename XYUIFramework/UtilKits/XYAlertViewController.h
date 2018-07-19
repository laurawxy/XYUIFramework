//
//  XYAlertViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYModelViewController.h"
#import "XYButton.h"
#import "CommonDefine.h"

@interface XYAlertViewController : XYModelViewController

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *messageTextView;

@property (nonatomic, strong) XYButton *mainButton;
@property (nonatomic, strong) XYButton *otherButton;
@property (nonatomic, strong) XYButton *thirdButton;

+ (XYAlertViewController *)sharedInstance;
-(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle anotherButtonTitle:(NSString *)anotherButtonTitle completeBlock:(IntergerBlock)completeBlock;
@end
