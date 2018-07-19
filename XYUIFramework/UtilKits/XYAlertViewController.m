//
//  XYAlertViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYAlertViewController.h"
#import "UIView+XYLine.h"
#import <Masonry/Masonry.h>
#import "XYThemeFont.h"
#import "XYAutoLayout.h"
#import "XYUtils.h"
#import "XYThemeColor.h"
#import "UIView+XYCornerBorder.h"
#import "XYMacroConfig.h"

#define XYAlertViewWidth (SCREEN_WIDTH-4*CommonLeftMargin)

@interface XYAlertViewController ()
@property (nonatomic, copy) IntergerBlock completeBlock;

@end

@implementation XYAlertViewController

+ (XYAlertViewController *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.windowLevel = ShowWindowLevelAlert;
    [self.view addSubview:self.animateView];
    [self.animateView addSubview:self.titleLabel];
    [self.animateView addSubview:self.messageTextView];
    [self.animateView addSubview:self.mainButton];
    [self.animateView addSubview:self.otherButton];
    [self.animateView addSubview:self.thirdButton];

    [self.otherButton addTopLine];
    [self.otherButton addRightLine];
    [self.mainButton addTopLine];
    [self.thirdButton addTopLine];

    [self.animateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view);
        make.centerX.mas_equalTo(self.view);
        make.width.mas_equalTo(XYAlertViewWidth);
        make.bottom.mas_equalTo(self.thirdButton);
    }];

    
}
-(void)alertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitle:(NSString *)otherButtonTitle anotherButtonTitle:(NSString *)anotherButtonTitle completeBlock:(IntergerBlock)completeBlock{
    self.completeBlock = completeBlock;
    if (title && title.length>0) {
        self.titleLabel.text = title;
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(CommonLeftMargin);
            make.right.mas_equalTo(-CommonLeftMargin);
            make.top.mas_equalTo(CommonLeftMargin);
            make.height.mas_equalTo(18);
        }];
    }else{
        self.titleLabel.text = @"";
        [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(CommonLeftMargin);
            make.right.mas_equalTo(-CommonLeftMargin);
            make.top.mas_equalTo(ScaleX750(4));
            make.height.mas_equalTo(0);
        }];
    }
    if (message && message.length>0) {
        self.messageTextView.text = message;
        CGSize size = [XYUtils sizeForText:message withWidth:SCREEN_WIDTH-6*CommonLeftMargin withFont:self.messageTextView.font];
        if (size.height>20) {
            self.messageTextView.textAlignment = NSTextAlignmentLeft;
            if (size.height>(SAFE_SCREEN_HEIGHT-NavigationHeight-TabBarHeight-70)) {
                size.height = SAFE_SCREEN_HEIGHT-NavigationHeight-TabBarHeight-70;
            }else{
                size.height = size.height+20;
            }
        }else{
            self.messageTextView.textAlignment = NSTextAlignmentCenter;
            size.height = size.height+20;
        }
        [self.messageTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(size.width+10);
            make.centerX.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(ScaleX750(6));
            make.height.mas_equalTo(size.height);
        }];
    }else{
        self.messageTextView.text = @"";
        [self.messageTextView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(SCREEN_WIDTH-6*CommonLeftMargin);
            make.centerX.mas_equalTo(self.titleLabel);
            make.top.mas_equalTo(self.titleLabel.mas_bottom);
            make.height.mas_equalTo(1);
        }];
    }
    if (otherButtonTitle && otherButtonTitle.length>0) {
        [self.otherButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [self.mainButton setTitle:otherButtonTitle forState:UIControlStateNormal];

        if (anotherButtonTitle && anotherButtonTitle.length>0) {
            [self.thirdButton setTitle:anotherButtonTitle forState:UIControlStateNormal];
            //3
            [self.mainButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(0);
                make.top.mas_equalTo(self.messageTextView.mas_bottom).offset(ScaleX750(10));
                make.height.mas_equalTo(50.f);
                make.width.mas_equalTo(XYAlertViewWidth);
            }];
            
            [self.otherButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.top.mas_equalTo(self.mainButton.mas_bottom);
                make.height.mas_equalTo(50.f);
                make.width.mas_equalTo(XYAlertViewWidth);
            }];
            
            [self.thirdButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.top.mas_equalTo(self.otherButton.mas_bottom);
                make.height.mas_equalTo(50.f);
                make.width.mas_equalTo(XYAlertViewWidth);
            }];
            
        }else{// 2
            [self.thirdButton setTitle:@"" forState:UIControlStateNormal];

            [self.otherButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.top.mas_equalTo(self.messageTextView.mas_bottom).offset(ScaleX750(10));
                make.height.mas_equalTo(50.f);
                make.width.mas_equalTo(XYAlertViewWidth/2);
            }];
            [self.mainButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(0);
                make.top.mas_equalTo(self.otherButton);
                make.height.mas_equalTo(50.f);
                make.width.mas_equalTo(XYAlertViewWidth/2);
            }];
            [self.thirdButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(0);
                make.top.mas_equalTo(self.otherButton.mas_bottom);
                make.height.mas_equalTo(0.f);
                make.width.mas_equalTo(0);
            }];
        }
        
    }else{
        //1
        [self.otherButton setTitle:@"" forState:UIControlStateNormal];
        [self.otherButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.messageTextView.mas_bottom).offset(ScaleX750(10));
            make.height.mas_equalTo(50.f);
            make.width.mas_equalTo(0);
        }];
        
        [self.mainButton setTitle:cancelButtonTitle forState:UIControlStateNormal];
        [self.mainButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(self.otherButton);
            make.height.mas_equalTo(50.f);
            make.left.mas_equalTo(self.otherButton.mas_right);
        }];
        
        [self.thirdButton setTitle:@"" forState:UIControlStateNormal];
        [self.thirdButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.otherButton.mas_bottom);
            make.height.mas_equalTo(0.f);
            make.width.mas_equalTo(0);
        }];
    }
    
}
- (UIView *)animateView{
    if (!_animateView) {
        _animateView = [[UIView alloc] init];
        _animateView.backgroundColor = [UIColor whiteColor];
        [_animateView addCorner];
    }
    return _animateView;
}

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = KThemeBoldFont(18);
        _titleLabel.textColor = [XYThemeColor blackLevelOneColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        
    }
    return _titleLabel;
}
-(UITextView *)messageTextView{
    if (!_messageTextView) {
        _messageTextView = [[UITextView alloc] init];
        _messageTextView.font = KThemeNormalFont(15);
        _messageTextView.textColor = [XYThemeColor blackLevelOneColor];
        _messageTextView.editable = NO;
        _messageTextView.selectable = NO;
        _messageTextView.showsVerticalScrollIndicator = NO;
        _messageTextView.showsHorizontalScrollIndicator = NO;
        _messageTextView.scrollEnabled = NO;
    }
    return _messageTextView;
}

