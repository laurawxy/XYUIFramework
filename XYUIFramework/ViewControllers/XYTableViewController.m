//
//  XYTableViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYTableViewController.h"
#import <Masonry.h>
#import "XYThemeColor.h"
#import "XYMacroConfig.h"
#import "UIView+XYLayout.h"
#import <MJRefresh.h>
#import "UIView+frame.h"
#import "XYAutoLayout.h"
#import "NSObject+XYUtils.h"
#import "XYThemeImage.h"
#import "UIView+XYCornerBorder.h"
#import "XYThemeFont.h"
#import "XYUtils.h"

@interface XYTableViewController ()
@property (nonatomic, strong) UIView *defaultTableHeaderView;

@end

@implementation XYTableViewController

- (void)dealloc{
    self.xyTableView.delegate = nil;
    self.xyTableView.dataSource = nil;
    self.xyTableView.emptyDataSetDelegate = nil;
    self.xyTableView.emptyDataSetSource = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (_tableViewHeadStay) {
        _xyTableView = [[XYTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    }else{
        _xyTableView = [[XYTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    _xyTableView.showsVerticalScrollIndicator = NO;
    _xyTableView.backgroundColor = self.view.backgroundColor;
    _xyTableView.separatorColor = [XYThemeColor lineColor];
    _xyTableView.separatorStyle =UITableViewCellSeparatorStyleNone;
    _xyTableView.delegate = self;
    _xyTableView.dataSource = self;
    _xyTableView.emptyDataSetSource = self;
    _xyTableView.emptyDataSetDelegate = self;
    _xyTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    if ([_xyTableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _xyTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            _xyTableView.estimatedRowHeight=0;
            _xyTableView.estimatedSectionHeaderHeight=0;
            _xyTableView.estimatedSectionFooterHeight=0;
            
        } else {
            // Fallback on earlier versions
        }
    }else{
        _xyTableView.estimatedRowHeight=0;
        _xyTableView.estimatedSectionHeaderHeight=0;
        _xyTableView.estimatedSectionFooterHeight=0;
    }
    
    [self.view addSubview:_xyTableView];
    
    [_xyTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.navigationBar.mas_bottom);
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(self.view.xy_mas_bottom);
    }];
}

- (void)refreshDefaultData{
    if (_xyTableView) {
        [_xyTableView refreshHeaderBeginRefreshing];
    }
}

- (void)setAddRefreshHeader:(BOOL)addRefreshHeader{
    _addRefreshHeader= addRefreshHeader;
    WeakSelf
    if (_xyTableView) {
        _xyTableView.mj_header = nil;
        if (_addRefreshHeader) {
            [_xyTableView setRefreshHeaderWithRefreshingBlock:^{
                weakSelf.xyTableView.currentPage = 1;
                if (weakSelf.refreshBlock) {
                    weakSelf.refreshBlock();
                }
            }];
        }
    }
}
- (void)setAddRefreshFooter:(BOOL)addRefreshFooter{
    _addRefreshFooter = addRefreshFooter;
    WeakSelf
    if (_xyTableView) {
        _xyTableView.mj_footer = nil;
        if (_addRefreshFooter) {
            [_xyTableView setRefreshFooterWithRefreshingBlock:^{
                weakSelf.xyTableView.currentPage ++;
                if (weakSelf.refreshBlock) {
                    weakSelf.refreshBlock();
                }
            }];
        }
    }
}

- (void)setShowBigTitleAlways:(BOOL)showBigTitleAlways{
    _showBigTitleAlways = showBigTitleAlways;
    if (_showBigTitleAlways) {
        if (self.showLargeTitle) {
            [self.xyTableView setTableHeaderView:nil];
            [self.view addSubview:self.largeTitleView];
            [self.largeTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(self.navigationBar.mas_bottom);
                make.height.mas_equalTo(self.largeTitleView.height);
            }];
            [self.xyTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.largeTitleView.mas_bottom);
                make.left.right.mas_equalTo(0);
                make.bottom.mas_equalTo(self.view.xy_mas_bottom);
            }];
        }
    }
}

