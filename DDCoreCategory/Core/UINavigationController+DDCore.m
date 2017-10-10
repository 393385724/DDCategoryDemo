//
//  UINavigationController+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UINavigationController+DDCore.h"

@implementation UINavigationController (DDCore)

- (void)dd_popToViewControllerClass:(Class)viewControllerClass animated:(BOOL)animated;{
    NSMutableArray *viewControllers = [self.viewControllers mutableCopy];
    UIViewController *nextViewController = [viewControllers lastObject];
    while (![nextViewController isKindOfClass:viewControllerClass] && nextViewController && [viewControllers count] > 1) {
        [viewControllers removeLastObject];
        nextViewController = [viewControllers lastObject];
    }
    [self popToViewController:nextViewController animated:animated];
}

@end
