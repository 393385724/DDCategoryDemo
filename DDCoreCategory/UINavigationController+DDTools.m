//
//  UINavigationController+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/11/10.
//  Copyright © 2015年 LeeLingang. All rights reserved.
//

#import "UINavigationController+DDTools.h"

@implementation UINavigationController (DDTools)

- (void)ddPopToViewControllerClass:(Class)viewControllerClass{
    NSMutableArray *viewControllers = [self.viewControllers mutableCopy];
    UIViewController *nextViewController = [viewControllers lastObject];
    while (![nextViewController isKindOfClass:viewControllerClass] && nextViewController && [viewControllers count] > 1) {
        [viewControllers removeLastObject];
        nextViewController = [viewControllers lastObject];
    }
    [self popToViewController:nextViewController animated:YES];
}

@end
