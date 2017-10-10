//
//  NSObject+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSObject+DDCore.h"
#import <objc/runtime.h>

@implementation NSObject (DDCore)

+ (void)dd_exchangeWithClass:(Class)class fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector {
    Method fromMethod = class_getInstanceMethod(class, fromSelector);
    Method toMethod = class_getInstanceMethod(class, toSelector);
    method_exchangeImplementations(fromMethod, toMethod);
}

@end
