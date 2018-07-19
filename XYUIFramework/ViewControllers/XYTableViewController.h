//
//  XYTableViewController.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYViewController.h"
#import "XYTableView.h"
#import "UIScrollView+XYEmptyDataSet.h"

@interface XYTableViewController : XYViewController<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,EmptyDataSetSource,EmptyDataSetDelegate>
{
    XYTableView *_xyTableView;
}

@property(nonatomic,strong)XYTableView * xyTableView;
@property(nonatomic,assign)BOOL tableViewHeadStay;

@property(nonatomic)VoidBlock refreshBlock;

@property(nonatomic)BOOL addRefreshHeader;
@property(nonatomic)BOOL addRefreshFooter;

@property(nonatomic, assign)BOOL showBigTitleAlways;
@property(nonatomic, strong)UIView *largeTitleView;
@property(nonatomic, strong)UILabel *largeTitleLabel;
@property(nonatomic, strong)XYButton *largeTitleDetailButton;

@property(nonatomic, copy)  NSString *largeTitleTitle;
@property(nonatomic, strong)XYButton *largeTitleImageButton;

- (void)refreshDefaultData;

@end
