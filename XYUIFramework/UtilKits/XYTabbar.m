//
//  XYTabbar.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTabbar.h"

@implementation XYTabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)setFrame:(CGRect)frame{
    if (self.superview && CGRectGetMaxY(self.superview.bounds) != CGRectGetMaxY(frame)) {
        frame.origin.y = CGRectGetHeight(self.superview.bounds) - CGRectGetHeight(frame);
    }
    [super setFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.translucent = false;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


@end
