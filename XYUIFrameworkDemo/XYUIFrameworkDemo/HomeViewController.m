//
//  HomeViewController.m
//  XYUIFrameworkDemo
//
//  Created by Xiangyu Wang on 2018/7/19.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "HomeViewController.h"
#import "XYNetWorkApi.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTitle:@"首页"];
    
    [XYNetWorkApi startRequestWithParams:nil requestUrl:@"https://duideren.in/api/v1/interest/getInterestList" actionName:@"查找兴趣专区" requestMethod:YTKRequestMethodGET requestSuccessBlock:^(id responseBody) {
        
        
    } requestFaliureBlock:^(id responseBody) {
        
    } networkFaliureBlock:^(NSError *error) {
        
    }];
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
