//
//  NSArray+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSArray+DDSafety.h"
#import <objc/runtime.h>
#import "NSObject+DDCore.h"

@implementation NSArray (DDSafety)

+ (void)load {
    [super load];
    Class class = objc_getClass("__NSArrayI");
    [self dd_exchangeWithClass:class fromSelector:@selector(objectAtIndex:) toSelector:@selector(dd_objectAtIndex:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(objectAtIndexedSubscript:) toSelector:@selector(dd_objectAtIndexedSubscript:)];
}

- (id)dd_objectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        NSLog(@"Error [NSArray objectAtIndex]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)index,(unsigned long)self.count - 1);
        return nil;
    }
    return [self dd_objectAtIndex:index];
}

- (id)dd_objectAtIndexedSubscript:(NSUInteger)idx {
    if (idx >= [self count]) {
        NSLog(@"Error [NSArray objectAtIndexedSubscript]: index %lu beyond bounds:[0 ... %lu]",(unsigned long)idx,(unsigned long)self.count - 1);
        return nil;
    }
    return [self dd_objectAtIndexedSubscript:idx];
}

@end
