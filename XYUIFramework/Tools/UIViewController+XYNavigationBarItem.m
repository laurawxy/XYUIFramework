//
//  UIViewController+XYNavigationBarItem.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "UIViewController+XYNavigationBarItem.h"
#import "XYThemeImage.h"
#import "XYThemeFont.h"
#import "XYThemeColor.h"
#import "XYAutoLayout.h"
#import "XYMacroConfig.h"
#import <Masonry/Masonry.h>
#import "UIView+XYLine.h"
#import "XYImageTitleButton.h"
#import "XYUtils.h"
#import "UIView+XYFrame.h"
#import "NSObject+XYUtils.h"
#import "UIView+XYCornerBorder.h"

@implementation UIViewController (XYNavigationBarItem)
#pragma mark- backBarButton

- (UIBarButtonItem *)addBackBarButtonWithActionBlock:(XYBarButtonItemActionBlock)actionBlock{
    
    XYBackBarButton *backButton = [[XYBackBarButton alloc] initWithTouchActionBlock:actionBlock];
    
    [self xy_setBarButtonItem:backButton positionType:XYBarButtonPositionLeft];
    
    return backButton;
};

#pragma mark- titleBarButton
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                     actionSelector:(SEL)selector{
    return [self addTitleBarButtonWithTitle:title positionType:XYBarButtonPositionRight actionSelector:selector];
}

- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                     actionSelector:(SEL)selector{
    return [self addTitleBarButtonWithTitle:title positionType:positionType titleColor:[XYThemeColor navigationLeftRightColor] actionSelector:selector];
}

- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                         titleColor:(UIColor *)titleColor
                                     actionSelector:(SEL)selector{
    XYTitleBarButtonItem *buttonItem = [[XYTitleBarButtonItem alloc] initWithTitle:title titleColor:titleColor actionSelector:selector target:self];
    [self xy_setBarButtonItem:buttonItem positionType:positionType];
    return buttonItem;
}

- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                        actionBlock:(XYBarButtonItemActionBlock)actionBlock{
    return [self addTitleBarButtonWithTitle:title positionType:positionType titleColor:[XYThemeColor navigationLeftRightColor] actionBlock:actionBlock];
}

- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                         titleColor:(UIColor *)titleColor
                                        actionBlock:(XYBarButtonItemActionBlock)actionBlock{
    XYTitleBarButtonItem *buttonItem = [[XYTitleBarButtonItem alloc] initWithActionBlock:actionBlock title:title titleColor:titleColor];
    [self xy_setBarButtonItem:buttonItem positionType:positionType];
    return buttonItem;
}

#pragma mark- imageBarButton
- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage * _Nullable)highlightedImage
                                     actionSelector:(SEL)selector{
    return [self addImageBarButtonWithImage:image highlightedImage:highlightedImage positionType:XYBarButtonPositionRight actionSelector:selector];
}

- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage * _Nullable)highlightedImage
                                       positionType:(XYBarButtonPosition)positionType
                                     actionSelector:(SEL)selector{
    XYImageBarButtonItem *buttonItem = [[XYImageBarButtonItem alloc] initWithImage:image highlightedImage:highlightedImage action:selector target:self];
    
    [self xy_setBarButtonItem:buttonItem positionType:positionType];
    
    return buttonItem;
}

- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage *)highlightedImage
                                       positionType:(XYBarButtonPosition)positionType
                                        actionBlock:(XYBarButtonItemActionBlock)actionBlock{
    XYImageBarButtonItem *buttonItem = [[XYImageBarButtonItem alloc] initWithImage:image highlightedImage:highlightedImage actionBlock:actionBlock];
    
    [self xy_setBarButtonItem:buttonItem positionType:positionType];
    
    return buttonItem;
}

- (UIBarButtonItem *)addXYImageTitleButtonWithImage:(UIImage *)image title:(NSString *)title type:(XYImageTitleButtonType)type positionType:(XYBarButtonPosition)positionType actionBlock:(XYBarButtonItemActionBlock _Nullable)actionBlock{
    XYImageTitleBarButtonItem *buttonItem = [[XYImageTitleBarButtonItem alloc] initWithImage:image title:title type:type actionBlock:actionBlock];
    [self xy_setBarButtonItem:buttonItem positionType:positionType];
    return buttonItem;
}

