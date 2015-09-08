//
//  UIColor+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/2.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@interface UIColor (DDTools)

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)alpha;

@end
