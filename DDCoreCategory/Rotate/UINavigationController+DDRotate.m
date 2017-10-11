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
    if (self.presentedViewController) {
        return self.presentedViewController.shouldAutorotate;
    } else {
        return self.topViewController.shouldAutorotate;
    }
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    if (self.presentedViewController) {
        return self.presentedViewController.supportedInterfaceOrientations;
    } else {
        return self.topViewController.supportedInterfaceOrientations;
    }
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    if (self.visibleViewController) {
        return self.visibleViewController.preferredInterfaceOrientationForPresentation;
    } else {
        return self.topViewController.preferredInterfaceOrientationForPresentation;
    }
}

@end
