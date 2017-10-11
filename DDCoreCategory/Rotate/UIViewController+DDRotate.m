//
//  UIViewController+DDRotate.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIViewController+DDRotate.h"
#import <objc/runtime.h>
#import "NSObject+DDCore.h"

static const void *DDUIViewControllerLastPageInterfaceOrientationKey = &DDUIViewControllerLastPageInterfaceOrientationKey;

@implementation UIViewController (DDRotate)

+ (void)load {
    [self dd_exchangeWithClass:[self class] fromSelector:@selector(viewWillAppear:) toSelector:@selector(ddRotate_viewWillAppear:)];
    [self dd_exchangeWithClass:[self class] fromSelector:@selector(viewWillDisappear:) toSelector:@selector(ddRotate_viewWillDisappear:)];
}

- (void)ddRotate_viewWillAppear:(BOOL)animated {
    [self ddRotate_viewWillAppear:animated];
    UIInterfaceOrientation currentInterfaceOrientation = [self preferredInterfaceOrientationForPresentation];
    if (currentInterfaceOrientation != UIInterfaceOrientationUnknown && currentInterfaceOrientation != self.ddLastPageInterfaceOrientation) {
        [self forceOrientationInterface:currentInterfaceOrientation];
    }
}

- (void)ddRotate_viewWillDisappear:(BOOL)animated {
    [self ddRotate_viewWillDisappear:animated];
    UIInterfaceOrientation currentInterfaceOrientation = [self preferredInterfaceOrientationForPresentation];
    if (currentInterfaceOrientation != UIInterfaceOrientationUnknown && currentInterfaceOrientation != self.ddLastPageInterfaceOrientation) {
        [self forceOrientationInterface:self.ddLastPageInterfaceOrientation];
    }
}

#pragma mark - Private Methods

- (void)forceOrientationInterface:(UIInterfaceOrientation)interfaceOrientation{
    [[UIDevice currentDevice] setValue:@(interfaceOrientation) forKey:@"orientation"];
    //不调用[UIScreen mainScreen].bounds的size不是你期望的
    [UIViewController attemptRotationToDeviceOrientation];
}


- (UIInterfaceOrientation)ddLastPageInterfaceOrientation {
    return [objc_getAssociatedObject(self, DDUIViewControllerLastPageInterfaceOrientationKey) integerValue];
}

- (void)setDdLastPageInterfaceOrientation:(UIInterfaceOrientation)ddLastPageInterfaceOrientation {
    objc_setAssociatedObject(self, DDUIViewControllerLastPageInterfaceOrientationKey, @(ddLastPageInterfaceOrientation), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
