//
//  LCContractView.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//
#import "LCContractView.h"
#import "UIView+frame.h"
#import <Masonry.h>

@interface LCContractView()
{
    UILabel *contractLabel;
}
@end


@implementation LCContractView



-(void)setContractTitle:(NSAttributedString *)contractTitle
{
    _contractTitle = contractTitle;
    
    contractLabel = [UILabel new];
    contractLabel.attributedText = _contractTitle;
    contractLabel.isAttributedContent = YES;
    contractLabel.userInteractionEnabled = YES;
    [self addSubview:contractLabel];
    [contractLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
    //
    UITapGestureRecognizer *labelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelTapAction)];
    [contractLabel addGestureRecognizer:labelTap];
    //初始化设置
    self.agree = YES;
}

-(void)labelTapAction
{
    self.labelAction();
}

@end
