//
//  UINavigationBar+DDCore.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "UINavigationBar+DDCore.h"
#import <objc/runtime.h>

static const void *DDNavigationBarCustomLefButtonKey = &DDNavigationBarCustomLefButtonKey;

@implementation UINavigationBar (DDCore)

/*
 为了解决自定义导航栏滑动返回取消后出现三个小点(标题栏错乱)解决方案
 @see more http://www.jianshu.com/p/a92e5cc26b86
 */
- (void)addSubview:(UIView *)view {
    [super addSubview:view];
    if (self.ddCustomLeftBarButton) {
        if (NSClassFromString(@"UINavigationItemButtonView") != nil) {
            if ([view isKindOfClass:NSClassFromString(@"UINavigationItemButtonView")]) {
                view.hidden = YES;
            }
        }
    }
}

- (BOOL)ddCustomLeftBarButton{
    return [objc_getAssociatedObject(self, DDNavigationBarCustomLefButtonKey) boolValue];
}

- (void)setDdCustomLeftBarButton:(BOOL)ddCustomLeftBarButton{
    objc_setAssociatedObject(self, DDNavigationBarCustomLefButtonKey, @(ddCustomLeftBarButton), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
