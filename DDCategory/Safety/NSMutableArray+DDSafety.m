//
//  NSMutableArray+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSMutableArray+DDSafety.h"
#import "DDRuntime.h"

@implementation NSMutableArray (DDSafety)

+ (void)load {
#ifndef DEBUG
    Class class = objc_getClass("__NSArrayM");
    DDSwizzleMethod(class, @selector(objectAtIndex:), @selector(ddSafety_objectAtIndex:));
    DDSwizzleMethod(class, @selector(objectAtIndexedSubscript:), @selector(ddSafety_objectAtIndexedSubscript:));
    DDSwizzleMethod(class, @selector(addObject:), @selector(ddSafety_addObject:));
    DDSwizzleMethod(class, @selector(insertObject:atIndex:), @selector(ddSafety_insertObject:atIndex:));
    DDSwizzleMethod(class, @selector(removeObjectAtIndex:), @selector(ddSafety_removeObjectAtIndex:));
    DDSwizzleMethod(class, @selector(replaceObjectAtIndex:withObject:), @selector(ddSafety_replaceObjectAtIndex:withObject:));
    DDSwizzleMethod(class, @selector(setObject:atIndexedSubscript:), @selector(ddSafety_setObject:atIndexedSubscript:));
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

- (void)ddSafety_addObject:(id)anObject {
    if (!anObject) {
        return;
    }
    [self ddSafety_addObject:anObject];
}

- (void)ddSafety_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        return;
    }
    if (index > [self count]) {
        return;
    }
    [self ddSafety_insertObject:anObject atIndex:index];
}

- (void)ddSafety_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return;
    }
    [self ddSafety_removeObjectAtIndex:index];
}

- (void)ddSafety_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (!anObject) {
        return;
    }
    if (index >= [self count]) {
        return;
    }
    [self ddSafety_replaceObjectAtIndex:index withObject:anObject];
}

- (void)ddSafety_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    if (!obj) {
        return;
    }
    if (idx > [self count]) {
        return;
    }
    [self ddSafety_setObject:obj atIndexedSubscript:idx];
}

@end
