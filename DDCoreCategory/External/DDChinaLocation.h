//
//  DDChinaLocation.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/22.
//  Copyright © 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CLLocation.h>

@interface DDChinaLocation : NSObject

//单例
+ (DDChinaLocation *)shared;

//判断location是否在中国
- (BOOL)isInsideChina:(CLLocationCoordinate2D)location;

@end
