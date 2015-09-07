//
//  UIDevice+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (DDSystem)

+ (NSString *)ddUniquenessIdentifier;
+ (NSString *)ddAppVersion;
+ (BOOL)ddIsJailBreak;
+ (NSString *)ddMachineName;

+ (BOOL)ddBelow6;
+ (BOOL)ddBelow7;
+ (BOOL)ddBelow8;
+ (BOOL)ddBelow9;

@end

@interface UIDevice (DDScreen)

+ (CGFloat)ddScreenHeight;
+ (CGFloat)ddScreenWidth;
+ (CGFloat)ddScreenScale;
+ (BOOL)ddIsRetina;

@end
