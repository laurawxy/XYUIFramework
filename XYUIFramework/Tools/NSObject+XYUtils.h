//
//  NSObject+XYUtils.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define Dictionary(temp) (NSDictionary*)temp

@interface NSObject (XYUtils)

#pragma mark - String

- (BOOL)isString;
- (BOOL)isNotEmptyString;

-(NSString *)showThousandth;

-(NSString *)showThousandthWithNoBack;

-(NSString *)removeThousandth;
//不带小数点
-(NSString *)removeThousandthWithNoBack;

//保留几位小数且不带四舍五入
-(NSString *)point:(int)point;


#pragma mark - Dictionary
- (BOOL)isDictionary;
- (BOOL)isNotEmptyDictionary;

- (BOOL)isNotEmptyArray;

#pragma mark - Label
- (void)sizeToFitLabelWidth;
- (void)sizeToFitLabelHeight;
- (CGFloat)labelHeight;
- (CGFloat)textfieldHeight;

#pragma mark - imageView
- (void)sizeToFitImageViewSize;

#pragma mark - button
- (void)sizeToFitButtonWidth;

#pragma mark - image


#pragma mark - UIView
- (UIImage *)snapshotImage;
- (UIImage *)setImageWithTintColor:(UIColor *)color;



- (void)removeAllSubView;

@end
