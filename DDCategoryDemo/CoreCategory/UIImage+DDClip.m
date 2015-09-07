//
//  UIImage+DDClip.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UIImage+DDClip.h"

@implementation UIImage (DDClip)

- (CGFloat)ddWidth{
    return self.size.width;
}

- (CGFloat)ddHeight{
    return self.size.height;
}

- (UIImage *)ddSubImageAtRect:(CGRect)rect{
    rect = CGRectMake(rect.origin.x*self.scale, rect.origin.y*self.scale, rect.size.width*self.scale, rect.size.height*self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage* subImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return subImage;
}

- (UIImage *)ddReSize:(CGSize)size{
    return [self ddScaleToSize:size];
}

- (UIImage *)ddReSizeToWidth:(CGFloat)width{
    return [self ddScaleToSize:CGSizeMake(width, self.ddHeight/self.ddWidth*width)];
}



#pragma mark - Private Methods

- (UIImage*)ddScaleToSize:(CGSize)size{
    //指定宽度与实际宽度的偏差
    CGFloat widthDeviation = fabs(self.ddWidth - size.width);
    //指定高度与实际高度的偏差
    CGFloat heightDeviation = fabs(self.ddHeight - size.height);
    if (widthDeviation <= 2 && heightDeviation <= 2) {
        //两个小素的误差，就算是和原图一样大小
        return self;
    }
    CGSize newSize;
    if (size.width/size.height > self.ddWidth/self.ddHeight) { // 高度优先
        newSize.height = size.height;
        newSize.width = self.ddWidth/self.ddHeight*newSize.height;
    } else { // 宽度优先
        newSize.width = size.width;
        newSize.height = self.ddHeight/self.ddWidth*newSize.width;
    }
    
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, floorf(newSize.width)+1, floorf(newSize.height)+1)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}


@end
