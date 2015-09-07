//
//  NSObject+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

static inline CGFLOAT_TYPE ddCeil(CGFLOAT_TYPE cgfloat) {
#if CGFLOAT_IS_DOUBLE
    return ceil(cgfloat);
#else
    return ceilf(cgfloat);
#endif
}

static inline CGFLOAT_TYPE ddFloor(CGFLOAT_TYPE cgfloat) {
#if CGFLOAT_IS_DOUBLE
    return floor(cgfloat);
#else
    return floorf(cgfloat);
#endif
}

static inline CGFLOAT_TYPE ddRound(CGFLOAT_TYPE cgfloat) {
#if CGFLOAT_IS_DOUBLE
    return round(cgfloat);
#else
    return roundf(cgfloat);
#endif
}


@interface NSObject (DDTools)

@end
