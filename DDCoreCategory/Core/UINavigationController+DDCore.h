//
//  UINavigationController+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (DDCore)

/**
 出栈到指定的ViewController

 @param viewControllerClass Class
 @param animated animated
 */
- (void)dd_popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated;;

@end
