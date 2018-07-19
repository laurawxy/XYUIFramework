//
//  XYServiceUploading.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYServiceUploading.h"
#import "UIView+frame.h"
#import "XYAutoLayout.h"
#import "XYThemeImage.h"
#import <UIImageView+WebCache.h>

@interface XYServiceUploading()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation XYServiceUploading

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (XYServiceUploading*)sharedInstance{
    static XYServiceUploading *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.windowLevel = ShowWindowLevelServiceUpdate;

    _imageView = [[UIImageView alloc]init];
    _imageView.size = CGSizeMake(ScaleX750(295), ScaleX750(403));
    [_imageView setFrame:CGRectMake(self.view.width/2-_imageView.width/2, (SCREEN_HEIGHT-TabBarHeight-NavigationAndStatusHeight)/2-_imageView.height/2, _imageView.width, _imageView.height)];
    _imageView.userInteractionEnabled = YES;
    [self.view addSubview:_imageView];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:[UIImage imageNamed:@"network_placeholder"]];
    _animateView = _imageView;
}

- (void)setImageUrl:(NSString *)imageUrl{
    _imageUrl = imageUrl;
    [_imageView sd_setImageWithURL:[NSURL URLWithString:_imageUrl] placeholderImage:[UIImage imageNamed:@"network_placeholder"]];
}

@end
