//
//  UIView+DDTouch.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDTouch)

- (void)ddAddTarget:(id)target tapAction:(SEL)action;

@end
