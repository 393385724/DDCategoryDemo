//
//  NSString+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSString+DDCore.h"

@implementation NSString (DDCore)

+ (NSString *)dd_documentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    return docDir;
}

+ (NSString *)dd_cachesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}

+ (NSString *)dd_tmpPath{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

+ (NSString *)dd_bundleIdentifier{
    NSString *bundleIdentifier = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)dd_appVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)dd_buildVersion{
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return bundleVersion;
}

+ (NSString *)dd_systemTimeZone{
    NSString *timeZone = [[NSTimeZone systemTimeZone] name];
    return timeZone;
}

+ (NSString *)dd_systemLanguage{
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    return currentLanguage;
}

+ (NSString *)dd_countryCode{
    return [[NSLocale currentLocale] objectForKey:NSLocaleCountryCode];
}


- (NSString *)dd_trimEndsSpace{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)dd_trimAllSpace{
    return  [[self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] componentsJoinedByString:@""];
}

- (NSString *)dd_trimSpecialCode{
    NSString *string = [self stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return string;
}

+ (BOOL)dd_emptyString:(NSString *)string {
    if (!string) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string dd_trimEndsSpace] length] == 0) {
        return YES;
    }
    return NO;
}

@end
