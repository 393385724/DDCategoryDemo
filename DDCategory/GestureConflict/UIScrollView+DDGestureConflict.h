//
//  UIScrollView+DDGestureConflict.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/1.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (DDGestureConflict)

/**
 是否允许识别系统返回手势,默认NO
 */
@property (nonatomic, assign) BOOL ddShouldInteractivePopGesture;

/**
 允许识别距离左边屏幕的最大距离，默认60
 */
@property (nonatomic, assign) CGFloat ddMaxAllowedInitialDistanceToLeftEdg;

@end
