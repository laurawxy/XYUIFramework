//
//  XYImageView.m
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/31.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYImageView.h"

@implementation XYImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentMode = UIViewContentModeScaleAspectFit;
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    }
    return self;
}
- (instancetype)init{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    }
    return self;
}
- (instancetype)initWithImage:(UIImage *)image{
    if (self = [super initWithImage:image]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    }
    return self;
}
- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage{
    if (self = [super initWithImage:image highlightedImage:highlightedImage]) {
        self.userInteractionEnabled = YES;
        self.contentMode = UIViewContentModeScaleAspectFit;
        [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)]];
    }
    return self;
}

- (void)tapAction{
    if (self.xyImageViewActionBlock) {
        self.xyImageViewActionBlock(self);
    }
}


@end
