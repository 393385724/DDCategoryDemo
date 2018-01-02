//
//  UIViewController+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (DDCore)

/**
 页面是否已经显示，viewDidAppear执行之后为YES
 */
@property (readonly) BOOL ddViewDidAppear;

/**
 判断当前页面是否被push进来

 @return YES ？ 是 ：否
 */
- (BOOL)dd_isPushed;

@end
