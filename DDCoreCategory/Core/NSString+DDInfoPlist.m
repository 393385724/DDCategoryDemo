//
//  NSString+DDInfoPlist.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/6.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSString+DDInfoPlist.h"

@implementation NSString (DDInfoPlist)

+ (NSString *)dd_bundleIdentifier{
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)dd_appDisplayName {
    NSString *appName = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
    return appName;
}

+ (NSString *)dd_appVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)dd_buildVersion{
    NSString *bundleVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    return bundleVersion;
}

@end
