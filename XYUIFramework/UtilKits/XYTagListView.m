//
//  XYTagListView.m
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/30.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTagListView.h"
#import <QuartzCore/QuartzCore.h>
#import "XYUtils.h"
#import "XYThemeFont.h"
#import "XYThemeColor.h"
#import "UIView+XYFrame.h"
#import "XYAutoLayout.h"

#define CORNER_RADIUS 10.0f
#define LABEL_MARGIN 20.0f
#define BOTTOM_MARGIN 5.0f
#define FONT_SIZE 13.0f
#define HORIZONTAL_PADDING 7.0f
#define VERTICAL_PADDING 3.0f
#define BACKGROUND_COLOR [UIColor colorWithRed:0.93 green:0.93 blue:0.93 alpha:1.00]
#define TEXT_COLOR [UIColor blackColor]
#define BORDER_COLOR [UIColor lightGrayColor].CGColor


@implementation XYTagListView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)setTags:(NSMutableArray<XYTagModel *> *)tags
{
    _tags = tags;
    _fittedSize = CGSizeZero;
    [self display];
}

- (void)setNormalBackgroundColor:(UIColor *)normalBackgroundColor
{
    _normalBackgroundColor = normalBackgroundColor;
    [self display];
}

-(void)setNormalTextColor:(UIColor *)normalTextColor{
    _normalTextColor = normalTextColor;
    [self display];
}
-(void)setNormalBorderColor:(UIColor *)normalBorderColor{
    _normalBorderColor = normalBorderColor;
    [self display];
}
-(void)setTextFont:(UIFont *)textFont{
    _textFont = textFont;
    [self display];
}

- (void)setHorizontalPadding:(CGFloat)horizontalPadding{
    _horizontalPadding = horizontalPadding;
    [self display];
}

- (void)setVerticalPadding:(CGFloat)verticalPadding{
    _verticalPadding = verticalPadding;
    [self display];
}

- (void)setBottomMargin:(CGFloat)bottomMargin{
    _bottomMargin = bottomMargin;
    [self display];
}

- (void)setLabelMargin:(CGFloat)labelMargin{
    _labelMargin = labelMargin;
    [self display];
}

- (void)setShowAddButton:(BOOL)showAddButton{
    _showAddButton = showAddButton;
    [self display];
}

- (void)setMinWidth:(CGFloat)minWidth{
    _minWidth = minWidth;
    [self display];
}

- (void)display
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    float totalHeight = 0;
    CGRect previousFrame = CGRectZero;
    BOOL gotPreviousFrame = NO;
    for (int i=0; i<_tags.count; i++) {
        XYTagModel *model = _tags[i];
        
        if (self.horizontalPadding == 0) {
            self.horizontalPadding = HORIZONTAL_PADDING;
        }
        if (self.verticalPadding == 0) {
            self.verticalPadding = VERTICAL_PADDING;
        }
        if (self.bottomMargin == 0) {
            self.bottomMargin = BOTTOM_MARGIN;
        }
        if (self.labelMargin == 0) {
            self.labelMargin = LABEL_MARGIN;
        }
        
        CGSize textSize = [XYUtils sizeForText:model.name withWidth:self.frame.size.width withFont:self.textFont];
        textSize.width += self.horizontalPadding*2;
        if (self.minWidth && textSize.width<self.minWidth) {
            textSize.width = self.minWidth;
        }
        textSize.height += self.verticalPadding*2;
        XYButton *button = nil;
        if (!gotPreviousFrame) {
            button = [[XYButton alloc] initWithBlock];
            button.frame = CGRectMake(0, 0, textSize.width, textSize.height);
            totalHeight = textSize.height;
        } else {
            CGRect newRect = CGRectZero;
            if (previousFrame.origin.x + previousFrame.size.width + textSize.width + self.labelMargin > self.frame.size.width) {
                newRect.origin = CGPointMake(0, previousFrame.origin.y + textSize.height + self.bottomMargin);
                totalHeight += textSize.height + self.bottomMargin;
            } else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + self.labelMargin, previousFrame.origin.y);
            }
            newRect.size = textSize;
            button = [[XYButton alloc] initWithBlock];
            button.frame = newRect;
        }
        button.tag = 100+i;
        previousFrame = button.frame;
        gotPreviousFrame = YES;
        button.buttonFont = self.textFont?:KThemeNormalFont(FONT_SIZE);
        [button setBackgroundColor:self.normalBackgroundColor?:BACKGROUND_COLOR forState:UIControlStateNormal];
        [button setBackgroundColor:self.selectedBackgroundColor forState:UIControlStateSelected];
        [button setTitleColor:self.normalTextColor?:TEXT_COLOR forState:UIControlStateNormal];
        [button setTitleColor:self.selectedTextColor forState:UIControlStateSelected];
        
        [button setTitle:model.name forState:UIControlStateNormal];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:button.height/2];
        [button.layer setBorderColor:self.normalBorderColor?self.normalBorderColor.CGColor:BORDER_COLOR];
        [button.layer setBorderWidth: KLineHeight];
        button.enabled = self.canClick;
        button.selected = model.selected;
        
        WeakSelf
        button.xyButtonActionBlock = ^(XYButton *button) {
            if (weakSelf.tagClickBlock) {
                weakSelf.tagClickBlock(button.tag-100,button);
            }
            XYTagModel *model = weakSelf.tags[button.tag-100];
            model.selected = !model.selected;
            [weakSelf.tags replaceObjectAtIndex:button.tag-100 withObject:model];
        };
        [self addSubview:button];
    }
    
    if (_showAddButton) {
        NSString *text = @"添加";
        CGSize textSize = [XYUtils sizeForText:text withWidth:self.frame.size.width withFont:self.textFont];
        textSize.width += self.horizontalPadding*2;
        if (self.minWidth && textSize.width<self.minWidth) {
            textSize.width = self.minWidth;
        }
        textSize.height += self.verticalPadding*2;
        XYButton *button = nil;
        if (!gotPreviousFrame) {
            button = [[XYButton alloc] initWithBlock];
            button.frame = CGRectMake(0, 0, textSize.width, textSize.height);
            totalHeight = textSize.height;
        } else {
            CGRect newRect = CGRectZero;
            if (previousFrame.origin.x + previousFrame.size.width + textSize.width + self.labelMargin > self.frame.size.width) {
                newRect.origin = CGPointMake(0, previousFrame.origin.y + textSize.height + self.bottomMargin);
                totalHeight += textSize.height + self.bottomMargin;
            } else {
                newRect.origin = CGPointMake(previousFrame.origin.x + previousFrame.size.width + self.labelMargin, previousFrame.origin.y);
            }
            newRect.size = textSize;
            button = [[XYButton alloc] initWithBlock];
            button.frame = newRect;
        }
        previousFrame = button.frame;
        gotPreviousFrame = YES;
        button.buttonFont = self.textFont?:KThemeNormalFont(FONT_SIZE);
        [button setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:self.normalTextColor?:TEXT_COLOR forState:UIControlStateNormal];
        
        [button setTitle:text forState:UIControlStateNormal];
        [button.layer setMasksToBounds:YES];
        [button.layer setCornerRadius:button.height/2];
        [button.layer setBorderColor:[XYThemeColor blackLevelOneColor].CGColor];
        [button.layer setBorderWidth: KLineHeight];
        button.xyButtonActionBlock = ^(XYButton *button) {
            if (self.addTagBlock) {
                self.addTagBlock();
            }
        };
        [self addSubview:button];
    }
    _fittedSize = CGSizeMake(self.frame.size.width, totalHeight + 1.0f);
}


@end

@implementation XYTagModel

@end