#pragma mark- navigationBar
- (XYNavigationBar*)addNavigationBarWithTitle:(NSString *)title{
    XYNavigationBar *navigationView = [[XYNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, NavigationAndStatusHeight)];
    [self.view addSubview:navigationView];
    navigationView.title = title;
    return navigationView;
}

#pragma mark- private method
- (void)xy_setBarButtonItem:(UIBarButtonItem *)barButtonItem positionType:(XYBarButtonPosition)positionType{
    if (positionType == XYBarButtonPositionLeft) {
        
        [self.navigationItem setLeftBarButtonItem:barButtonItem];
        
    } else if (positionType == XYBarButtonPositionRight) {
        
        [self.navigationItem setRightBarButtonItem:barButtonItem];
        
    }
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

@end

@implementation XYBackBarButton

- (instancetype)initWithTouchActionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock{
    UIImage* image= [XYThemeImage icon_navi_back];
    
    UIButton* backButton= [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 2, 0, 0)];
    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self = [super initWithCustomView:backButton];
    if(self){
        _actionBlock = actionBlock;
    }
    return self;
}

- (void)backButtonAction:(UIButton *)sender{
    if (_actionBlock) {
        _actionBlock(self, sender);
    }
}

- (void)dealloc{
    _actionBlock = nil;
}

@end

@implementation XYTitleBarButtonItem

- (void)dealloc{
    _actionBlock = nil;
}

- (instancetype)initWithActionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock
                              title:(NSString *)title
                         titleColor:(UIColor*)titleColor{
    _buttonTitle = title;
    [self setupRightButton];
    [_rightButton setTitleColor:titleColor forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(buttonItemAction:) forControlEvents:UIControlEventTouchUpInside];
    
    self = [super initWithCustomView:_rightButton];
    if(self){
        _actionBlock = actionBlock;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
               actionSelector:(SEL)selector
                       target:(id)target{
    _buttonTitle = title;
    [self setupRightButton];
    if (titleColor) {
        [_rightButton setTitleColor:titleColor forState:UIControlStateNormal];
    }
    [_rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if(self = [super initWithCustomView:_rightButton]){
    }
    return self;
}

- (void)setupRightButton{
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightButton setTitle:_buttonTitle forState:UIControlStateNormal];
    [_rightButton.titleLabel setFont:[XYThemeFont navigationLeftRightFont]];
    [_rightButton sizeToFit];
    _rightButton.frame = CGRectMake(0, 5, _rightButton.frame.size.width, 30);
}

- (void)buttonItemAction:(UIButton *)sender{
    if (_actionBlock) {
        _actionBlock(self, sender);
    }
}

- (void)setButtonTitle:(NSString *)buttonTitle{
    _buttonTitle = buttonTitle;
    [_rightButton setTitle:buttonTitle forState:UIControlStateNormal];
}

- (void)setBarButtonEnabled{
    _rightButton.enabled = YES;
    _rightButton.titleLabel.alpha = 1;
}
- (void)setBarButtonDisable{
    _rightButton.titleLabel.alpha = 0.4;
    _rightButton.enabled = NO;
}
@end

@implementation XYImageBarButtonItem

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                  actionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [rightButton sizeToFit];
    [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self = [super initWithCustomView:rightButton];
    if(self){
        _actionBlock = actionBlock;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage action:(SEL)selector target:(id)target{
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:image forState:UIControlStateNormal];
    [rightButton setImage:highlightedImage forState:UIControlStateHighlighted];
    [rightButton sizeToFit];
    [rightButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if(self = [super initWithCustomView:rightButton]){
    }
    return self;
}

- (void)buttonAction:(UIButton *)button{
    if (_actionBlock) {
        _actionBlock(self, button);
    }
}

@end

@implementation XYImageTitleBarButtonItem

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                         type:(XYImageTitleButtonType)type
                  actionBlock:(nonnull void (^)(UIBarButtonItem * _Nonnull, UIButton * _Nonnull))actionBlock{
    XYImageTitleButton *button = [[XYImageTitleButton alloc] initWithType:ImageRightTitleLeft andTitleFont:[XYThemeFont navigationLeftRightFont] andTitle:title andImage:image andFrame:CGRectMake(0, 0, NavigationHeight, NavigationHeight)];
    [button setTitleColor:[XYThemeColor navigationLeftRightColor] forState:UIControlStateNormal];
    [button sizeToFitXYImageTitleButton];
    WeakSelf
    button.imageTitleButtonActionBlock = ^(XYImageTitleButton *button) {
        if (weakSelf.actionBlock) {
            weakSelf.actionBlock(weakSelf, button);
        }
    };
    self = [super initWithCustomView:button];
    if(self){
        _actionBlock = actionBlock;
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image title:(nonnull NSString *)title type:(XYImageTitleButtonType)type action:(nonnull SEL)selector target:(nonnull id)target{
    XYImageTitleButton *button = [[XYImageTitleButton alloc] initWithType:ImageRightTitleLeft andTitleFont:[XYThemeFont navigationLeftRightFont] andTitle:title andImage:image andFrame:CGRectMake(0, 0, NavigationHeight, NavigationHeight)];
    [button setTitleColor:[XYThemeColor navigationLeftRightColor] forState:UIControlStateNormal];
    [button sizeToFitXYImageTitleButton];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button.imageButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button.titleButton addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];

    if(self = [super initWithCustomView:button]){

    }
    return self;
}

@end

@implementation XYNavigationBar

- (instancetype)init{
    if (self = [self initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NavigationAndStatusHeight+76)]) {
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        
        _largeTitleLabel = [[UILabel alloc] init];
        _largeTitleLabel.backgroundColor = [UIColor clearColor];
        _largeTitleLabel.font = [XYThemeFont navigationLargeTitleFont];
        _largeTitleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _largeTitleLabel.numberOfLines = 1;
        _largeTitleLabel.textColor = [XYThemeColor navigationTitleColor];
        [self addSubview:_largeTitleLabel];
        [_largeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(NavigationAndStatusHeight+8);
            make.left.mas_equalTo(KCommonLeftMargin);
            make.right.mas_equalTo(-KCommonLeftMargin);
            make.height.mas_equalTo(NavigationHeight);
        }];
        
        self.backgroundColor = [XYThemeColor navigationBackgroundColor];
        self.userInteractionEnabled = YES;
        _backImageView = [[UIImageView alloc] init];
        _backImageView.userInteractionEnabled = YES;
        [self addSubview:_backImageView];
        [_backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(NavigationAndStatusHeight);
        }];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [XYThemeFont navigationTitleFont];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = [XYThemeColor navigationTitleColor];
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(StatusBarHeight);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(NavigationHeight);
        }];
        
        
        self.loadingView = [[UIView alloc] init];
        [self addSubview:self.loadingView];
        [_loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(StatusBarHeight);
            make.centerX.mas_equalTo(self);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(NavigationHeight);
        }];
        _label = [[UILabel alloc] init];
        _label.font = [XYThemeFont navigationTitleFont];
        _label.textColor = [XYThemeColor navigationTitleColor];
        _label.textAlignment = NSTextAlignmentCenter;
        [_loadingView addSubview:_label];
        
        _indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_loadingView addSubview:_indicatorView];
        
        
        _titleLabel.alpha = 0;
        
        [self addSubview:self.leftButtonItem];
        [self addSubview:self.rightButtonItem];
        
        [self addBottomLine];
        
        
    }
    return self;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = _title;
    CGSize size = [XYUtils sizeForText:_titleLabel.text withWidth:SCREEN_WIDTH-100 withFont:_titleLabel.font];
    [_titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(size.width);
    }];
    _largeTitleLabel.text = _title;
}

