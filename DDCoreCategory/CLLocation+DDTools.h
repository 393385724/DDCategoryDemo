//
//  CLLocation+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/22.
//  Copyright © 2015年 LeeLingang. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>

@interface CLLocation (DDTools)

- (BOOL)isInsideChina;

- (CLLocation *)WGS84ToGCJ02;

@end
