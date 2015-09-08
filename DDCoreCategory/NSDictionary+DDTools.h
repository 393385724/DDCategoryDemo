//
//  NSDictionary+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DDFile)

+ (NSDictionary *)ddReadFromDataFile:(NSString *)path;
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

- (id)ddObjectForSafeKey:(id)aKey;
- (id)ddObjectForSafeKey:(id)aKey defaultValue:(id)value;

@end

@interface NSMutableDictionary (DDSafety)

- (void)ddSetSafeObject:(id)anObject forKey:(id <NSCopying>)aKey;

@end