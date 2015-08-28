//
//  UIView+DDTouch.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UIView+DDTouch.h"

@implementation UIView (DDTouch)

- (void)ddAddTarget:(id)target tapAction:(SEL)action{
    self.userInteractionEnabled = YES;
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
}

@end
