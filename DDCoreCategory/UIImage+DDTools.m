//
//  UIImage+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/8/28.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "UIImage+DDTools.h"
#import <CoreGraphics/CoreGraphics.h>
#import "UIDevice+DDTools.h"

@implementation UIImage (DDSize)

- (CGFloat)ddWidth{
    return self.size.width;
}

- (CGFloat)ddHeight{
    return self.size.height;
}

@end

@implementation UIImage (DDClip)

+ (UIImage *)ddReSizeImage:(UIImage *)image size:(CGSize)asize{
    UIImage *newimage = nil;
    if (image){
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height){
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else {
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}


- (UIImage *)ddSubImageAtRect:(CGRect)rect{
    rect = CGRectMake(rect.origin.x*self.scale, rect.origin.y*self.scale, rect.size.width*self.scale, rect.size.height*self.scale);
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage* subImage = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return subImage;
}

@end

@implementation UIImage (DDDraw)

- (UIImage *)ddImageRotatedWithOrientation{
    if (self.imageOrientation == UIImageOrientationUp) {
        return self;
    }
    
    int kMaxResolution = [UIDevice ddScreenWidth]*[UIDevice ddScreenScale];
    
    CGImageRef imgRef = self.CGImage;
    if (imgRef == NULL) {
        CGAffineTransform transform = [self ddTransformWithOrientation:self.imageOrientation size:self.CIImage.extent.size rect:NULL];
        return [UIImage imageWithCIImage:[self.CIImage imageByApplyingTransform:transform]];
    }
    
    CGFloat width = CGImageGetWidth(imgRef);
    CGFloat height = CGImageGetHeight(imgRef);
    
    
    CGRect bounds = CGRectMake(0, 0, width, height);
    if (width > kMaxResolution || height > kMaxResolution) {
        CGFloat ratio = width/height;
        if (ratio > 1) {
            bounds.size.width = kMaxResolution;
            bounds.size.height = bounds.size.width / ratio;
        }
        else {
            bounds.size.height = kMaxResolution;
            bounds.size.width = bounds.size.height * ratio;
        }
    }
    CGSize imageSize = CGSizeMake(CGImageGetWidth(imgRef), CGImageGetHeight(imgRef));
    
    UIImageOrientation orient = self.imageOrientation;
    CGAffineTransform transform = [self ddTransformWithOrientation:orient size:imageSize rect:&bounds];
    
    
    UIGraphicsBeginImageContext(bounds.size);
    
    CGFloat scaleRatio = bounds.size.width / width;
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (orient == UIImageOrientationRight || orient == UIImageOrientationLeft) {
        CGContextScaleCTM(context, -scaleRatio, scaleRatio);
        CGContextTranslateCTM(context, -height, 0);
    } else {
        CGContextScaleCTM(context, scaleRatio, -scaleRatio);
        CGContextTranslateCTM(context, 0, -height);
    }
    
    CGContextConcatCTM(context, transform);
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, width, height), imgRef);
    UIImage *imageCopy = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return imageCopy;
}

- (UIImage *)ddImageByApplyingAlpha:(CGFloat)alpha{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect area = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -area.size.height);
    CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
    CGContextSetAlpha(ctx, alpha);
    CGContextDrawImage(ctx, area, self.CGImage);
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

#pragma mark - Private

- (CGAffineTransform)ddTransformWithOrientation:(UIImageOrientation)imageOrientation
                                           size:(CGSize)imageSize
                                           rect:(CGRect *)bounds{
    CGAffineTransform transform = CGAffineTransformIdentity;
    CGFloat boundHeight;
    switch(imageOrientation) {
            
        case UIImageOrientationUp: //EXIF = 1
            transform = CGAffineTransformIdentity;
            break;
            
        case UIImageOrientationUpMirrored: //EXIF = 2
            transform = CGAffineTransformMakeTranslation(imageSize.width, 0.0);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            break;
            
        case UIImageOrientationDown: //EXIF = 3
            transform = CGAffineTransformMakeTranslation(imageSize.width, imageSize.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationDownMirrored: //EXIF = 4
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.height);
            transform = CGAffineTransformScale(transform, 1.0, -1.0);
            break;
            
        case UIImageOrientationLeftMirrored: //EXIF = 5
            if (bounds) {
                boundHeight = bounds->size.height;
                bounds->size.height = bounds->size.width;
                bounds->size.width = boundHeight;
            }

            transform = CGAffineTransformMakeTranslation(imageSize.height, imageSize.width);
            transform = CGAffineTransformScale(transform, -1.0, 1.0);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationLeft: //EXIF = 6
            if (bounds) {
                boundHeight = bounds->size.height;
                bounds->size.height = bounds->size.width;
                bounds->size.width = boundHeight;
            }
            
            transform = CGAffineTransformMakeTranslation(0.0, imageSize.width);
            transform = CGAffineTransformRotate(transform, 3.0 * M_PI / 2.0);
            break;
            
        case UIImageOrientationRightMirrored: //EXIF = 7
            if (bounds) {
                boundHeight = bounds->size.height;
                bounds->size.height = bounds->size.width;
                bounds->size.width = boundHeight;
            }
            
            transform = CGAffineTransformMakeScale(-1.0, 1.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        case UIImageOrientationRight: //EXIF = 8
            if (bounds) {
                boundHeight = bounds->size.height;
                bounds->size.height = bounds->size.width;
                bounds->size.width = boundHeight;
            }
            transform = CGAffineTransformMakeTranslation(imageSize.height, 0.0);
            transform = CGAffineTransformRotate(transform, M_PI / 2.0);
            break;
            
        default:
            [NSException raise:NSInternalInconsistencyException format:@"Invalid image orientation"];
            
    }
    return transform;
}

@end
