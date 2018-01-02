//
//  UIViewController+DDRotate.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DDRotate)

/**
 用于指定当前cotroller入栈之前的页面的状态，用于页面销毁恢复
 */
@property (nonatomic, assign) UIInterfaceOrientation ddLastPageInterfaceOrientation;

@end
