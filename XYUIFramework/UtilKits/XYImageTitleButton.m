//
//  XYImageTitleButton.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYImageTitleButton.h"
#import <Masonry/Masonry.h>
#import "XYButton.h"
#import "UIView+XYFrame.h"
#import "XYMacroConfig.h"

@interface XYImageTitleButton ()

@property (nonatomic) CGSize titleButtonSize;

@end

@implementation XYImageTitleButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)dealloc{
    [_titleButton removeObserver:self forKeyPath:@"highlighted"];
    [_imageButton removeObserver:self forKeyPath:@"highlighted"];

}
- (instancetype)initWithType:(XYImageTitleButtonType)type andTitleFont:(UIFont*)font andTitle:(NSString*)title andImage:(UIImage*)image andFrame:(CGRect)frame{
    self = [[XYImageTitleButton alloc] initWithBlock];
    _imageButton = [[XYButton alloc] initWithBlock];
    _titleButton = [[XYButton alloc] initWithBlock];

    _type = type;
    _imageTitleMargin = 8.f;

    [_imageButton setImage:image forState:UIControlStateNormal];
    [_imageButton sizeToFit];
    [self addSubview:_imageButton];

    _titleButton.titleLabel.font = font;
    [_titleButton setTitle:title forState:UIControlStateNormal];
    self.titleButtonSize = [_titleButton xySizeToFit];
    [self addSubview:_titleButton];
    
    self.frame = frame;
    [self reloadFrames];

    [_titleButton addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    [_imageButton addObserver:self forKeyPath:@"highlighted" options:NSKeyValueObservingOptionNew context:nil];
    
    WeakSelf
    _titleButton.xyButtonActionBlock = ^(XYButton *button) {
        [weakSelf buttonAction:button];
    };
    _imageButton.xyButtonActionBlock = ^(XYButton *button) {
        [weakSelf buttonAction:button];
    };
    self.xyButtonActionBlock = ^(XYButton *button) {
        [weakSelf buttonAction:button];
    };
    return self;
}

- (void)setType:(XYImageTitleButtonType)type{
    _type = type;
    [self sizeToFitXYImageTitleButton];
    [self reloadFrames];
}

- (void)reloadFrames{
    if (_type == ImageTopTitleBottom) {
        [_imageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self).offset(-(self.titleButtonSize.height+self.imageTitleMargin)/2);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(self.imageButton.size);
        }];
        
        [_titleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.imageButton.mas_bottom).offset(self.imageTitleMargin);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(self.titleButtonSize.height);
        }];
    }else if (_type == ImageBottomTitleTop) {
        [_titleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self).offset(-(self.imageButton.height+self.imageTitleMargin)/2);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(self.titleButtonSize);
        }];
        
        [_imageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.titleButton.mas_bottom).offset(self.imageTitleMargin);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(self.imageButton.size);
        }];
    }else if (_type == ImageRightTitleLeft){
        [_titleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self).offset(-(self.imageButton.width+self.imageTitleMargin)/2);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.titleButtonSize);
        }];
        
        [_imageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.titleButton.mas_right).offset(self.imageTitleMargin);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.imageButton.size);
        }];
    }else if (_type == ImageLeftTitleRight) {
        [_imageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(self).offset(-(self.titleButtonSize.width+self.imageTitleMargin)/2);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.imageButton.size);
        }];
        
        [_titleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.imageButton.mas_right).offset(self.imageTitleMargin);
            make.centerY.mas_equalTo(self);
            make.size.mas_equalTo(self.titleButtonSize);
        }];
        
    }else if(_type == ImageDownTitleUp){
        [_imageButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
        [_titleButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
}
- (void)setImage:(UIImage *)image forState:(UIControlState)state{
    [_imageButton setImage:image forState:state];
    [_imageButton sizeToFit];
    [self reloadFrames];

}
- (void)setTitle:(NSString *)title forState:(UIControlState)state{
    [_titleButton setTitle:title forState:state];
    self.titleButtonSize = [_titleButton xySizeToFit];
    [self reloadFrames];
}
- (void)setAttributedTitle:(NSAttributedString *)title forState:(UIControlState)state{
    [_titleButton setAttributedTitle:title forState:state];
    self.titleButtonSize = CGSizeMake([_titleButton xySizeToFit].width+2, [_titleButton xySizeToFit].height+2);
    [self reloadFrames];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    [_titleButton setTitleColor:color forState:state];
}

- (void)setImageTitleMargin:(CGFloat)imageTitleMargin {
    _imageTitleMargin = imageTitleMargin;
    [self reloadFrames];
}

- (void)buttonAction:(id)sender{
    if(self.imageTitleButtonActionBlock){
        self.imageTitleButtonActionBlock(self);
    }
}
- (void)setHighlighted:(BOOL)highlighted{
    self.titleButton.highlighted = highlighted;
    self.imageButton.highlighted = highlighted;
}
- (void)transformMakeRotation:(CGFloat)angle{
    [UIView animateWithDuration:0.3 animations:^{
        CGAffineTransform at = CGAffineTransformMakeRotation(angle);
        at = CGAffineTransformTranslate(at, 0, 0);
        [self.imageButton setTransform:at];
    }];
}
- (void)sizeToFitXYImageTitleButton{

    if (_type == ImageTopTitleBottom || _type == ImageBottomTitleTop) {
        self.size = CGSizeMake(self.titleButtonSize.width>_imageButton.width?self.titleButtonSize.width:_imageButton.width, self.titleButtonSize.height+_imageButton.height+_imageTitleMargin);
    }else if (_type == ImageRightTitleLeft || _type == ImageLeftTitleRight) {
        self.size = CGSizeMake(self.titleButtonSize.width+_imageButton.width+_imageTitleMargin,self.titleButtonSize.height>_imageButton.height?self.titleButtonSize.height:_imageButton.height);
    }else if (_type == ImageDownTitleUp){
        self.size = CGSizeMake(self.titleButtonSize.width>_imageButton.width?self.titleButtonSize.width:_imageButton.width,self.titleButtonSize.height>_imageButton.height?self.titleButtonSize.height:_imageButton.height);
    }

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
    
    UIButton *button = (UIButton *)object;
    if ([keyPath isEqualToString:@"highlighted"]) {
        if (button.highlighted != _titleButton.highlighted || button.highlighted != _imageButton.highlighted) {
            if (button == _titleButton) {
                _imageButton.highlighted = button.highlighted;
            }else{
                _titleButton.highlighted = button.highlighted;
            }
        }
        
    }
}

- (CGFloat)xyWidth{
    if ([UIDevice currentDevice].systemVersion.floatValue<9) {
       return self.titleButton.width+self.imageButton.width+self.imageTitleMargin;
    }else{
        return self.width;
    }
}

- (CGFloat)xyHeight{
    if ([UIDevice currentDevice].systemVersion.floatValue<9) {
        return self.titleButton.height+self.imageButton.height+self.imageTitleMargin;
    }else{
        return self.height;
    }
}

- (CGSize)xySize{
    if ([UIDevice currentDevice].systemVersion.floatValue<9) {
        return CGSizeMake(self.xyWidth, self.xyHeight);
    }else{
        return self.size;
    }
}

@end
