//
//  XYUtils.m
//  XYUIFramework
//
//  Created by Xiangyu Wang on 2018/07/16.
//  Copyright © 2018年 WXiangYu. All rights reserved.
//

#import "XYUtils.h"
#import <CommonCrypto/CommonDigest.h>
#import "XYAlertViewController.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import "NSObject+XYUtils.h"
#import "XYAutoLayout.h"
#import "UINavigationController+XYNavigation.h"
#import "XYThemeColor.h"
#import "UIView+XYCornerBorder.h"
#import "XYTabBarViewController.h"
#import "SVProgressHUD+XYCustomization.h"
#import "XYThemeFont.h"
#import <IQKeyboardManager/IQKeyboardManager.h>

@implementation XYUtils

#pragma mark- queue
/**
 在globalQueue中异步执行
 
 @param queue globalQueue
 */
+ (void)executeGlobalQueue:(void (^)(void))queue{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), queue);
}

/**
 在globalQueue中延迟异步执行
 
 @param queue   globalQueue
 @param seconds 延迟时间
 */
+ (void)executeGlobalQueue:(void (^)(void))queue afterSeconds:(CGFloat)seconds{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), queue);
}

/**
 在主线程中异步执行
 
 @param queue mainQueue
 */
+ (void)executeMainQueue:(void (^)(void))queue{
    dispatch_async(dispatch_get_main_queue(), queue);
}

/**
 在主线程中延迟异步执行
 
 @param queue   mainQueue
 @param seconds 延迟时间
 */
+ (void)executeMainQueue:(void (^)(void))queue afterSeconds:(CGFloat)seconds{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), queue);
}

+ (NSString*)encodeUrl:(NSString*)url{
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+ (CGSize)sizeForText:(NSString*)text withWidth:(CGFloat)width withFont:(UIFont*)font{
    if(![text isKindOfClass:NSString.class]){
        return CGSizeMake(0, 0);
    }
    UILabel *gettingSizeLabel = [XYSingletonLabel sharedInstance];
    gettingSizeLabel.font = font;
    gettingSizeLabel.text = text;
    gettingSizeLabel.numberOfLines = 0;
    gettingSizeLabel.lineBreakMode = NSLineBreakByWordWrapping;
    CGSize maximumLabelSize = CGSizeMake(width, MAXFLOAT);
    CGSize expectSize = [gettingSizeLabel sizeThatFits:maximumLabelSize];
    if ([font.fontName isEqualToString:@"DINMittelschriftStd"]) {
        return CGSizeMake(expectSize.width, expectSize.height+2);
    }
    return expectSize;
}

+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andColor:(UIColor *)color{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    if ([allStr isNotEmptyString]) {
        NSRange rangeOne = [allStr rangeOfString:changeStr];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:rangeOne];
    }
    return attributedStr;
}

+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andFont:(UIFont *)font{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    if ([allStr isNotEmptyString]) {

        NSRange rangeOne = [allStr rangeOfString:changeStr];
        [attributedStr addAttribute:NSFontAttributeName value:font range:rangeOne];
    }
    return attributedStr;
}

+ (NSAttributedString*)attributesWithString:(NSString *)allStr andChangeStr:(NSString *)changeStr andFont:(UIFont *)font color:(UIColor *)color{
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString:allStr];
    NSRange rangeOne = [allStr rangeOfString:changeStr];
    [attributedStr addAttribute:NSFontAttributeName value:font range:rangeOne];
    [attributedStr addAttribute:NSForegroundColorAttributeName value:color range:rangeOne];
    return attributedStr;
}

