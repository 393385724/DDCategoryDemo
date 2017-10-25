//
//  NSArray+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSArray+DDSafety.h"
#import "DDRuntime.h"

@implementation NSArray (DDSafety)

+ (void)load {
#ifndef DEBUG
    Class class = objc_getClass("__NSArrayI");
    DDSwizzleMethod(class, @selector(objectAtIndex:), @selector(ddSafety_objectAtIndex:));
    DDSwizzleMethod(class, @selector(objectAtIndexedSubscript:), @selector(ddSafety_objectAtIndexedSubscript:));
#endif
}

- (id)ddSafety_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return nil;
    }
    return [self ddSafety_objectAtIndex:index];
}

- (id)ddSafety_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= [self count]) {
        return nil;
    }
    return [self ddSafety_objectAtIndexedSubscript:idx];
}

@end
