//
//  XYModelViewController.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYModelViewController.h"

@interface XYModelViewController()
@end

@interface XYModelViewController ()

@end

@implementation XYModelViewController

- (void)dealloc{
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _animateView.alpha = 0;
    
    [self showAnimation];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self showAnimation];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
}
- (instancetype)init{
    if (self = [super init]) {
        self.providesPresentationContextTransitionStyle = YES;
        self.definesPresentationContext = YES;
        self.modalPresentationStyle = UIModalPresentationOverCurrentContext;

        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
        [self setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.modalPresentationStyle = UIModalPresentationOverCurrentContext;//关键语句，必须有
    
    UIControl *clickControl = [[UIControl alloc] initWithFrame:self.view.bounds];
    [clickControl addTarget:self action:@selector(tapGesture) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:clickControl];
    
}
- (void)tapGesture{
    
}

- (void)showAnimation {
    if (_animateView && _animateView.alpha == 0.0f) {
        // 动画由小变大
        _animateView.transform = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
        self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];

        [UIView animateWithDuration:0.3f animations:^{
            self.animateView.alpha = 1.0f;
            self.animateView.transform = CGAffineTransformMake(1.0f, 0, 0, 1.0f, 0, 0);
            self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.6];
        } completion:^(BOOL finished) {
            self.animateView.transform = CGAffineTransformIdentity;
        }];
        
    } else if(_animateView) {
        // 动画由大变小
        _animateView.transform = CGAffineTransformMake(1, 0, 0, 1, 0, 0);
        [UIView animateWithDuration:0.3 animations:^{
            self.animateView.alpha = 0.0f;
            self.animateView.transform = CGAffineTransformMake(0.8, 0, 0, 0.8, 0, 0);
            self.view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        } completion:^(BOOL finished) {
            self.animateView.transform = CGAffineTransformIdentity;
        }];
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
