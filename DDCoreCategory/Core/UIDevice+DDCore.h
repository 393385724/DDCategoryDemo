//
//  UIDevice+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (DDCore)

/**
 获取当前屏幕的高度

 @return CGFloat
 */
+ (CGFloat)dd_screenHeight;

/**
 获取当前屏幕的宽度
 
 @return CGFloat
 */
+ (CGFloat)dd_screenWidth;

/**
 获取当前屏幕的Scale
 
 @return CGFloat
 */
+ (CGFloat)dd_screenScale;

/**
 获取当前的系统版本

 @return NSString
 */
+ (NSString *)dd_systemVersion;

/**
 判断当前的系统是否低于指定版本

 @param version 指定系统版本
 @return YES ？ 是 ： 否
 */
+ (BOOL)dd_systemVersionLessThanVersion:(NSString *)version;

/**
 判断当前的系统是否等于指定版本
 
 @param version 指定系统版本
 @return YES ？ 是 ： 否
 */
+ (BOOL)dd_systemVersionEqualToVersion:(NSString *)version;

/**
 判断当前的系统是否高于指定版本
 
 @param version 指定系统版本
 @return YES ？ 是 ： 否
 */
+ (BOOL)dd_systemVersionGreaterThanVersion:(NSString *)version;

/**
 当前手机是都越狱

 @return YES ？ 已经越狱 ： 未越狱
 */
+ (BOOL)dd_jailBreak;

@end
