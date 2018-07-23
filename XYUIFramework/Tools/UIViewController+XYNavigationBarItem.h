//
//  UIViewController+XYNavigationBarItem.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYImageTitleButton.h"
#import "XYCommonDefine.h"

@class XYNavigationBar;

/**
 按钮位置
 */
typedef NS_ENUM(NSInteger, XYBarButtonPosition) {
    /**
     左边
     */
    XYBarButtonPositionLeft,
    /**
     右边
     */
    XYBarButtonPositionRight
};

typedef void(^XYBarButtonItemActionBlock)(UIBarButtonItem *barButtonItem, UIButton *button);


@interface UIViewController (XYNavigationBarItem)

#pragma mark- backBarButton
/**
 添加返回按钮
 
 @param actionBlock 按钮点击事件
 @return 按钮
 */
- (UIBarButtonItem *)addBackBarButtonWithActionBlock:(XYBarButtonItemActionBlock)actionBlock;

#pragma mark- titleBarButton

/**
 添加右边文字按钮（selector）

 @param title NSString
 @param selector 点击回调
 @return UIBarButtonItem
 */
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                     actionSelector:(SEL)selector;

/**
 添加文字按钮（selector）

 @param title NSString
 @param positionType 位置
 @param selector 点击回调
 @return UIBarButtonItem
 */
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                     actionSelector:(SEL)selector;

/**
 添加自定义颜色的文字按钮 (selector)
 
 @param title NSString
 @param positionType 位置
 @param titleColor   字体颜色
 @param selector     点击回调
 @return 按钮
 */
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                         titleColor:( UIColor * _Nullable )titleColor
                                     actionSelector:(SEL)selector;

/**
 添加文字按钮(block)

 @param title NSString
 @param positionType 位置
 @param actionBlock  点击事件
 @return 按钮
 */
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                        actionBlock:(XYBarButtonItemActionBlock _Nullable)actionBlock;

/**
 添加自定义颜色的文字按钮(block)

 @param title NSString
 @param positionType 位置
 @param titleColor   字体颜色
 @param actionBlock  点击事件
 @return 按钮
 */
- (UIBarButtonItem *)addTitleBarButtonWithTitle:(NSString *)title
                                       positionType:(XYBarButtonPosition)positionType
                                         titleColor:(UIColor * _Nullable)titleColor
                                        actionBlock:(XYBarButtonItemActionBlock _Nullable)actionBlock;

#pragma mark- imageBarButton
/**
 添加右边图片按钮(selector)
 
 @param image            图片
 @param highlightedImage 选中图片
 @param selector         点击回调
 @return 按钮
 */
- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage * _Nullable)highlightedImage
                                     actionSelector:(SEL)selector;

/**
 添加图片按钮 (selector)
 
 @param image            图片
 @param highlightedImage 选中图片
 @param positionType     位置
 @param selector         点击回调
 @return 按钮
 */
- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage * _Nullable)highlightedImage
                                       positionType:(XYBarButtonPosition)positionType
                                     actionSelector:(SEL)selector;
/**
 添加图片按钮(block)
 
 @param image                图片
 @param highlightedImage     选中图片
 @param positionType         位置
 @param actionBlock          点击事件
 @return 按钮
 */
- (UIBarButtonItem *)addImageBarButtonWithImage:(UIImage *)image
                                   highlightedImage:(UIImage * _Nullable)highlightedImage
                                       positionType:(XYBarButtonPosition)positionType
                                        actionBlock:(XYBarButtonItemActionBlock _Nullable)actionBlock;

/**
 添加图片文字按钮(action)

 @param image 图片
 @param title 文字
 @param positionType 位置
 @param actionBlock 点击回调
 @return UIBarButtonItem
 */
- (UIBarButtonItem *)addXYImageTitleButtonWithImage:(UIImage*)image
                                               title:(NSString*)title
                                                type:(XYImageTitleButtonType)type
                                        positionType:(XYBarButtonPosition)positionType
                                         actionBlock:(XYBarButtonItemActionBlock _Nullable)actionBlock;

#pragma mark- navigationBar
/**
 添加自定义navigationBar
 
 @param title NSString
 @return XYNavigationBar
 */
