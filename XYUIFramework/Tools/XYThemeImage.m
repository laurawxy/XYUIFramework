//
//  XYThemeImage.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYThemeImage.h"

@implementation XYThemeImage

+ (UIImage *)icon_navi_back{
    
    return [UIImage imageNamed:@"dogFood"];
}
+ (UIImage *)icon_noInternet{
    return [UIImage imageNamed:@"dogFood"];
}
+ (UIImage *)icon_noData{
    return [UIImage imageNamed:@"dogFood"];
}
+ (UIImage *)icon_toast_success{
    return [UIImage imageNamed:@"dogFood"];
}
+ (UIImage *)icon_toast_failure{
    return [UIImage imageNamed:@"dogFood"];
}

+ (UIImage *)icon_tabbar_home_default{
    return [UIImage imageNamed:@"dogFood"];
}

+ (UIImage *)icon_tabbar_home_selected{
    return [UIImage imageNamed:@"dogFood"];
}

+ (UIImage *)icon_tabbar_my_default{
    return [UIImage imageNamed:@"dogFood"];
}

+ (UIImage *)icon_tabbar_my_Selected{
    return [UIImage imageNamed:@"dogFood"];
}


+ (CGFloat)scaleHeightWithImage:(UIImage*)image width:(CGFloat)width{
    return image.size.height*width/image.size.width;
}

+ (UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect{
    
    //把像 素rect 转化为 点rect（如无转化则按原图像素取部分图片）
    CGFloat scale = [UIScreen mainScreen].scale;
    CGFloat x= rect.origin.x*scale,y=rect.origin.y*scale,w=rect.size.width*scale,h=rect.size.height*scale;
    CGRect dianRect = CGRectMake(x, y, w, h);
    
    //截取部分图片并生成新图片
    CGImageRef sourceImageRef = [image CGImage];
    CGImageRef newImageRef = CGImageCreateWithImageInRect(sourceImageRef, dianRect);
    UIImage *newImage = [UIImage imageWithCGImage:newImageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];
    return newImage;
}

//  颜色转换为背景图片
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size cornerRadious:(CGFloat)cornerRadious{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return [XYThemeImage roundedCornerImageWithImage:image cornerRadious:cornerRadious];
}



+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (NSArray<UIImage*>*)imagesWithGifFile:(NSString*)fileName{
    NSURL *fileUrl = [[NSBundle mainBundle] URLForResource:fileName withExtension:@"gif"]; //加载GIF图片
    CGImageSourceRef gifSource = CGImageSourceCreateWithURL((CFURLRef) fileUrl, NULL);           //将GIF图片转换成对应的图片源
    size_t frameCout = CGImageSourceGetCount(gifSource);                                         //获取其中图片源个数，即由多少帧图片组成
    NSMutableArray *frames = [[NSMutableArray alloc] init];                                      //定义数组存储拆分出来的图片
    for (size_t i = 0; i < frameCout; i++) {
        CGImageRef imageRef = CGImageSourceCreateImageAtIndex(gifSource, i, NULL); //从GIF图片中取出源图片
        UIImage *imageName = [UIImage imageWithCGImage:imageRef scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp];                  //将图片源转换成UIimageView能使用的图片源
        [frames addObject:imageName];                                              //将图片加入数组中
        CGImageRelease(imageRef);
    }
    return frames;
}

+ (UIImage *)roundedCornerImageWithImage:(UIImage *)image cornerRadious:(CGFloat)cornerRadious{
    CGFloat w = image.size.width;
    CGFloat h = image.size.height;
    
    CGFloat scale = [UIScreen mainScreen].scale;
    
    if (cornerRadious < 0) {
        cornerRadious = 0;
    }else if(cornerRadious > MIN(w, h)){
        cornerRadious = MIN(w, h)/2.0;
    }
    
    UIImage *returnImage = nil;
    CGRect imageFrame = CGRectMake(0, 0, w, h);
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:imageFrame cornerRadius:cornerRadious] addClip];
    
    [image drawInRect:imageFrame];
    returnImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return returnImage;
}

@end