+ (NSString*)convertDictionaryToString:(NSDictionary *)paramters{
    if (!paramters) {
        return nil;
    }
    
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:paramters
                                                       options:0
                                                         error:&error];
    
    if (! jsonData) {
        NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        return @"{}";
    } else {
        NSMutableString *convertString = [[NSMutableString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSString *character = nil;
        for (int i = 0; i < convertString.length; i ++) {
            character = [convertString substringWithRange:NSMakeRange(i, 1)];
            if ([character isEqualToString:@"\\"])
                [convertString deleteCharactersInRange:NSMakeRange(i, 1)];
        }
        return convertString;
    }
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

//是否是汉字字符
+ (BOOL)isChineseCharacter:(NSString*)string{
    if(string.length>0){
        unichar c = [string characterAtIndex:0];
        if (c >=0x4E00 && c <=0x9FFF)
        {
            return YES;
        }
    }
    return NO;
}

//MD5加密
+(NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}

//sha1加密方式
+ (NSString *) sha1:(NSString *)input
{
    const char *cstr = [input cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:input.length];
    
    //NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+(NSString *)base64EncodeString:(NSString *)string
{
    //1.先把字符串转换为二进制数据
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    //2.对二进制数据进行base64编码，返回编码后的字符串
    return [data base64EncodedStringWithOptions:0];
}

+ (BOOL)containChineseCharacter:(NSString*)string{
    BOOL contain = NO;
    for(int i=0;i<string.length;i++){
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [string substringWithRange:range];
        if([XYUtils isChineseCharacter:subString]){
            return YES;
        }
    }
    return contain;
}

+ (NSString *)removeUnderscoreAndInitials:(NSString *)string {
    NSString *aString = string;
    NSString *separateString = @"_";
    NSRange range = [aString rangeOfString:separateString];
    if (range.location != NSNotFound) {
        NSArray *subStrings = [aString componentsSeparatedByString:separateString];
        NSMutableArray *muteStrings = [NSMutableArray arrayWithArray:subStrings];
        [subStrings enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            //首字母有数字则次位大写
            if (idx > 0) [muteStrings replaceObjectAtIndex:idx withObject:[obj capitalizedString]];
        }];
        return [muteStrings componentsJoinedByString:@""];
    }
    return aString;
}

+(CGSize)fuwenbenLabel:(UILabel *)labell AndLineSpacing:(float)lineSpacing wordSpaceing:(float)wordSpacing
{
    //富文本设置文字行间距
    NSMutableAttributedString *attributedString;
    if (labell.attributedText) {
        attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:labell.attributedText];;
    }else{
        attributedString = [[NSMutableAttributedString alloc]initWithString:labell.text];;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setLineSpacing:lineSpacing];
    [attributedString addAttribute:NSKernAttributeName value:@(wordSpacing) range:NSMakeRange(0, labell.text.length)];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, labell.text.length)];
    
    labell.attributedText = attributedString;
    //调节高度
    CGSize size = CGSizeMake(SAFEAREA_WIDTH, 500000);
    
    CGSize labelSize = [labell sizeThatFits:size];
    
    return labelSize;
}

+ (CGSize)fuwenbenLabel:(UILabel *)detailLabel lineSpacing:(float)lineSpacing labelWidth:(CGFloat)labelWidth{
    //富文本设置文字行间距
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:detailLabel.text];;
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    [paragraphStyle setMinimumLineHeight:lineSpacing];
    [paragraphStyle setMaximumLineHeight:lineSpacing];

    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, detailLabel.text.length)];
    
    detailLabel.attributedText = attributedString;
    
    return [detailLabel sizeThatFits:CGSizeMake(labelWidth, MAXFLOAT)];
}

+ (void)showModelVC:(XYModelViewController*)modelVC{
    if ([[[UINavigationController getDisplayingViewController] class] isEqual:[modelVC class]]) {
        return;
    }
    if ([[UINavigationController getDisplayingViewController] isKindOfClass:[XYModelViewController class]]) {
        XYModelViewController *showModelVC = (XYModelViewController*)[UINavigationController getDisplayingViewController];
        if (showModelVC.windowLevel == ShowWindowLevelAlert) {
            [XYUtils toShowModelVC:modelVC];
        }else{
            if (showModelVC.windowLevel < modelVC.windowLevel) {
                [showModelVC dismissViewControllerAnimated:NO completion:^{
                    [XYUtils toShowModelVC:modelVC];
                }];
            }
        }
    }else{
        [XYUtils toShowModelVC:modelVC];
    }
    
}

