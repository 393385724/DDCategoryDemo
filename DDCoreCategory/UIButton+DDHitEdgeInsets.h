//
//  UIButton+DDHitEdgeInsets.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (DDHitEdgeInsets)

/**
 *  @brief 设置Button的可点击区域
 */
@property(nonatomic, assign) UIEdgeInsets ddHitTestEdgeInsets;

@end
