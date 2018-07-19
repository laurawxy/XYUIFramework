//
//  NSMutableAttributedString+Short.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSMutableAttributedString (Short)


//把string转为为指定font、color的
+(id)string:(NSString*)string
      color:(UIColor*)color
       font:(UIFont*)font;


//传入数字 及字形  返回带百分号 
+(id)stringWithProgress:(NSString*)progress font:(UIFont*)font color:(UIColor*)color;
//传入数字 及字形  返回不带百分号
+(id)stringWithProgressNot:(NSString*)progress font:(UIFont*)font color:(UIColor*)color;

//设置自身行间距及居中位置
-(void)paragraphLineSpace:(CGFloat)lineSpace
                alignment:(NSTextAlignment)alignment;

//拼接数组中的字符串
-(id)appendWithArray:(NSArray*)array;


@end