- (void)setLeftBarTitle:(NSString *)leftBarTitle{
    _leftBarTitle = leftBarTitle;
    [self.leftButtonItem setTitle:_leftBarTitle forState:UIControlStateNormal];
    [self.leftButtonItem sizeToFitXYImageTitleButton];
    if (self.leftButtonItem.width < 60) {
        self.leftButtonItem.width = 60;
    }
    [self.leftButtonItem mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.leftButtonItem.width);
    }];
}

- (XYImageTitleButton *)leftButtonItem{
    if (!_leftButtonItem) {
        _leftButtonItem = [[XYImageTitleButton alloc] initWithType:ImageLeftTitleRight andTitleFont:KThemeNormalFont(16) andTitle:@"" andImage:nil andFrame:CGRectMake(0, 0, 60, NavigationHeight)];
        _leftButtonItem.imageTitleMargin = 12;
        [_leftButtonItem setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
        WeakSelf
        _leftButtonItem.imageTitleButtonActionBlock = ^(XYImageTitleButton*button){
            if(weakSelf.leftCompletionBlock){
                weakSelf.leftCompletionBlock(button);
            }
        };
    }
    return _leftButtonItem;
}

- (void)setLeftButtonItem:(XYImageTitleButton *)leftButtonItem{
    if ([leftButtonItem isKindOfClass:[XYImageTitleButton class]]) {
        [leftButtonItem sizeToFitXYImageTitleButton];
        leftButtonItem.width = leftButtonItem.width+2*KCommonLeftMargin;
        if (_leftButtonItem) {
            [self addSubview:leftButtonItem];
        }
    }else{
        if (_leftButtonItem) {
            [_leftButtonItem removeFromSuperview];
            _leftButtonItem = nil;
        }
        [self addSubview:leftButtonItem];
    }
    
    _leftButtonItem = leftButtonItem;
    
    WeakSelf
    [_leftButtonItem mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(StatusBarHeight);
        make.width.mas_equalTo(weakSelf.leftButtonItem.width);
        make.height.mas_equalTo(NavigationHeight);
    }];
}

