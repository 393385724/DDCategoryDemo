//
//  UILabel+DDHitEdgeInsets.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DDHitEdgeInsets)

/**
 *  @brief 设置Label的可点击区域
 */
@property(nonatomic, assign) UIEdgeInsets ddHitTestEdgeInsets;

@end
