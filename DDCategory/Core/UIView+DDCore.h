//
//  UIView+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DDCore)

@property (nonatomic, readwrite) CGFloat ddTop;
@property (nonatomic, readwrite) CGFloat ddBottom;
@property (nonatomic, readwrite) CGFloat ddLeft;
@property (nonatomic, readwrite) CGFloat ddRight;
@property (nonatomic, readwrite) CGFloat ddMiddleX;
@property (nonatomic, readwrite) CGFloat ddMiddleY;
@property (nonatomic, readwrite) CGFloat ddWidth;
@property (nonatomic, readwrite) CGFloat ddHeight;
@property (nonatomic, readwrite) CGPoint ddLeftTopPoint;

@property (nonatomic, readonly) CGSize ddSize;
@property (nonatomic, readonly) CGPoint ddBoundsCenter;


/**
 给View增加点击事件

 @param target target
 @param action action
 */
- (void)dd_addTarget:(id)target tapAction:(SEL)action;

/**
 当前view截图

 @return UIImage
 */
- (UIImage *)dd_imageCapture;

@end
