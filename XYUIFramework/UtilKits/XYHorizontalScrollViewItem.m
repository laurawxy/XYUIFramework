//
//  XYHorizontalScrollViewItem.m
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYHorizontalScrollViewItem.h"

@interface XYHorizontalScrollViewItem ()
@property (nonatomic, strong) CALayer *selectedMaskLayer;
@property (nonatomic, assign) XYHorizontalScrollViewItemType type;
@end


@implementation XYHorizontalScrollViewItem

- (instancetype)initWithType:(XYHorizontalScrollViewItemType)type reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithFrame:CGRectMake(0.0, 0.0, 60.0, 60.0)];
    if (self) {
        self.type = type;
        self.reuseIdentifer = reuseIdentifier;
        [self basePropertySetup];
    }
    
    return self;
}

- (void)basePropertySetup {
    self.userInteractionEnabled = YES;
    self.contentView = [[UIView alloc] init];
    [self addSubview:_contentView];
    self.selectedMaskLayer.hidden = YES;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    self.selectedMaskLayer.hidden = !isSelected;
}

- (void)setType:(XYHorizontalScrollViewItemType)type {
    if (_type != type) {
        _type = type;
        
        switch (_type) {
            case XYHorizontalScrollViewItemDefaultType:
                [_textLabel removeFromSuperview];
                _textLabel = nil;
                [_imageView removeFromSuperview];
                _imageView = nil;
                break;
            case XYHorizontalScrollViewItemTextType:
                [self addSubview:self.textLabel];
                break;
            case XYHorizontalScrollViewItemImageType:
                [self addSubview:self.imageView];
                break;
            default:
                break;
        }
    }
}

- (UILabel *)textLabel {
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
    }
    return _textLabel;
}

- (UIImageView *)imageView {
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.contentView.frame = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height);
    self.selectedMaskLayer.frame = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height);
    switch (self.type) {
        case XYHorizontalScrollViewItemTextType:
            self.textLabel.frame = CGRectMake(1.0, 1.0, frame.size.width-2, frame.size.height-2);
            break;
        case XYHorizontalScrollViewItemImageType:
            self.imageView.frame = CGRectMake(1.0, 1.0, frame.size.width-2, frame.size.height-2);
            break;
        default:
            break;
    }
}

- (CALayer *)selectedMaskLayer {
    if (_selectedMaskLayer == nil) {
        _selectedMaskLayer = [CALayer layer];
        _selectedMaskLayer.frame = self.layer.frame;
        _selectedMaskLayer.backgroundColor = [UIColor colorWithRed:217.00/255.00 green:217.00/255.00 blue:217.00/255.00 alpha:1.0].CGColor;
        _selectedMaskLayer.hidden = YES;
        [self.layer insertSublayer:_selectedMaskLayer atIndex:0];
    }
    
    return _selectedMaskLayer;
}

@end
