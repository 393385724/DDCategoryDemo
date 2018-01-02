//
//  NSString+DDPath.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/6.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDPath)

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


@end
