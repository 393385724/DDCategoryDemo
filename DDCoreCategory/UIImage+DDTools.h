//
//  UIImage+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DDSize)

@property (nonatomic, assign, readonly) CGFloat ddWidth;
@property (nonatomic, assign, readonly) CGFloat ddHeight;

@end

@interface UIImage (DDClip)

+ (UIImage *)ddReSizeImage:(UIImage *)image size:(CGSize)asize;
- (UIImage *)ddSubImageAtRect:(CGRect)rect;

@end

@interface UIImage (DDDraw)

- (UIImage *)ddImageRotatedWithOrientation;
- (UIImage *)ddImageByApplyingAlpha:(CGFloat)alpha;

@end
