//
//  XYTableFootView.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTableFootView.h"
#import "UIView+XYFrame.h"
#import "XYThemeColor.h"

@interface XYTableFootView()
/**
 标题
 */
@property(nonatomic,strong)UILabel *noDataLabel;
@property(nonatomic,strong)UILabel *leftLineLabel;
@property(nonatomic,strong)UILabel *rightLineLabel;
@end
@implementation XYTableFootView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self layout];
    }
    return self;
}

//布局
-(void)layout{
    self.backgroundColor = [UIColor clearColor];
    
    //中间的
    _noDataLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.width/2-40, 0, 80, 50)];
    _noDataLabel.text = @"无更多数据";
    _noDataLabel.textColor = [XYThemeColor blackLevelThreeColor];
    _noDataLabel.textAlignment = NSTextAlignmentCenter;
    _noDataLabel.font = [UIFont systemFontOfSize:13];
    CGSize size = [_noDataLabel sizeThatFits:CGSizeMake(999, 50)];
    _noDataLabel.frame = CGRectMake(self.width/2-size.width/2, 0, size.width, 50);
    [self addSubview:_noDataLabel];
    
    //左边的
    _leftLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(_noDataLabel.left-56, 24.5, 40, 1)];
    _leftLineLabel.backgroundColor = [XYThemeColor blackLevelThreeColor];
    [self addSubview:_leftLineLabel];
    
    //右边的
    _rightLineLabel = [[UILabel alloc]initWithFrame:CGRectMake(_noDataLabel.right+16, 24.5, 40, 1)];
    _rightLineLabel.backgroundColor = [XYThemeColor blackLevelThreeColor];
    [self addSubview:_rightLineLabel];
    
}

-(void)setTitle:(NSString *)title{
    _noDataLabel.text = title;
    CGSize size = [_noDataLabel sizeThatFits:CGSizeMake(999, 50)];
    _noDataLabel.frame = CGRectMake(self.width/2-size.width/2, 0, size.width, 50);
    _leftLineLabel.frame = CGRectMake(_noDataLabel.left-56, 24.5, 40, 1);
    _rightLineLabel.frame = CGRectMake(_noDataLabel.right+16, 24.5, 40, 1);
    
}










@end