+ (void)toShowModelVC:(XYModelViewController*)modelVC{
    [[UINavigationController getDisplayingViewController].view endEditing:YES];
    modelVC.providesPresentationContextTransitionStyle = YES;
    modelVC.definesPresentationContext = YES;
    modelVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    
    if ([UINavigationController getDisplayingNavigationController].viewControllers.count == 1) {
        [XY_KEY_WINDOW.rootViewController presentViewController:modelVC animated:YES completion:nil];
    }else if([UINavigationController getDisplayingViewController]){
        [[UINavigationController getDisplayingViewController] presentViewController:modelVC animated:YES completion:nil];
    }else{
        [[UINavigationController getDisplayingViewControllerWithRootViewController:[XYTabBarViewController sharedInstance]] presentViewController:modelVC animated:YES completion:nil];
    }

}
+ (void)showAlertWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitle completeBlock:(IntergerBlock)completeBlock{
    [[UINavigationController getDisplayingViewController].view endEditing:YES];

    [XYUtils executeMainQueue:^{
        [[XYAlertViewController sharedInstance] alertWithTitle:title message:message cancelButtonTitle:cancelButtonTitle otherButtonTitle:otherButtonTitle anotherButtonTitle:nil completeBlock:completeBlock];
        [XYUtils showModelVC:[XYAlertViewController sharedInstance]];
    } afterSeconds:0.1f];
}

//计算收益
+(NSString *)caculateBenefitAccordingMoney:(NSString *)money rate:(NSString *)rates duration:(NSString *)durations{
    if (rates.length == 0 || [durations isEqualToString:@"0"]|| money.length == 0||durations.length == 0) {
        return  @"0.00";
    }
    
    NSDecimalNumber *rate = [NSDecimalNumber decimalNumberWithString:rates];
    NSDecimalNumber *price = [NSDecimalNumber decimalNumberWithString:money];
    NSDecimalNumber *duration = [NSDecimalNumber decimalNumberWithString:durations];
    
    NSDecimalNumber *a = [NSDecimalNumber decimalNumberWithString:@"100"];
    NSDecimalNumber *b = [NSDecimalNumber decimalNumberWithString:@"365"];
    NSDecimalNumber *dayRate = [rate decimalNumberByDividingBy:a];
    NSDecimalNumber *dayRatee = [dayRate decimalNumberByDividingBy:b];
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:16 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *benefit = [dayRatee decimalNumberByRoundingAccordingToBehavior:roundUp];
    NSDecimalNumber *second = [benefit decimalNumberByMultiplyingBy:price];
    NSDecimalNumber *third = [second decimalNumberByMultiplyingBy:duration];
    
    NSDecimalNumberHandler* roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    NSDecimalNumber *lastD = [third decimalNumberByRoundingAccordingToBehavior:roundingBehavior];
    NSString *last = [NSString stringWithFormat:@"%@",lastD];//不带千分位
    return last;
}

//判断是否含有非法字符 yes 有  no没有
+ (BOOL)JudgeTheillegalCharacter:(NSString *)content{
    //提示 标签不能输入特殊字符
    NSString *str =@"^[A-Za-z0-9\\u4e00-\u9fa5]+$";
    NSPredicate* emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", str];
    if (![emailTest evaluateWithObject:content]) {
        return YES;
    }
    return NO;
}