- (XYNavigationBar*)addNavigationBarWithTitle:(NSString * _Nullable)title;

@end

@interface XYBackBarButton : UIBarButtonItem
- (instancetype)initWithTouchActionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock;
@property(copy, nonatomic)void(^actionBlock)(UIBarButtonItem *barButtonItem, UIButton *button);

@end



@interface XYTitleBarButtonItem : UIBarButtonItem
@property(nonatomic, strong)NSString *buttonTitle;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, copy) void(^actionBlock)(UIBarButtonItem *barButtonItem, UIButton *button);

- (instancetype)initWithActionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock
                              title:(NSString *)title
                         titleColor:(UIColor*)titleColor;

- (instancetype)initWithTitle:(NSString *)title
                   titleColor:(UIColor *)titleColor
               actionSelector:(SEL)selector
                       target:(id)target;

- (void)setBarButtonDisable;
- (void)setBarButtonEnabled;

@end

@interface XYImageBarButtonItem : UIBarButtonItem
@property (nonatomic, copy)void(^actionBlock)(UIBarButtonItem *barButtonItem, UIButton *button);

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                  actionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock;

- (instancetype)initWithImage:(UIImage *)image
             highlightedImage:(UIImage *)highlightedImage
                       action:(SEL)selector
                       target:(id)target;
@end

@interface XYImageTitleBarButtonItem : UIBarButtonItem
@property (nonatomic, copy)void(^actionBlock)(UIBarButtonItem *barButtonItem, UIButton *button);

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                         type:(XYImageTitleButtonType)type
                  actionBlock:(void(^)(UIBarButtonItem *barButtonItem, UIButton *button))actionBlock;

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
                         type:(XYImageTitleButtonType)type
                       action:(SEL)selector
                       target:(id)target;
@end

@interface XYNavigationBar : UIView{
    XYImageTitleButton *_leftButtonItem;
    XYImageTitleButton *_rightButtonItem;
}
@property(nonatomic, strong)UIImageView *backImageView;

@property(nonatomic, strong)NSString *title;
@property(nonatomic, strong)UILabel *titleLabel;
@property(nonatomic, strong)UILabel *largeTitleLabel;


@property(nonatomic, strong)UIView *loadingView;
@property(nonatomic, strong)UIActivityIndicatorView *indicatorView;
@property(nonatomic, strong)UILabel *label;
@property(nonatomic, strong)NSString *status;


@property(nonatomic, strong)UILabel *redTagLabel;

@property(nonatomic, strong)XYImageTitleButton *leftButtonItem;
@property(nonatomic, strong)NSString *leftBarTitle;
@property(nonatomic) ObjectBlock leftCompletionBlock;

@property(nonatomic, strong)XYImageTitleButton *rightButtonItem;
@property(nonatomic) ObjectBlock rightCompletionBlock;

@property(nonatomic, assign)BOOL showBigTitleAlways;
@property(nonatomic, assign)BOOL hideBigTitle;

@property(nonatomic, strong)UIView *hitTestView;

- (void)setShowRedTag:(BOOL)showRedTag showOnLeftButton:(BOOL)showOnLeftButton;

- (XYImageTitleButton *)addLeftButtonWithTitle:(NSString *)title completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;
- (XYImageTitleButton *)addLeftButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;

- (XYImageTitleButton *)addLeftButtonWithImage:(UIImage *)image completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;
- (XYImageTitleButton *)addLeftButtonWithImage:(UIImage *)image Title:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;


- (XYImageTitleButton *)addRightButtonWithTitle:(NSString *)title completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;
- (XYImageTitleButton *)addRightButtonWithTitle:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;

- (XYImageTitleButton *)addRightButtonWithImage:(UIImage *)image completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;

- (XYImageTitleButton *)addRightButtonWithImage:(UIImage *)image title:(NSString *)title textColor:(UIColor *)textColor completionBlock:(void(^)(XYImageTitleButton *button))completionBlock;


- (void)showIndicatorViewWithStatus:(NSString*)status;
- (void)hideIndicatorView;

@end
//NS_ASSUME_NONNULL_BEGIN
//NS_ASSUME_NONNULL_END

