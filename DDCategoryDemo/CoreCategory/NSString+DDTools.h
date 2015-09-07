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

@interface NSString (DDNetWork)

+ (NSString *)ddQueryStringWithDict:(NSDictionary *)dict;

@end