- (XYImageTitleButton *)rightButtonItem{
    if (!_rightButtonItem) {
        _rightButtonItem = [[XYImageTitleButton alloc] initWithType:ImageLeftTitleRight andTitleFont:KThemeNormalFont(16) andTitle:@"" andImage:nil andFrame:CGRectMake(0, 0, 60, NavigationHeight)];
        _rightButtonItem.imageTitleMargin = 12;
        [_rightButtonItem setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
        [_rightButtonItem sizeToFitXYImageTitleButton];
        WeakSelf
        _rightButtonItem.imageTitleButtonActionBlock = ^(XYImageTitleButton *button){
            if(weakSelf.rightCompletionBlock){
                weakSelf.rightCompletionBlock(button);
            }
        };
    }
    return _rightButtonItem;
}

- (void)setRightButtonItem:(XYImageTitleButton *)rightButtonItem{
    if ([rightButtonItem isKindOfClass:[XYImageTitleButton class]]) {
        [rightButtonItem sizeToFitXYImageTitleButton];
        rightButtonItem.width = rightButtonItem.width+2*KCommonLeftMargin;
        if (_rightButtonItem) {
            [self addSubview:rightButtonItem];
        }
    }else{
        if (_rightButtonItem) {
            [_rightButtonItem removeFromSuperview];
            _rightButtonItem = nil;
        }
        [self addSubview:rightButtonItem];
    }
    _rightButtonItem = rightButtonItem;

    WeakSelf
    [_rightButtonItem mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(StatusBarHeight);
        make.width.mas_equalTo(weakSelf.rightButtonItem.width);
        make.height.mas_equalTo(NavigationHeight);
    }];
}

- (XYImageTitleButton *)addLeftButtonWithTitle:(NSString *)title completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addLeftButtonWithImage:nil Title:title textColor:[XYThemeColor navigationLeftRightColor] completionBlock:completionBlock];
}

- (XYImageTitleButton *)addLeftButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addLeftButtonWithImage:nil Title:title textColor:textColor completionBlock:completionBlock];
}

- (XYImageTitleButton *)addLeftButtonWithImage:(UIImage *)image completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addLeftButtonWithImage:image Title:nil textColor:nil  completionBlock:completionBlock];
}

- (XYImageTitleButton *)addLeftButtonWithImage:(UIImage *)image Title:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void (^)(XYImageTitleButton *))completionBlock{
    if (image && [title isNotEmptyString]) {
        self.leftButtonItem.imageTitleMargin = 12;
    }else{
        self.leftButtonItem.imageTitleMargin = 0;
    }
    if (image) {
        self.leftButtonItem.type = ImageLeftTitleRight;
    }else{
        self.leftButtonItem.type = ImageRightTitleLeft;
    }
    [self.leftButtonItem setImage:image forState:UIControlStateNormal];
    [self.leftButtonItem setTitle:title forState:UIControlStateNormal];
    [self.leftButtonItem setTitleColor:textColor forState:UIControlStateNormal];
    self.leftCompletionBlock = completionBlock;
    self.leftButtonItem = self.leftButtonItem;
    return self.leftButtonItem;
}

- (XYImageTitleButton *)addRightButtonWithTitle:(NSString *)title completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addRightButtonWithImage:nil title:title textColor:[XYThemeColor navigationLeftRightColor]  completionBlock:completionBlock];
}

- (XYImageTitleButton *)addRightButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addRightButtonWithImage:nil title:title textColor:textColor  completionBlock:completionBlock];
}

- (XYImageTitleButton *)addRightButtonWithImage:(UIImage *)image completionBlock:(void(^)(XYImageTitleButton *button))completionBlock{
    return [self addRightButtonWithImage:image title:nil textColor:nil completionBlock:completionBlock];
}

