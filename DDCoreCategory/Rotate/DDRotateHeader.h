//
//  DDRotateHeader.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//
//see more http://www.jianshu.com/p/5c773628caa6

#ifndef DDRotateHeader_h
#define DDRotateHeader_h

/**
 在自己的appdelegate中实现如下方法
 
 - (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
 return [self.window.rootViewController supportedInterfaceOrientations];
 }
 */

#ifdef __OBJC__

#import "UINavigationController+DDRotate.h"
#import "UIViewController+DDRotate.h"
#import "UITabBarController+DDRotate.h"

#endif

#endif /* DDRotateHeader_h */
