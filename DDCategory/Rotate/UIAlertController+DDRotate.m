//
//  UIAlertController+DDRotate.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/25.
//  Copyright © 2017年 huami. All rights reserved.
//
// see https://stackoverflow.com/questions/31406820/uialertcontrollersupportedinterfaceorientations-was-invoked-recursively

#import "UIAlertController+DDRotate.h"

@implementation UIAlertController (DDRotate)

#if __IPHONE_OS_VERSION_MAX_ALLOWED < 90000
- (NSUInteger)supportedInterfaceOrientations; {
    return UIInterfaceOrientationMaskPortrait;
}
#else
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
#endif

@end