- (void)setShowLargeTitle:(BOOL)showLargeTitle{
    _showLargeTitle = showLargeTitle;
    if (_showLargeTitle) {
        self.navigationBar.hideBigTitle = YES;
        self.navigationBar.titleLabel.alpha = 0;
        //        self.navigationBar.bottomLineView.hidden = YES;
        
        if (self.showBigTitleAlways) {
            [self.xyTableView setTableHeaderView:nil];
            [self.view addSubview:self.largeTitleView];
            [self.largeTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.right.mas_equalTo(0);
                make.top.mas_equalTo(self.navigationBar.mas_bottom);
                make.height.mas_equalTo(self.largeTitleView.height);
            }];
            [self.xyTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(self.largeTitleView.mas_bottom);
                make.left.right.mas_equalTo(0);
                make.bottom.mas_equalTo(self.view.xy_mas_bottom);
            }];
        }else{
            [self.xyTableView setTableHeaderView:self.largeTitleView];
        }
    }else{
        
        [self.xyTableView setTableHeaderView:self.defaultTableHeaderView];
        //        self.navigationBar.bottomLineView.hidden = NO;
        self.navigationBar.titleLabel.alpha = 1;
    }
}

- (UIView *)defaultTableHeaderView{
    if (!_defaultTableHeaderView) {
        _defaultTableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, DefaultTableViewHeaderFooterHeight)];
    }
    return _defaultTableHeaderView;
}

- (UIView *)largeTitleView{
    if (!_largeTitleView) {
        _largeTitleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.largeTitleHeight)];
        
        [_largeTitleView addSubview:self.largeTitleLabel];
        
        [self.largeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(12);
            make.left.mas_equalTo(CommonLeftMargin);
            make.height.mas_equalTo([self.largeTitleLabel labelHeight]);
        }];
        
        [_largeTitleView addSubview:self.largeTitleDetailButton];
        
        [self.largeTitleDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.largeTitleLabel.mas_bottom).offset(12);
            make.left.mas_equalTo(self.largeTitleLabel);
        }];
        
        [_largeTitleView addSubview:self.largeTitleImageButton];
        [self.largeTitleImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-CommonLeftMargin);
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.centerY.mas_equalTo(self.largeTitleView);
        }];
        //        [_largeTitleView addBottomLine];
    }
    return _largeTitleView;
}

- (UILabel *)largeTitleLabel{
    if (!_largeTitleLabel) {
        _largeTitleLabel = [[UILabel alloc] init];
        _largeTitleLabel.font = KThemeBoldFont(32);
        _largeTitleLabel.textColor = [UIColor blackColor];
    }
    return _largeTitleLabel;
}

- (XYButton *)largeTitleDetailButton{
    if (!_largeTitleDetailButton) {
        _largeTitleDetailButton = [[XYButton alloc] initWithBlock];
    }
    return _largeTitleDetailButton;
}

- (XYButton *)largeTitleImageButton{
    if (!_largeTitleImageButton) {
        _largeTitleImageButton = [[XYButton alloc] initWithBlock];
        [_largeTitleImageButton addCornerWithCornerRadius:25.f];
    }
    return _largeTitleImageButton;
}

- (void)setLargeTitleTitle:(NSString *)largeTitleTitle{
    _largeTitleTitle = largeTitleTitle;
    _largeTitleLabel.text = _largeTitleTitle;
    [_largeTitleLabel sizeToFitLabelWidth];
}


#pragma mark - TableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    return _xyTableView.dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return DefaultTableViewHeaderFooterHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return DefaultTableViewHeaderFooterHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [UIView new];
    return view;
}

