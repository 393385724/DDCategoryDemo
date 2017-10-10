//
//  UIView+DDHitEdgeInsets.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDHitEdgeInsets)

/**
 设置View的可点击区域，子类必须实现pointInside:withEvent:
 eg.UIEdgeInsetsMake(-50, -50, -50, -50) 点击范围四周各扩大50
 */
@property(nonatomic, assign) UIEdgeInsets ddHitEdgeInsets;

@end