+(void)showBadgeOnItemIndex:(int)index fromControl:(UIViewController *)control{
    
    //移除之前的小红点
    [self removeBadgeOnItemIndex:index fromControl:control];
    
    //新建小红点
    UIView *badgeView = [[UIView alloc]init];
    badgeView.tag = 888 + index;
    [badgeView addCornerWithCornerRadius:5.f];
    badgeView.backgroundColor = [XYThemeColor redColor];
    CGRect tabFrame = control.tabBarController.tabBar.frame;
    
    //确定小红点的位置
    float percentX = (index + 0.6) /control.tabBarController.tabBar.items.count;
    CGFloat x = ceilf(percentX * tabFrame.size.width-8);
    CGFloat y = ceilf(0.05 * tabFrame.size.height);
    badgeView.frame = CGRectMake(x, y, 10, 10);
    [control.tabBarController.tabBar addSubview:badgeView];
}

+(void)removeBadgeOnItemIndex:(int)index fromControl:(UIViewController *)control{
    //按照tag值进行移除
    for (UIView *subView in control.tabBarController.tabBar.subviews) {
        
        if (subView.tag == 888+index) {
            [subView removeFromSuperview];
        }
    }
}

//获取钱小数点整数部分,不需要四舍五入的
+(NSString *)getIntValue:(NSString *)money{
    
    NSString *needStr = nil;
    NSArray *array = [money componentsSeparatedByString:@"."];
    needStr = array[0];
    return needStr;
}

+(NSString*)getCurrentTimeYYYY_MM_DD{
    
    NSDateFormatter *fromatter = [[NSDateFormatter alloc]init];
    [fromatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dataTime = [fromatter stringFromDate:[NSDate date]];
    
    return dataTime;
}

+ (void)showAlert:(NSString *)msg withCancelTitle:(NSString *)cancleTitle
{
    [XYUtils showAlertWithTitle:nil message:msg cancelButtonTitle:cancleTitle otherButtonTitles:nil completeBlock:nil];
}

+ (BOOL)containsString:(NSString*)string inString:(NSString*)longString{
    NSRange range = [longString rangeOfString:string];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}
+ (void)setJpuchAlias{
//    if ([XYUtils isNotLogin]){
//        [JPUSHService setTags:[[NSSet alloc]initWithObjects:@"offline", nil] alias:@"" callbackSelector:nil object:self];
//    }else{
//        //登录的情况下
//        NSMutableSet *tags = [[NSMutableSet alloc] initWithObjects:@"online", nil];
//        if (!CurrentUser.investFlag.boolValue) {
//            [tags addObject:@"newbie"];
//        }
//        [JPUSHService setTags:tags alias:CurrentUser.userCode callbackSelector:nil object:self];
//    }
}

+ (BOOL) isNotLogin
{
    if ([NSHTTPCookieStorage sharedHTTPCookieStorage].cookies.count>0) {
        return NO;
    }
    return NO;
}

+(BOOL)checkPassword:(NSString *)password;
{
    NSString * pattern = @"^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,20}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",pattern];
    BOOL isMatch = [pred evaluateWithObject:password];
    return isMatch;
}
+ (void)setUpAppearance{
    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    [SVProgressHUD setupDefault];
    
    NSDictionary *normalAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[XYThemeColor navigationTitleColor],NSForegroundColorAttributeName,[XYThemeFont navigationTitleFont],NSFontAttributeName, nil];
    
    [[UINavigationBar appearance] setTitleTextAttributes:normalAttributes];
    [[UINavigationBar appearance] setTranslucent:NO];
    
    //    [[UINavigationBar appearance] setBarTintColor:NavigationBarColor];
    //隐藏导航栏底部的线条 1、
    [[UINavigationBar appearance] setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
}
@end

@implementation XYSingletonLabel

+ (XYSingletonLabel *)sharedInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        sharedInstance = [[self alloc] initSingleton];
    });
    return sharedInstance;
}

- (instancetype)initSingleton{
    self = [super init];
    if(self){
    }
    return self;
}

- (instancetype)init{
    return [XYSingletonLabel sharedInstance];
}

@end