#pragma mark - DZNEmptyDataSetSource Methods

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView{
    if (_xyTableView && _xyTableView.endRefresh) {
        if (_xyTableView.showEmptyDataStatus) {
            if (_xyTableView.noInternet) {
                return [XYThemeImage icon_noInternet];
            }else if (_xyTableView.emptyImage){
                return _xyTableView.emptyImage;
            }else{
                return [XYThemeImage icon_noData];
            }
        }
    }
    return nil;
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView
{
    if (_xyTableView && _xyTableView.endRefresh) {
        if (_xyTableView.showEmptyDataStatus) {
            NSMutableDictionary *attributes = [NSMutableDictionary new];
            NSString *text ;
            if (_xyTableView.noInternet) {
                text = @"加载失败";
            }else{
                if (_xyTableView.emptyString) {
                    text = _xyTableView.emptyString;
                }else{
                    text = @"暂无数据";
                }
            }
            if (_xyTableView.emptyStringFont) {
                [attributes setObject:_xyTableView.emptyStringFont forKey:NSFontAttributeName];
            }else{
                [attributes setObject:KThemeBoldFont(16) forKey:NSFontAttributeName];
            }
            if (_xyTableView.emptyStringColor) {
                [attributes setObject:_xyTableView.emptyStringColor forKey:NSForegroundColorAttributeName];
            }else{
                [attributes setObject:[XYThemeColor blackLevelOneColor] forKey:NSForegroundColorAttributeName];
            }
            
            NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
            paragraphStyle.alignment = NSTextAlignmentCenter;
            paragraphStyle.lineSpacing = 8.f;
            [attributes setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
            
            return [[NSAttributedString alloc] initWithString:text attributes:attributes];
        }
    }
    return nil;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (_xyTableView && _xyTableView.endRefresh && _xyTableView.showEmptyDataStatus && _xyTableView.showNoInternetButton) {
        NSMutableDictionary *attributes = [NSMutableDictionary new];
        NSString *text = @"重试";
        if ([_xyTableView.noInternetButtonString isNotEmptyString]) {
            text = _xyTableView.noInternetButtonString;
        }
        [attributes setObject:KThemeNormalFont(14) forKey:NSFontAttributeName];
        [attributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
        return [[NSAttributedString alloc] initWithString:text attributes:attributes];
    }
    return nil;
}

- (UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state{
    if (_xyTableView && _xyTableView.endRefresh && _xyTableView.showEmptyDataStatus && _xyTableView.showNoInternetButton) {
        if (state == UIControlStateNormal) {
            return [XYThemeImage imageWithColor:[XYThemeColor ThemeColor] size:CGSizeMake(76, 36)];
        }
    }
    return nil;
}
- (CGFloat)buttonWidthForEmptyDataSet:(UIScrollView *)scrollView{
    if (_xyTableView && _xyTableView.endRefresh && _xyTableView.showEmptyDataStatus && _xyTableView.showNoInternetButton) {
        NSString *text = @"重试";
        if ([_xyTableView.noInternetButtonString isNotEmptyString]) {
            text = _xyTableView.noInternetButtonString;
        }
        CGSize titleSize = [XYUtils sizeForText:text withWidth:SAFEAREA_WIDTH withFont:KThemeNormalFont(14)];
        if ((titleSize.width+24) > 76) {
            return titleSize.width+24;
        }
        return 76.f;
    }
    return 0;
}

- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.xyTableView.backgroundColor;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView
{
    return self.xyTableView.tableHeaderView.height/2;
    //    return -64.0;
}

#pragma mark - DZNEmptyDataSetDelegate Methods

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView{
    return YES;
}

- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
    return YES;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view{
    //    NSLog(@"%s",__FUNCTION__);
    //    if (_xyTableView.noInternet && self.refreshBlock) {
    //        if (_xyTableView.currentPage == 1) {
    //            [_xyTableView refreshHeaderBeginRefreshing];
    //        }else{
    //            _xyTableView.currentPage -- ;
    //            [_xyTableView refreshFooterBeginRefreshing];
    //        }
    //    }
    
}
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button{
    if (_xyTableView.noInternetBlock) {
        _xyTableView.noInternetBlock();
    }else{
        if (_xyTableView.noInternet && self.refreshBlock) {
            if (_xyTableView.currentPage == 1) {
                [_xyTableView refreshHeaderBeginRefreshing];
            }else{
                _xyTableView.currentPage -- ;
                [_xyTableView refreshFooterBeginRefreshing];
            }
        }
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (self.showBigTitleAlways) {
        
    }else{
        if (self.showLargeTitle) {
            if (scrollView.contentOffset.y>0) {
                if (scrollView.contentOffset.y>42) {
                    [UIView animateWithDuration:0.3f animations:^{
                        self.navigationBar.titleLabel.alpha = 1;
                    }];
                }else{
                    [UIView animateWithDuration:0.3f animations:^{
                        self.navigationBar.titleLabel.alpha = 0;
                    }];
                }
            }else{
                self.navigationBar.titleLabel.alpha = 0;
            }
        }
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
