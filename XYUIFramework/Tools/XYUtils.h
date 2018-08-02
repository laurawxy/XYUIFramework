//
//  XYUtils.h
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XYModelViewController.h"
#import "XYCommonDefine.h"

@interface XYUtils : NSObject

#pragma mark- queue
/**
 在globalQueue中执行
 
 @param queue globalQueue
 */
+ (void)executeGlobalQueue:(void (^)(void))queue;

/**
 在globalQueue中延迟执行
 
 @param queue   globalQueue
 @param seconds 延迟时间
 */
+ (void)executeGlobalQueue:(void (^)(void))queue afterSeconds:(CGFloat)seconds;

/**
 在主线程中执行
 
 @param queue mainQueue
 */
+ (void)executeMainQueue:(void (^)(void))queue;

/**
 在主线程中延迟执行
 
 @param queue   mainQueue
 @param seconds 延迟时间
 */
+ (void)executeMainQueue:(void (^)(void))queue afterSeconds:(CGFloat)seconds;

+ (NSString*)encodeUrl:(NSString*)url;

/**
 md5加密

 @param input 加密内容
 @return 加密后内容
 */
+ (NSString *)md5:(NSString *) input;

/**
 sha1加密方式

 @param input 加密内容
 @return 加密后内容
 */
+ (NSString *)sha1:(NSString *)input;

/**
 base64编码

 @param string 待编码内容
 @return 编码后内容
 */
+ (NSString *)base64EncodeString:(NSString *)string;

/**
 把字典转换成字符串
 
 @param paramters 待转字典
 @return 字符串
 */
+ (NSString*)convertDictionaryToString:(NSDictionary *)paramters;

/**
 把字符串转换成字典

 @param jsonString 待转字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 字符串中是否包含中文
 
 @param string 字符串
 @return 结果
 */
+ (BOOL)containChineseCharacter:(NSString*)string;

/**
 判断特殊字符

 @param content 内容
 @return 结果
 */
+(BOOL)JudgeTheillegalCharacter:(NSString *)content;

/**
 获取当前时间

 @return 当前时间
 */
+(NSString*)getCurrentTimeYYYY_MM_DD;

/**
 移除下划线

 @param string string
 @return string
 */
+ (NSString *)removeUnderscoreAndInitials:(NSString *)string;

/**
 文字占用区域

 @param text text
 @param width 最大宽度
 @param font 字体
 @return CGSize
 */
+ (CGSize)sizeForText:(NSString*)text withWidth:(CGFloat)width withFont:(UIFont*)font;

/**
 NSAttributedString

 @param allStr 整体文字
 @param changeStr 改变文字
 @param color 改变颜色
 @return NSAttributedString
 */
+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andColor:(UIColor *)color;

/**
 NSAttributedString
 
 @param allStr 整体文字
 @param changeStr 改变文字
 @param font 改变字体
 @return NSAttributedString
 */
+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andFont:(UIFont *)font;

/**
 NSAttributedString

 @param allStr 整体文字
 @param changeStr 改变文字
 @param font 改变字体
 @param color 改变颜色
 @return NSAttributedString
 */
+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andFont:(UIFont *)font color:(UIColor *)color;

/**
 改变行间距和字间距

 @param detailLabel label
 @param lineSpacing 行间距
 @param wordSpacing 字间距
 @return 文本大小
 */
+ (CGSize)setLabel:(UILabel *)detailLabel lineSpacing:(float)lineSpacing wordSpaceing:(float)wordSpacing;

+ (CGSize)setLabel:(UILabel *)detailLabel lineSpacing:(float)lineSpacing wordSpaceing:(float)wordSpacing textAlignment:(NSTextAlignment)textAlignment;

+ (CGSize)setLabel:(UILabel *)detailLabel lineSpacing:(float)lineSpacing labelWidth:(CGFloat)labelWidth;

+ (CGSize)setLabel:(UILabel *)detailLabel lineSpacing:(float)lineSpacing labelWidth:(CGFloat)labelWidth textAlignment:(NSTextAlignment)textAlignment;

/**
 判断字符串中是否包含

 @param string 包含
 @param longString 字符串
 @return 结果
 */
+ (BOOL)containsString:(NSString*)string inString:(NSString*)longString;


#pragma mark - APP中功能类

/**
 显示提示弹框

 @param title 标题
 @param message 内容
 @param cancelButtonTitle 取消按钮
 @param otherButtonTitle 其他按钮
 @param completeBlock 完成回调
 */
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitle completeBlock:(IntergerBlock)completeBlock;

/**
 显示提示弹框

 @param msg 内容
 @param cancleTitle 取消按钮标题
 */
+ (void)showAlert:(NSString *)msg withCancelTitle:(NSString *)cancleTitle;


/**
 显示模态视图（半透明）

 @param modelVC 模态视图
 */
+ (void)showModelVC:(XYModelViewController*)modelVC;

/**
 计算收益

 @param money 出借金额
 @param rate 出借利率
 @param duration 出借期限
 @return 收益
 */
+ (NSString *)caculateBenefitAccordingMoney:(NSString *)money rate:(NSString *)rate duration:(NSString *)duration;

/**
 获取钱小数点整数部分,不需要四舍五入的

 @param money 小数
 @return 整数部分
 */
+ (NSString *)getIntValue:(NSString *)money;


/**
 显示提示小红点标记

 @param index 显示在的页数
 @param control 来自哪个控制器
 */
+(void)showBadgeOnItemIndex:(int)index fromControl:(UIViewController *)control;

/**
 移除小红点标记

 @param index 显示在的页数
 @param control 来自哪个控制器
 */
+(void)removeBadgeOnItemIndex:(int)index fromControl:(UIViewController *)control;

/**
 设置极光别名
 */
+ (void)setJpuchAlias;

/**
 是否未登录

 @return bool
 */
+ (BOOL) isNotLogin;

/**
 判断密码数字和字母组合

 @param password 密码
 @return 是否符合规则
 */
+(BOOL)checkPassword:(NSString *)password;

+ (void)setUpAppearance;
@end

@interface XYSingletonLabel : UILabel

+ (XYSingletonLabel *)sharedInstance;

@end

