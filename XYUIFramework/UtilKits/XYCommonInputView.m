//
//  XYCommonInputView.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYCommonInputView.h"
#import "XYThemeFont.h"
#import <Masonry/Masonry.h>
#import "XYThemeColor.h"
#import "XYAutoLayout.h"
#import "NSObject+XYUtils.h"
#import "UIView+XYFrame.h"

@implementation XYCommonInputView{
    CGFloat _left;
}
-(instancetype)initWithFrame:(CGRect)frame withTitle:(NSString *)title withPlaceHolder:(NSString *)placeHolder left:(CGFloat)left{
    self = [super initWithFrame:frame];
    if (self) {
        _left = left;
        [self layoutWithTitle:title withPlaceHolder:placeHolder];
    }
    return self;
}

//布局
-(void)layoutWithTitle:(NSString *)title withPlaceHolder:(NSString *)placeHolder{
    
    UIFont *textFont = KThemeNormalFont(16);
    
    UILabel *rePasswordLabel = [[UILabel alloc]init];
    rePasswordLabel.textAlignment = NSTextAlignmentLeft;
    rePasswordLabel.font = textFont;
    rePasswordLabel.textColor = [XYThemeColor blackLevelOneColor];
    rePasswordLabel.text = title;
    [self addSubview:rePasswordLabel];
    [rePasswordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(CommonLeftMargin);
        make.top.bottom.mas_equalTo(0);
    }];
    [rePasswordLabel sizeToFitLabelWidth];
    
    _textField = [[UITextField alloc]init];
    _textField.placeholder = placeHolder;
    _textField.font = textFont;
    _textField.textColor = [XYThemeColor blackLevelOneColor];
    _textField.borderStyle = UITextBorderStyleNone;
    _textField.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.left);
        make.right.mas_equalTo(-CommonLeftMargin);
        make.top.bottom.mas_equalTo(0);
    }];
}

-(void)setMaxLength:(NSInteger)maxLength
{
    _maxLength = maxLength;
    
    [_textField addTarget:self action:@selector(textFieldMaxLength:) forControlEvents:UIControlEventEditingChanged];
}

-(void)textFieldMaxLength:(UITextField *)sender
{
    NSString *text = [sender.text stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    if (text.length > _maxLength)
    {
        if(_maxLengthMsg) self.maxLengthMsg(_maxLength);
        sender.text = [sender.text substringToIndex:_maxLength];
    }
}












@end
