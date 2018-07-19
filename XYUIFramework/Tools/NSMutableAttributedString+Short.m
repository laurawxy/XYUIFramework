//
//  NSMutableAttributedString+Short.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "NSMutableAttributedString+Short.h"

@implementation NSMutableAttributedString (Short)

+(id)string:(NSString*)string
      color:(UIColor*)color
       font:(UIFont*)font
{
    
    if (!string)
    {
        return nil;
    }
    if (!color)
    {
        color = [UIColor blackColor];
    }
    if (!font)
    {
        font = [UIFont systemFontOfSize:13];
    }
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:string];
    [str addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, str.length)];
    [str addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, str.length)];
    
    return str;
}

+(id)stringWithProgress:(NSString*)progress font:(UIFont*)font color:(UIColor*)color
{
    NSMutableAttributedString *progressStr = [NSMutableAttributedString string:progress color:color font:font];
    NSMutableAttributedString *percentStr = [NSMutableAttributedString string:@"%" color:color font:[UIFont systemFontOfSize:18]];
    [progressStr appendAttributedString:percentStr];
    return progressStr;
}

+(id)stringWithProgressNot:(NSString*)progress font:(UIFont*)font color:(UIColor*)color
{
    NSMutableAttributedString *progressStr = [NSMutableAttributedString string:progress color:color font:font];
    NSMutableAttributedString *percentStr = [NSMutableAttributedString string:@"" color:color font:[UIFont systemFontOfSize:18]];
    [progressStr appendAttributedString:percentStr];
    return progressStr;
}

-(void)paragraphLineSpace:(CGFloat)lineSpace
                alignment:(NSTextAlignment)alignment
{
    NSMutableParagraphStyle *ps = [NSMutableParagraphStyle new];
    ps.lineSpacing = lineSpace;
    ps.alignment = alignment;
    [self addAttribute:NSParagraphStyleAttributeName value:ps range:NSMakeRange(0, self.length)];
}

-(id)appendWithArray:(NSArray*)array
{
    if (!array)
    {
        return self;
    }
    
    [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop)
    {
        if ([obj isKindOfClass:[NSString class]])
        {
            NSAttributedString *str = [[NSAttributedString alloc]initWithString:obj];
            [self appendAttributedString:str];
        }
        else if ([obj isKindOfClass:[NSAttributedString class]] || [obj isKindOfClass:[NSMutableAttributedString class]] )
        {
            [self appendAttributedString:obj];
        }
        else
        {
            NSLog(@"%@不是正确类型",obj);
        }
        
    }];
    return self;
}

@end
