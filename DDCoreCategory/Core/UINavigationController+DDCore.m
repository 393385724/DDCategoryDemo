//
//  UINavigationController+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UINavigationController+DDCore.h"
#import "DDRuntime.h"

@implementation UINavigationController (DDCore)

+ (void)load {
    DDSwizzleMethod([self class], @selector(pushViewController:animated:), @selector(dd_pushViewController:animated:));
}

- (void)dd_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([self.viewControllers.lastObject isMemberOfClass:[viewController class]]) {
        //fix sometime repeat push same viewController
        return;
    }
    [self dd_pushViewController:viewController animated:animated];
}

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
