//
//  NSObject+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/25.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSObject+DDSafety.h"
#import "DDRuntime.h"
#import <objc/runtime.h>

@interface DDForwardProxy : NSObject

@end

@implementation DDForwardProxy

- (instancetype)initWithClass:(Class)class selector:(SEL)aSelector{
    if (self = [super init]) {
        Method hookMethod = class_getInstanceMethod([self class], @selector(hookDoesNotRecognizeSelector:));
        BOOL didAdd = class_addMethod([self class],
                                      aSelector,
                                      class_getMethodImplementation([self class], @selector(hookDoesNotRecognizeSelector:)),
                                      method_getTypeEncoding(hookMethod));
        if (didAdd) {
            NSLog(@"[%@] doesNotRecognizeSelector:  [%@]", NSStringFromClass(class),NSStringFromSelector(aSelector));
        }
    }
    return self;
}

- (void)hookDoesNotRecognizeSelector:(SEL)aSelector {
    
}

@end

@implementation NSObject (DDSafety)

+ (void)load {
#ifndef DEBUG
    DDSwizzleMethod([self class], @selector(forwardingTargetForSelector:), @selector(ddSafety_forwardingTargetForSelector:));
#endif
}

- (id)ddSafety_forwardingTargetForSelector:(SEL)aSelector {
    id target = [self ddSafety_forwardingTargetForSelector:aSelector];
    if (target == nil) {
        NSString *className = NSStringFromClass([self class]);
        if (![className hasPrefix:@"_"]) {
            return [[DDForwardProxy alloc] initWithClass:[self class] selector:aSelector];
        }
    }
    return target;
}

@end
