//
//  NSDictionary+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSDictionary+DDSafety.h"
#import <objc/runtime.h>
#import "NSObject+DDCore.h"

@implementation NSDictionary (DDSafety)

+ (void)load {
    [super load];
    Class class = objc_getClass("__NSDictionaryI");
    [self dd_exchangeWithClass:class fromSelector:@selector(objectForKey:) toSelector:@selector(dd_objectForKey:)];
    [self dd_exchangeWithClass:class fromSelector:@selector(objectForKeyedSubscript:) toSelector:@selector(dd_objectForKeyedSubscript:)];
}

- (id)dd_objectForKey:(NSString *)aKey {
    if (!aKey || [aKey isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSDictionary objectForKey]: key is nil");
        return nil;
    }
    return [self dd_objectForKey:aKey];
}

- (id)dd_objectForKeyedSubscript:(NSString *)key {
    if (!key || [key isKindOfClass:[NSNull class]]) {
        NSLog(@"Error [NSDictionary objectForKeyedSubscript]: key is nil");
        return nil;
    }
    return [self dd_objectForKeyedSubscript:key];
}

@end
