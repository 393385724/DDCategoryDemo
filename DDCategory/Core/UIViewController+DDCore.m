//
//  UIViewController+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/11.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UIViewController+DDCore.h"
#import "DDRuntime.h"

static const void *DDUIViewControllerViewDidAppearKey = &DDUIViewControllerViewDidAppearKey;


@implementation UIViewController (DDCore)

+ (void)load {
    DDSwizzleMethod([self class], @selector(viewDidAppear:), @selector(ddCore_viewDidAppear:));
}

#pragma mark - Public

- (BOOL)dd_isPushed {
    if (self.presentingViewController) {
        return YES;
    }
    return NO;
}

#pragma mark - Runtime

- (void)ddCore_viewDidAppear:(BOOL)animated {
    [self ddCore_viewDidAppear:animated];
    self.ddViewDidAppear = YES;
}

- (BOOL)ddViewDidAppear {
    return [objc_getAssociatedObject(self, DDUIViewControllerViewDidAppearKey) boolValue];
}

-(void)setDdViewDidAppear:(BOOL)ddViewDidAppear {
    objc_setAssociatedObject(self, DDUIViewControllerViewDidAppearKey, @(ddViewDidAppear), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
