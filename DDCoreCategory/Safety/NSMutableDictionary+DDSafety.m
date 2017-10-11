//
//  NSMutableDictionary+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSMutableDictionary+DDSafety.h"
#import "DDRuntime.h"

@implementation NSMutableDictionary (DDSafety)

+ (void)load {
    Class class = objc_getClass("__NSDictionaryM");
    DDSwizzleMethod(class, @selector(objectForKey:), @selector(ddSafety_objectForKey:));
    DDSwizzleMethod(class, @selector(objectForKeyedSubscript:), @selector(ddSafety_objectForKeyedSubscript:));
    DDSwizzleMethod(class, @selector(removeObjectForKey:), @selector(ddSafety_removeObjectForKey:));
    DDSwizzleMethod(class, @selector(setObject:forKey:), @selector(ddSafety_setObject:forKey:));
    DDSwizzleMethod(class, @selector(setObject:forKeyedSubscript:), @selector(ddSafety_setObject:forKeyedSubscript:));
}

- (id)ddSafety_objectForKey:(NSString *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary objectForKey]: key is nil");
        return nil;
    }
    return [self ddSafety_objectForKey:aKey];
}

- (id)ddSafety_objectForKeyedSubscript:(NSString *)key {
    if (!key || [key isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary objectForKeyedSubscript]: key is nil");
        return nil;
    }
    return [self ddSafety_objectForKeyedSubscript:key];
}

- (void)ddSafety_removeObjectForKey:(NSString *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary removeObjectForKey]: aKey is nil");
        return;
    }
    [self ddSafety_removeObjectForKey:aKey];
}

- (void)ddSafety_setObject:(id)anObject forKey:(NSString <NSCopying> *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKey]: aKey is nil");
        return;
    }
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKey]: anObject is nil");
        return;
    }
    [self ddSafety_setObject:anObject forKey:aKey];
}

- (void)ddSafety_setObject:(id)obj forKeyedSubscript:(NSString *)key {
    if (!key || [key isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKeyedSubscript]: key is nil");
        return;
    }
    if (!obj || [obj isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSMutableDictionary setObject:forKeyedSubscript]: obj is nil");
        return;
    }
    [self ddSafety_setObject:obj forKeyedSubscript:key];
}

@end
