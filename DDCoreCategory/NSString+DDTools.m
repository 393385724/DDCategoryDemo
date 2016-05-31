//
//  NSString+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSString+DDTools.h"

@implementation NSString (DDProcess)

- (NSString *)ddTrimEndsSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)ddTrimAllSpace{
    return  [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
}

- (NSString *)ddTrimSpecialCode{
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return string;
}

- (BOOL)ddIsEmpty{
    if (![self isKindOfClass:[NSString class]]) {
        return YES;
    }
    if ([[self ddTrimEndsSpace] length]) {
        return NO;
    }
    return YES;
}

- (BOOL)ddIsDecimalDigit{
    NSString *string = [self stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0){
        return NO;
    }
    return YES;
}


- (NSDictionary *)ddStringToDictionary{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"string to dictionary error:%@",error);
    }
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return dict;
}

- (NSArray *)ddStringToArray{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"string to array error:%@",error);
    }
    if (![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return array;
}
@end

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

+ (NSString *)ddBundleIdentifier{
    NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)ddAppVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
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
    if ([currentLanguage hasPrefix:@"zh-Hans"]){
        return @"zh";
    }
    else if ([currentLanguage hasPrefix:@"zh-Hant"]){
        return @"zh_TW";
    }
    else if ([currentLanguage hasPrefix:@"zh-Hant-HK"]){
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
