//
//  NSString+DDInfoPlist.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/6.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DDInfoPlist)

/**
 返回bundleId
 
 @return NSString
 */
+ (NSString *)dd_bundleIdentifier;

/**
 返回当前app显示的名字
 
 @return NSString
 */
+ (NSString *)dd_appDisplayName;

/**
 *  @brief 返回app的版本CFBundleShortVersionString
 *
 *  @return NSString
 */
+ (NSString *)dd_appVersion;

/**
 *  @brief 返回app的Bundle版本CFBundleVersion
 *
 *  @return NSString
 */
+ (NSString *)dd_buildVersion;

@end
