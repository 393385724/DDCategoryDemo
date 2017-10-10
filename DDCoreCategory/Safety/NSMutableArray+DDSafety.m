//
//  NSMutableArray+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSMutableArray+DDSafety.h"
#import <objc/runtime.h>
#import "NSObject+DDCore.h"

@implementation NSMutableArray (DDSafety)

+ (void)load {
    [super load];
    Class class = objc_getClass("__NSArrayM");
    [self dd_exchangeWithClass:class fromSelector:@selector(addObject:) toSelector:@selector(dd_addObject:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(insertObject:atIndex:) toSelector:@selector(dd_insertObject:atIndex:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(removeObjectAtIndex:) toSelector:@selector(dd_removeObjectAtIndex:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(replaceObjectAtIndex:withObject:) toSelector:@selector(dd_replaceObjectAtIndex:withObject:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(setObject:atIndexedSubscript:) toSelector:@selector(dd_setObject:atIndexedSubscript:)];
}

- (void)dd_addObject:(id)anObject {
    if (!anObject) {
        NSLog(@"Error [NSMutableArray addObject]: object is nil");
        return;
    }
    [self dd_addObject:anObject];
}

- (void)dd_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (!anObject) {
        NSLog(@"Error [NSMutableArray insertObject:atIndex]: object is nil");
        return;
    }
    if (index > [self count]) {
        NSLog(@"Error [NSMutableArray insertObject:atIndex]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)index,(unsigned long)self.count - 1);
        return;
    }
    [self dd_insertObject:anObject atIndex:index];
}

- (void)dd_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        NSLog(@"Error [NSMutableArray removeObjectAtIndex]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)index,(unsigned long)self.count - 1);
        return;
    }
    [self dd_removeObjectAtIndex:index];
}

- (void)dd_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (!anObject) {
        NSLog(@"Error [NSMutableArray replaceObjectAtIndex:withObject]: object is nil");
        return;
    }
    if (index >= [self count]) {
        NSLog(@"Error [NSMutableArray replaceObjectAtIndex:withObject]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)index,(unsigned long)self.count - 1);
        return;
    }
    [self dd_replaceObjectAtIndex:index withObject:anObject];
}

- (void)dd_setObject:(id)obj atIndexedSubscript:(NSUInteger)idx {
    if (!obj) {
        NSLog(@"Error [NSMutableArray setObject:atIndexedSubscript]: object is nil");
        return;
    }
    if (idx > [self count]) {
        NSLog(@"Error [NSMutableArray setObject:atIndexedSubscript]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)idx,(unsigned long)self.count);
        return;
    }
    [self dd_setObject:obj atIndexedSubscript:idx];
}

@end
