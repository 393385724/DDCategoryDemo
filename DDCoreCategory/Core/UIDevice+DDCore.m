//
//  UIDevice+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIDevice+DDCore.h"

@implementation UIDevice (DDCore)

+ (DDScreenType)dd_ScreenType {
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        CGFloat currentScreenHeight = [self dd_screenHeight];
        if (currentScreenHeight == 480) {
            return DDScreenType3_5;
        } else if (currentScreenHeight == 568) {
            return DDScreenType4_0;
        } else if (currentScreenHeight == 667) {
            return DDScreenType4_7;
        } else if (currentScreenHeight == 736) {
            return DDScreenType5_5;
        } else if (currentScreenHeight == 2436) {
            return DDScreenType5_8;
        } else {
            return DDScreenTypeUnkown;
        }
    } else {
        return DDScreenTypePad;
    }
}


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

+ (BOOL)dd_iPhoneX {
    return ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO);
}

@end
