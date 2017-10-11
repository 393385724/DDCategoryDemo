//
//  AppDelegate+DDRotate.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "AppDelegate+DDRotate.h"

@implementation AppDelegate (DDRotate)

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window{
    return [self.window.rootViewController supportedInterfaceOrientations];
}

@end
