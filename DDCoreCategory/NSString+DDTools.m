//
//  NSString+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSString+DDTools.h"

@implementation NSString (DDPath)

+ (NSString *)ddDocumentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    return docDir;
}

+ (NSString *)ddCachesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}

+ (NSString *)ddTmpPath{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

@end

@implementation NSString (DDSystem)

+ (NSString *)ddAppVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)ddBundleIdentifier{
    NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)ddBuildVersion{
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return bundleVersion;
}

+ (NSString *)ddSystemTimeZone{
    NSString *timeZone = [[NSTimeZone systemTimeZone] name];
    return timeZone;
}

+ (NSString *)ddSystemLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    if ([currentLanguage isEqualToString:@"zh-Hans"]){
        return @"zh";
    }
    else if ([currentLanguage isEqualToString:@"zh-Hant"]){
        return @"zh_TW";
    }
    else if ([currentLanguage isEqualToString:@"zh-Hant-HK"]){
        return @"zh_HK";
    }
    return currentLanguage;
}

+ (NSString *)ddCountryCode{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}

+ (NSString *)ddCallid{
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *timeStampStr = [NSString stringWithFormat:@"%.0f",timestamp];
    return timeStampStr;
}
@end


@implementation NSString (DDNetWork)

- (NSString *)ddDeleteSpecialCode{
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return string;
}

@end
