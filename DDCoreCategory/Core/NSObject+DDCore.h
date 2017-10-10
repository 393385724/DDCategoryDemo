//
//  NSObject+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DDCore)

/**
 方法替换

 @param class 需要替换的类
 @param fromSelector 原始selector
 @param toSelector 目标selector
 */
+ (void)dd_exchangeWithClass:(Class)class fromSelector:(SEL)fromSelector toSelector:(SEL)toSelector;

@end
