//
//  NSString+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDPath)

+ (NSString *)ddDocumentsPath;
+ (NSString *)ddCachesPath;
+ (NSString *)ddTmpPath;

@end

@interface NSString (DDSystem)

+ (NSString *)ddBundleIdentifier;
+ (NSString *)ddAppVersion;
+ (NSString *)ddBuildVersion;
+ (NSString *)ddSystemTimeZone;
+ (NSString *)ddSystemLanguage;
+ (NSString *)ddCallid;

@end

@interface NSString (DDNetWork)

/**
 *  处理字符串中的换行符、回车符
 *
 *  @return 处理后的String
 */
- (NSString *)ddDeleteSpecialCode;

@end