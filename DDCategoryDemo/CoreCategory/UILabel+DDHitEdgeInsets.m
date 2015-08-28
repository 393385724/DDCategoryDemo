//
//  UILabel+DDHitEdgeInsets.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UILabel+DDHitEdgeInsets.h"
#import <objc/runtime.h>

static const NSString *KEY_HIT_TEST_EDGE_INSETS = @"DDLabelHitTestEdgeInsets";


@implementation UILabel (DDHitEdgeInsets)

-(void)setDdHitTestEdgeInsets:(UIEdgeInsets)ddHitTestEdgeInsets {
    NSValue *value = [NSValue value:&ddHitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIEdgeInsets)ddHitTestEdgeInsets {
    NSValue *value = objc_getAssociatedObject(self, &KEY_HIT_TEST_EDGE_INSETS);
    if(value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    }else {
        return UIEdgeInsetsZero;
    }
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.ddHitTestEdgeInsets, UIEdgeInsetsZero) || !self.enabled || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.ddHitTestEdgeInsets);
    
    return CGRectContainsPoint(hitFrame, point);
}


@end
