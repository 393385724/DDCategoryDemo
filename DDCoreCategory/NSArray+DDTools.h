//
//  NSArray+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DDProcess)

/**
 *  @brief 数组转为json
 *
 *  @param trim 是否去掉无用的符号(回车\换行\跳格)
 *
 *  @return 转换后的字符串
 */
- (NSString *)ddArrayToJsonStringTrim:(BOOL)trim;

@end

@interface NSArray (DDFile)

/**
 *  @brief 读取文件并生成数组对象
 *
 *  @param path 数据存储的路径
 *
 *  @return NSArray
 */
+ (NSArray *)ddReadFromDataFile:(NSString *)path;

/**
 *  @brief 将数组写入到文件
 *
 *  @param path       文件路径
 *  @param atomically 如果是的,数据写入一个备份文件,并假设没有错误发生的备份文件重命名名称指定的路径,否则,直接将数据写入路径
 *
 *  @return YES ? 写入成功 : 写入失败
 */
- (BOOL)ddWriteToDataFile:(NSString *)path atomically:(BOOL)atomically;

@end

@interface NSMutableArray (DDLogic)
/**
 *  @brief 数组自身反转
 */
- (void)ddReverse;

@end

@interface NSArray (DDSafety)

/**
 *  @brief 安全的查找指定index的元素
 *
 *  @param index 需要查找的index
 *
 *  @return 数组中的元素
 */
- (id)ddObjectAtSafeIndex:(NSUInteger)index;

@end

@interface NSMutableArray (DDSafety)

/**
 *  @brief 数组中安全的增加一个元素
 *
 *  @param object 要增加的元素
 */
- (void)ddAddSafeObject:(id)object;

/**
 *  @brief 数组中安全的插入一个元素
 *
 *  @param object 要插入的元素
 *  @param index  插入的index
 */
- (void)ddInsertSafeObject:(id)object atIndex:(NSUInteger)index;

@end