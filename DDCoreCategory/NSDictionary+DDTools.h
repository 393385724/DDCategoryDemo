//
//  NSDictionary+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DDProcess)

/**
 *  @brief 字典转为json
 *
 *  @param trim 是否去掉无用的符号(回车\换行\跳格)
 *
 *  @return 转换后的字符串
 */
- (NSString *)ddDictionaryToJsonStringTrim:(BOOL)trim;

@end

@interface NSDictionary (DDFile)

/**
 *  @brief 读取文件并生成字典对象
 *
 *  @param path 数据存储的路径
 *
 *  @return NSDictionary
 */
+ (NSDictionary *)ddReadFromDataFile:(NSString *)path;

/**
 *  @brief 将字典写入到文件
 *
 *  @param path       文件路径
 *  @param atomically 如果是的,数据写入一个备份文件,并假设没有错误发生的备份文件重命名名称指定的路径,否则,直接将数据写入路径
 *
 *  @return YES ? 写入成功 : 写入失败
 */
- (BOOL)ddWriteToDataFile:(NSString *)path atomically:(BOOL)atomically;

@end

@interface NSDictionary (DDNetWork)

/**
 *  将Dict转为get请求中的Query
 *
 *  @return QueryString
 */
- (NSString *)ddQueryString;

@end

@interface NSDictionary (DDSafety)

/**
 *  @brief 根据key值安全返回一个元素
 *
 *  @param aKey 数值对应的key
 *
 *  @return 数值
 */
- (id)ddObjectForSafeKey:(id)aKey;

/**
 *  @brief 根据key值安全返回一个元素
 *
 *  @param aKey  数值对应的key
 *  @param value 默认的数值,当且key对应的值找不到的情况下会使用该值
 *
 *  @return 数值
 */
- (id)ddObjectForSafeKey:(id)aKey defaultValue:(id)value;

@end

@interface NSMutableDictionary (DDSafety)

/**
 *  @brief 安全的给字典设置一个键值对
 *
 *  @param anObject key值对应的数值.
 *  @param aKey     数值对应的key
 */
- (void)ddSetSafeObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end