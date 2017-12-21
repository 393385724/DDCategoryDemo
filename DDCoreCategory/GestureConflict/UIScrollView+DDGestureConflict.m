//
//  UIScrollView+DDGestureConflict.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/1.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIScrollView+DDGestureConflict.h"
#import <objc/runtime.h>

static const NSString *DDShouldInteractivePopGestureKey = @"DDShouldInteractivePopGestureKey";
static const NSString *DDMaxAllowedInitialDistanceToLeftEdgKey = @"DDMaxAllowedInitialDistanceToLeftEdgKey";

@implementation UIScrollView (DDGestureConflict)

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.ddShouldInteractivePopGesture) {
        if ([self shouldRecognizerPopGesture:gestureRecognizer]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.ddShouldInteractivePopGesture) {
        if ([self shouldRecognizerPopGesture:gestureRecognizer]) {
            return YES;
        }
    }
    return YES;
}

- (BOOL)shouldRecognizerPopGesture:(UIGestureRecognizer *)gestureRecognizer {
    if (gestureRecognizer == self.panGestureRecognizer) {
        CGFloat screenWidth = CGRectGetWidth([UIScreen mainScreen].bounds);
        int interactivePopMaxAllowedInitialDistanceToLeftEdg = MAX(60, self.ddMaxAllowedInitialDistanceToLeftEdg);
        UIPanGestureRecognizer *pan = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint point = [pan translationInView:self];
        UIGestureRecognizerState state = gestureRecognizer.state;
        if (UIGestureRecognizerStateBegan == state ||
            UIGestureRecognizerStatePossible == state) {
            CGPoint location = [gestureRecognizer locationInView:self];
            NSInteger pageRelativeScreenOffset = ((int)location.x) % ((int)screenWidth);
            if (point.x > 0 && pageRelativeScreenOffset <= interactivePopMaxAllowedInitialDistanceToLeftEdg) {
                return YES;
            }
        }
    }
    return NO;
}


- (void)setDdShouldInteractivePopGesture:(BOOL)ddShouldInteractivePopGesture {
    objc_setAssociatedObject(self, &DDShouldInteractivePopGestureKey, @(ddShouldInteractivePopGesture), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)ddShouldInteractivePopGesture {
    return [objc_getAssociatedObject(self, &DDMaxAllowedInitialDistanceToLeftEdgKey) boolValue];
}

- (void)setDdMaxAllowedInitialDistanceToLeftEdg:(CGFloat)ddMaxAllowedInitialDistanceToLeftEdg {
    objc_setAssociatedObject(self, &DDMaxAllowedInitialDistanceToLeftEdgKey, @(ddMaxAllowedInitialDistanceToLeftEdg), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CGFloat)ddMaxAllowedInitialDistanceToLeftEdg {
    NSNumber *number = objc_getAssociatedObject(self, &DDMaxAllowedInitialDistanceToLeftEdgKey);
    if (!number) {
        return 60;
    } else {
        return [number floatValue];
    }
}

@end
