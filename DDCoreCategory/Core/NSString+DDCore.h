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
 *  @brief 返回Documents目录
 *
 *  @return NSString
 */
+ (NSString *)dd_documentsPath;

/**
 *  @brief 返回Caches目录
 *
 *  @return NSString
 */
+ (NSString *)dd_cachesPath;

/**
 *  @brief 返回Tmp目录
 *
 *  @return NSString
 */
+ (NSString *)dd_tmpPath;


/**
 返回bundleId

 @return NSString
 */
+ (NSString *)dd_bundleIdentifier;

/**
 *  @brief 返回app的版本CFBundleShortVersionString
 *
 *  @return NSString
 */
+ (NSString *)dd_appVersion;

/**
 *  @brief 返回app的Bundle版本CFBundleVersion
 *
 *  @return NSString
 */
+ (NSString *)dd_buildVersion;

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