- (XYButton *)mainButton{
    if (!_mainButton) {
        _mainButton = [[XYButton alloc] initWithBlock];
        [_mainButton setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateNormal];
        [_mainButton setTitleColor:[XYThemeColor ThemeColor] forState:UIControlStateHighlighted];
        
        [_mainButton setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_mainButton setBackgroundColor:RGB(246, 246, 246) forState:UIControlStateHighlighted];
        
        _mainButton.titleLabel.font = KThemeMediumFont(18);
        WeakSelf
        _mainButton.xyButtonActionBlock = ^(XYButton *button) {
            [weakSelf dismissViewControllerAnimated:YES completion:^{
                if (weakSelf.completeBlock) {
                    weakSelf.completeBlock(1);
                }
            }];
        };
    }
    return _mainButton;
}

- (XYButton *)otherButton{
    if (!_otherButton) {
        _otherButton = [[XYButton alloc] initWithBlock];
        _otherButton.buttonStyle = XYCustomButtonStyleWhiteBlackColor;
        [_otherButton setTitleColor:[XYThemeColor blackLevelOneColor] forState:UIControlStateNormal];
        _otherButton.titleLabel.font = KThemeNormalFont(18);
        WeakSelf
        _otherButton.xyButtonActionBlock = ^(XYButton *button) {
            [weakSelf dismissViewControllerAnimated:YES completion:^{
                if (weakSelf.completeBlock) {
                    weakSelf.completeBlock(0);
                }
            }];
            
        };
    }
    return _otherButton;
}

- (XYButton *)thirdButton{
    if (!_thirdButton) {
        _thirdButton = [[XYButton alloc] initWithBlock];
        _thirdButton.buttonStyle = XYCustomButtonStyleWhiteBlackColor;
        [_thirdButton setTitleColor:[XYThemeColor blackLevelOneColor] forState:UIControlStateNormal];
        _thirdButton.titleLabel.font = KThemeNormalFont(18);
        WeakSelf
        _thirdButton.xyButtonActionBlock = ^(XYButton *button) {
            [weakSelf dismissViewControllerAnimated:YES completion:^{
                if (weakSelf.completeBlock) {
                    weakSelf.completeBlock(2);
                }
            }];
            
        };
    }
    return _thirdButton;
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
