//
//  UILabel+DDHitEdgeInsets.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UILabel+DDHitEdgeInsets.h"
#import "UIView+DDHitEdgeInsets.h"

@implementation UILabel (DDHitEdgeInsets)

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    if(UIEdgeInsetsEqualToEdgeInsets(self.ddHitEdgeInsets, UIEdgeInsetsZero) || self.hidden) {
        return [super pointInside:point withEvent:event];
    }
    CGRect relativeFrame = self.bounds;
    CGRect hitFrame = UIEdgeInsetsInsetRect(relativeFrame, self.ddHitEdgeInsets);
    return CGRectContainsPoint(hitFrame, point);
}

@end
