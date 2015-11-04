//
//  NSString+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDProcess)

- (NSString *)ddTrimEndsSpace;
- (NSString *)ddTrimAllSpace;
- (NSString *)ddTrimSpecialCode;

- (BOOL)ddIsEmpty;
- (NSDictionary *)ddStringToDictionary;

@end

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
+ (NSString *)ddCountryCode;
+ (NSString *)ddCallid;

@end