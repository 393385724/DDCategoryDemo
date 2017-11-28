//
//  UIDevice+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DDiPhoneStatusBarHeight (([UIDevice dd_iPhoneX]) ? (44.0f) : (20.0f))
#define DDiPhoneNavigationBarHeight (44.0f)
#define DDiPhoneHomeIndicatorHeight (([UIDevice dd_iPhoneX]) ? (34.0f) : (0.0f))


/**
 屏幕尺寸类型

 - DDScreenType3_5: 3.5英寸(iPhone3GS、iPhone4)
 - DDScreenType4_0: 4.0英寸(iPhone5、iPhone5c、iPhone5S等)
 - DDScreenType4_7: 4.7英寸(iPhone6 之后系列)
 - DDScreenType5_5: 5.5英寸(iPhone Plus系列)
 - DDScreenType5_8: 5.8英寸(iPhineX)
 - DDScreenTypePad: Pad
 - DDScreenTypeUnkown: 暂时未收录尺寸
 */
typedef NS_ENUM(NSUInteger, DDScreenType) {
    DDScreenType3_5,
    DDScreenType4_0,
    DDScreenType4_7,
    DDScreenType5_5,
    DDScreenType5_8,
    DDScreenTypePad,
    DDScreenTypeUnkown,
};

@interface UIDevice (DDCore)

/**
 获取屏幕类型
 
 @return DDScreenType
 */
+ (DDScreenType)dd_ScreenType;

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

/**
 当前设备是否是iPhoneX

 @return YES ？ 是 ：不是
 */
+ (BOOL)dd_iPhoneX;

@end
