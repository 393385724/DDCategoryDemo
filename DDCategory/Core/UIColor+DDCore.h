//
//  UIColor+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

#define DDRGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define DDRGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define DDRGBHexCOLOR(hexString) [UIColor dd_colorWithHexString:hexString alpha:1]
#define DDRGBAHexCOLOR(hexString,a) [UIColor dd_colorWithHexString:hexString alpha:a]

@interface UIColor (DDCore)

/**
 将十六进制颜色字符串转换为UIColor对象

 @param hexString 十六进制颜色字符串
 @param alpha alpha值
 @return UIColor
 */
+ (UIColor *)dd_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

/**
 将十六进制颜色转换为UIColor对象

 @param hexColor 十六进制颜色值
 @param alpha alpha值
 @return UIColor
 */
+ (UIColor *)dd_colorWithHex:(long)hexColor alpha:(float)alpha;

@end
