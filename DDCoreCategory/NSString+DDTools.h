//
//  NSString+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDProcess)
/**
 *  @brief 去掉字符串两端多余的空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)ddTrimEndsSpace;

/**
 *  @brief 去掉字符串中所有空格
 *
 *  @return 处理后的字符串
 */
- (NSString *)ddTrimAllSpace;

/**
 *  @brief 去掉字符串中特殊的字符(回车\换行\跳格)
 *
 *  @return 处理后的字符串
 */
- (NSString *)ddTrimSpecialCode;

/**
 *  @brief 判断字符串是否为空
 *
 *  @return YES ? 空字符串 : 不是空字符串
 */
- (BOOL)ddIsEmpty;

/**
 *  @brief 判断字符串是不是纯数字
 *
 *  @return YES ? 纯数字字符串 : 不是纯数字字符串
 */
- (BOOL)ddIsDecimalDigit;

/**
 *  @brief 字符串转字典
 *
 *  @return NSDictionary 转换失败则为nil
 */
- (NSDictionary *)ddStringToDictionary;

/**
 *  @brief 字符串转数组
 *
 *  @return NSArray 转换失败则为nil
 */
- (NSArray *)ddStringToArray;

@end

@interface NSString (DDPath)

/**
 *  @brief 返回Documents目录
 *
 *  @return NSString
 */
+ (NSString *)ddDocumentsPath;

/**
 *  @brief 返回Caches目录
 *
 *  @return NSString
 */
+ (NSString *)ddCachesPath;

/**
 *  @brief 返回Tmp目录
 *
 *  @return NSString
 */
+ (NSString *)ddTmpPath;

@end

@interface NSString (DDSystem)

/**
 *  @brief 返回bundleId
 *
 *  @return NSString
 */
+ (NSString *)ddBundleIdentifier;

/**
 *  @brief 返回app的版本CFBundleShortVersionString
 *
 *  @return NSString
 */
+ (NSString *)ddAppVersion;

/**
 *  @brief 返回app的Bundle版本CFBundleVersion
 *
 *  @return NSString
 */
+ (NSString *)ddBuildVersion;

/**
 *  @brief 返回系统时区
 *
 *  @return NSString
 */
+ (NSString *)ddSystemTimeZone;

/**
 *  @brief 返回系统语言
 *
 *  @return NSString
 */
+ (NSString *)ddSystemLanguage;

/**
 *  @brief 返回国家代码
 *
 *  @return NSString
 */
+ (NSString *)ddCountryCode;

/**
 *  @brief 返回时间戳字符串 毫秒
 *
 *  @return NSString
 */
+ (NSString *)ddCallid;

@end