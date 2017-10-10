//
//  UIDevice+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIDevice+DDCore.h"

@implementation UIDevice (DDCore)

+ (CGFloat)dd_screenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)dd_screenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)dd_screenScale{
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        return [[UIScreen mainScreen] scale];
    }
    return 1.0f;
}

+ (NSString *)dd_systemVersion{
    return [[UIDevice currentDevice] systemVersion];
}

+ (BOOL)dd_systemVersionLessThanVersion:(NSString *)version {
    return [[self dd_systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending;
}

+ (BOOL)dd_systemVersionEqualToVersion:(NSString *)version {
    return [[self dd_systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame;
}

+ (BOOL)dd_systemVersionGreaterThanVersion:(NSString *)version {
    return [[self dd_systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending;
}

+ (BOOL)dd_jailBreak {
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath] ||
        [[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    return jailbroken;
}

@end
