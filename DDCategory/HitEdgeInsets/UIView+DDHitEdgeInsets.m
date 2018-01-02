//
//  UIView+DDHitEdgeInsets.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/9.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIView+DDHitEdgeInsets.h"
#import <objc/runtime.h>

static const NSString *DD_KEY_HIT_EDGE_INSETS = @"DDViewHitEdgeInsets";

@implementation UIView (DDHitEdgeInsets)

- (void)setDdHitEdgeInsets:(UIEdgeInsets)ddHitEdgeInsets {
    NSValue *value = [NSValue value:&ddHitEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &DD_KEY_HIT_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIEdgeInsets)ddHitEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &DD_KEY_HIT_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

@end
