//
//  XYHorizontalScrollView.h
//  XYUIFramework
//
//  Created by WangXiangyu on 2018/7/24.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYHorizontalScrollViewItem.h"

@class XYHorizontalScrollView;

@protocol HorizontalScrollDelegate <NSObject>

@required
/**
 *  提供item个数，必须实现
 *
 *  @param menu XYHorizontalScrollView实例
 *
 *  @return item个数，NSInteger类型
 */
- (NSInteger)numberOfMenuCount:(XYHorizontalScrollView *)menu;
/**
 *  提供index位置的item宽度，必须实现
 *
 *  @param menu  XYHorizontalScrollView实例
 *  @param index 索引
 *
 *  @return item宽度，CGFloat类型
 */
- (CGFloat)scrollMenu:(XYHorizontalScrollView*)menu widthForItemAtIndex:(NSInteger)index;
/**
 *  提供index位置的item，必须实现
 *
 *  @param menu  XYHorizontalScrollView实例
 *  @param index 索引
 *
 *  @return 返回MinScrollMenuItem实例
 */
- (XYHorizontalScrollViewItem *)scrollMenu:(XYHorizontalScrollView*)menu itemAtIndex:(NSInteger)index;

@optional
/**
 *  点击index位置的item响应方法,可选方法
 *
 *  @param menu  MinScrollMenu实例
 *  @param item  MinScrollMenuItem实例
 *  @param index 索引
 */
- (void)scrollMenu:(XYHorizontalScrollView*)menu didSelectedItem: (XYHorizontalScrollViewItem *)item atIndex: (NSInteger)index;

@end


@interface XYHorizontalScrollView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;/*!< 横向滚动的scrollView */

@property (nonatomic, assign) id<HorizontalScrollDelegate> delegate;


/**
 *  刷新数据
 */
- (void)reloadData;
/**
 *  获取重用的item
 *
 *  @param identifer 重用符
 *
 *  @return 重用的item
 */
- (XYHorizontalScrollViewItem *)dequeueItemWithIdentifer:(NSString *)identifer;

@end