- (XYImageTitleButton *)addRightButtonWithImage:(UIImage *)image title:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void (^)(XYImageTitleButton *))completionBlock{
    if (image && [title isNotEmptyString]) {
        self.rightButtonItem.imageTitleMargin = 12;
    }else{
        self.rightButtonItem.imageTitleMargin = 0;
    }
    if (image) {
        self.leftButtonItem.type = ImageRightTitleLeft;
    }else{
        self.leftButtonItem.type = ImageLeftTitleRight;
    }
    [self.rightButtonItem setImage:image forState:UIControlStateNormal];
    [self.rightButtonItem setTitle:title forState:UIControlStateNormal];
    [self.rightButtonItem setTitleColor:textColor forState:UIControlStateNormal];
    self.rightCompletionBlock = completionBlock;
    self.rightButtonItem = self.rightButtonItem;
    return self.rightButtonItem;
}

- (void)showIndicatorViewWithStatus:(NSString*)status{
    [self setStatus:status];
    self.loadingView.hidden = NO;
    self.titleLabel.hidden = YES;
}
- (void)hideIndicatorView{
    [XYUtils executeMainQueue:^{
        self.loadingView.hidden = YES;
        self.titleLabel.hidden = NO;
    } afterSeconds:0.5f];
}

- (void)setStatus:(NSString *)status{
    _status = status;
    WeakSelf
    if(_status.length>0){
        CGSize lableSize = [XYUtils sizeForText:_status withWidth:SCREEN_WIDTH-100 withFont:_label.font];
        _label.text = _status;
        [_label mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.loadingView);
            make.centerX.mas_equalTo(self.loadingView).mas_offset(20);
            make.size.mas_equalTo(CGSizeMake(lableSize.width, 44));
        }];
        [_indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.loadingView);
            make.right.mas_equalTo(weakSelf.label.mas_left);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [_indicatorView startAnimating];
    }else{
        //只显示_indicatorView
        _label.text = _status;
        [_indicatorView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self);
            make.centerX.mas_equalTo(self);
            make.size.mas_equalTo(CGSizeMake(44, 44));
        }];
        [_indicatorView startAnimating];
    }
}

- (void)setShowRedTag:(BOOL)showRedTag showOnLeftButton:(BOOL)showOnLeftButton{
    self.redTagLabel.hidden = !showRedTag;

    if (showOnLeftButton) {
        [self.leftButtonItem addSubview:self.redTagLabel];
        [self.redTagLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.leftButtonItem.imageButton.mas_top).offset(-5);
            make.right.mas_equalTo(self.leftButtonItem.imageButton.mas_right).offset(5);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }else{
        [self.rightButtonItem addSubview:self.redTagLabel];
        [self.redTagLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.rightButtonItem.imageButton.mas_top).offset(-5);
            make.right.mas_equalTo(self.rightButtonItem.imageButton.mas_right).offset(5);
            make.size.mas_equalTo(CGSizeMake(10, 10));
        }];
    }
    
}

- (void)setHideBigTitle:(BOOL)hideBigTitle{
    _hideBigTitle = hideBigTitle;
    if (_hideBigTitle) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, NavigationAndStatusHeight);
        self.titleLabel.alpha = 1;
        self.largeTitleLabel.hidden = YES;
    }else{
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, NavigationAndStatusHeight+76);
        self.titleLabel.alpha = 0;
        self.largeTitleLabel.hidden = NO;
    }
}

- (UILabel *)redTagLabel{
    if (!_redTagLabel) {
        _redTagLabel = [[UILabel alloc] init];
        _redTagLabel.backgroundColor = RGB(243, 72, 72);
        [_redTagLabel addCornerWithCornerRadius:5.f];
    }
    return _redTagLabel;
}

- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self.leftButtonItem || hitView == self.rightButtonItem || [self.leftButtonItem.subviews containsObject:hitView] || [self.rightButtonItem.subviews containsObject:hitView]) {
        return hitView;
    }
    if (_hitTestView) {
        CGPoint redBtnPoint = [self convertPoint:point toView:_hitTestView];
        if ([_hitTestView pointInside:redBtnPoint withEvent:event]) {
            UIView *view = [_hitTestView hitTest: redBtnPoint withEvent: event];
            if (view) return view;
        }
    }    
    return [super hitTest:point withEvent:event];
}

@end

