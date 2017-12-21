//
//  NSString+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDCore)

/**
 *  @brief 返回系统时区
 *
 *  @return NSString
 */
+ (NSString *)dd_systemTimeZone;

/**
 *  @brief 返回系统语言
 *
 *  @return NSString
 */
+ (NSString *)dd_systemLanguage;

/**
 *  @brief 返回国家代码
 *
 *  @return NSString
 */
+ (NSString *)dd_countryCode;


/**
 *  @brief 去掉字符串两端多余的空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)dd_trimEndsSpace;

/**
 *  @brief 去掉字符串中所有空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)dd_trimAllSpace;

/**
 *  @brief 去掉字符串中特殊的字符(回车\换行\跳格)
 *
 *  @return 处理后的字符串
 */
- (NSString *)dd_trimSpecialCode;

/**
 判断一个字符串是否为空字符串

 @param string NSString
 @return YES ？ 不空 ： 空
 */
+ (BOOL)dd_emptyString:(NSString *)string;

@end
