//
//  DDRuntime.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface DDRuntime : NSObject

/**
 方法替换黑魔法
 
 @param cls 类
 @param originalSelector 原始方法
 @param swizzledSelector 需要兑换的方法
 */
extern void DDSwizzleMethod(Class cls, SEL originalSelector, SEL swizzledSelector);


@end
