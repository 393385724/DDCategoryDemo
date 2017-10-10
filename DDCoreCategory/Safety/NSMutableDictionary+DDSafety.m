//
//  NSMutableDictionary+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSMutableDictionary+DDSafety.h"
#import <objc/runtime.h>
#import "NSObject+DDCore.h"

@implementation NSMutableDictionary (DDSafety)

+ (void)load {
    Class class = objc_getClass("__NSDictionaryM");
    [self dd_exchangeWithClass:class fromSelector:@selector(objectForKey:) toSelector:@selector(dd_objectForKey:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(objectForKeyedSubscript:) toSelector:@selector(dd_objectForKeyedSubscript:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(removeObjectForKey:) toSelector:@selector(dd_removeObjectForKey:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(setObject:forKey:) toSelector:@selector(dd_setObject:forKey:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(setObject:forKeyedSubscript:) toSelector:@selector(dd_setObject:forKeyedSubscript:)];
}

- (id)dd_objectForKey:(NSString *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary objectForKey]: key is nil");
        return nil;
    }
    return [self dd_objectForKey:aKey];
}

- (id)dd_objectForKeyedSubscript:(NSString *)key {
    if (!key || [key isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary objectForKeyedSubscript]: key is nil");
        return nil;
    }
    return [self dd_objectForKeyedSubscript:key];
}

- (void)dd_removeObjectForKey:(NSString *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary removeObjectForKey]: aKey is nil");
        return;
    }
    [self dd_removeObjectForKey:aKey];
}

- (void)dd_setObject:(id)anObject forKey:(NSString <NSCopying> *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKey]: aKey is nil");
        return;
    }
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKey]: anObject is nil");
        return;
    }
    [self dd_setObject:anObject forKey:aKey];
}

- (void)dd_setObject:(id)obj forKeyedSubscript:(NSString *)key {
    if (!key || [key isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKeyedSubscript]: key is nil");
        return;
    }
    if (!obj || [obj isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKeyedSubscript]: obj is nil");
        return;
    }
    [self dd_setObject:obj forKeyedSubscript:key];
}

@end
