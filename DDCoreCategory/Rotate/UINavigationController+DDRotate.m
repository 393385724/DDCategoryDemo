//
//  UINavigationController+DDRotate.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UINavigationController+DDRotate.h"

@implementation UINavigationController (DDRotate)

- (BOOL)shouldAutorotate{
    return [self dd_realViewController].shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return [self dd_realViewController].supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    return [self dd_realViewController].preferredInterfaceOrientationForPresentation;
}

#pragma mark - Private Methods

- (UIViewController *)dd_realViewController {
    if (self.presentedViewController && ![self.presentedViewController isKindOfClass:NSClassFromString(@"UISnapshotModalViewController")]) {
        //这样处理是为了找到真正的页面，presented的时候apple会临时产生一个UISnapshotModalViewController的过渡页面
        return self.presentedViewController;
    } else {
        return self.topViewController;
    }
}

@end
