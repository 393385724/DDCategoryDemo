//
//  UIImage+DDCore.h
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/10/10.
//  Copyright © 2017年 huami. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDCore)

/**
 当前图片的宽度

 @return CGFloat
 */
- (CGFloat)dd_width;

/**
 当前图片的高度

 @return CGFloat
 */
- (CGFloat)dd_height;


/**
 根据颜色值绘制图片

 @param color UIColor
 @return UIImage
 */
+ (UIImage *)dd_imageWithColor:(UIColor *)color;

/**
 纠正图片旋转

 @return UIImage
 */
- (UIImage *)dd_imageRotatedWithOrientation;

/**
 给图片添加alpha通道

 @param alpha alpha
 @return UIImage
 */
- (UIImage *)dd_imageByApplyingAlpha:(CGFloat)alpha;

/**
 缩放图片

 @param image 原始图片
 @param asize 缩放大小
 @return UIImage
 */
+ (UIImage *)dd_reSizeImage:(UIImage *)image size:(CGSize)asize;

/**
 获取图片中的指定位置的子图

 @param rect 相对原图片的位置
 @return UIImage
 */
- (UIImage *)dd_subImageAtRect:(CGRect)rect;

@end
