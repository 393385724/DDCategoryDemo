//
//  UIDevice+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UIDevice+DDTools.h"
#import <SSKeychain/SSKeychain.h>

#include <sys/sysctl.h>

NSString *const DDSSKeychainUniquenessIdentifierServece = @"DDSSKeychainUniquenessIdentifierServece";
NSString *const DDSSKeychainUniquenessIdentifierAccount = @"DDSSKeychainUniquenessIdentifierAccount";

@implementation UIDevice (DDSystem)

+ (NSString *)ddUniquenessIdentifier{
    NSError *error = nil;
    NSString *identifier = [SSKeychain passwordForService:DDSSKeychainUniquenessIdentifierServece account:DDSSKeychainUniquenessIdentifierAccount error:&error];
    if (!identifier || error) {
        identifier = [[UIDevice currentDevice].identifierForVendor UUIDString];
        [SSKeychain setPassword:identifier forService:DDSSKeychainUniquenessIdentifierServece account:DDSSKeychainUniquenessIdentifierAccount error:&error];
    }
    if (error) {
        NSLog(@"%@--%@",NSStringFromSelector(_cmd),error);
    }
    return identifier;
}

+ (NSString *)ddAppVersion{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}


+ (BOOL)ddIsJailBreak {
    BOOL jailbroken = NO;
    NSString *cydiaPath = @"/Applications/Cydia.app";
    NSString *aptPath = @"/private/var/lib/apt/";
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:cydiaPath]) {
        jailbroken = YES;
    }
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:aptPath]) {
        jailbroken = YES;
    }
    
    return jailbroken;
}

+ (NSString *)ddMachineName{
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    NSString *machineName = [NSString stringWithUTF8String:machine];
    free(machine);
    return machineName;
}

+ (BOOL)ddBelow6 {
    return [self ddSystemVersionLessThanVersion:@"6.0"];
}

+ (BOOL)ddBelow7 {
    return [self ddSystemVersionLessThanVersion:@"7.0"];
}

+ (BOOL)ddBelow8 {
    return [self ddSystemVersionLessThanVersion:@"8.0"];
}

+ (BOOL)ddBelow9 {
    return [self ddSystemVersionLessThanVersion:@"9.0"];
}


#pragma mark - Private Methods

+ (BOOL)ddSystemVersionLessThanVersion:(NSString *)version{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedAscending;
}

+ (BOOL)ddSystemVersionEqualToVersion:(NSString *)version{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedSame;
}

+ (BOOL)ddSystemVersionGreaterThanVersion:(NSString *)version{
    return [[[UIDevice currentDevice] systemVersion] compare:version options:NSNumericSearch] == NSOrderedDescending;
}



@end

@implementation UIDevice (DDScreen)

+ (CGFloat)ddScreenHeight {
    return [UIScreen mainScreen].bounds.size.height;
}

+ (CGFloat)ddScreenWidth {
    return [UIScreen mainScreen].bounds.size.width;
}

+ (CGFloat)ddScreenScale{
    if ([UIScreen instancesRespondToSelector:@selector(scale)]) {
        return [[UIScreen mainScreen] scale];
    }
    return 1.0f;
}

+ (BOOL)ddIsRetina {
    CGFloat screenScale = [self ddScreenScale];
    return screenScale > 1.0 ? YES : NO;
}

@end


