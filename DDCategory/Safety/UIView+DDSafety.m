//
//  UIView+DDSafety.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/25.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIView+DDSafety.h"
#import "DDRuntime.h"

@implementation UIView (DDSafety)

+ (void)load {
#ifdef DEBUG
    DDSwizzleMethod([self class], @selector(setNeedsLayout), @selector(ddSafety_setNeedsLayout));
    DDSwizzleMethod([self class], @selector(layoutIfNeeded), @selector(ddSafety_layoutIfNeeded));
    DDSwizzleMethod([self class], @selector(layoutSubviews), @selector(ddSafety_layoutSubviews));
#endif
}

- (void)ddSafety_setNeedsLayout {
    if (![[NSThread currentThread] isMainThread]) {
        NSAssert(false, @"%@ must setNeedsLayout on main thread",NSStringFromClass([self class]));
    }
    [self ddSafety_setNeedsLayout];
}

- (void)ddSafety_layoutIfNeeded {
    if (![[NSThread currentThread] isMainThread]) {
        NSAssert(false, @"%@ must layoutIfNeeded on main thread",NSStringFromClass([self class]));
    }
    [self ddSafety_layoutIfNeeded];
}


- (void)ddSafety_layoutSubviews {
    if (![[NSThread currentThread] isMainThread]) {
        NSAssert(false, @"%@ must layoutSubviews on main thread",NSStringFromClass([self class]));
    }
    [self ddSafety_layoutSubviews];
}

@end
