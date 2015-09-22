//
//  CLLocation+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/22.
//  Copyright © 2015年 LeeLingang. All rights reserved.
//

/*
 名词
 地球坐标 (WGS84)-国际标准，GPS标准从 GPS 设备中取出的原始数据是就是这个
 火星坐标 (GCJ-02)- 中国标准，行货 GPS 设备取出的最终数据是这个
 百度坐标 (BD-09) - 百度标准，百度 SDK，地图，Geocoding 用的都是这个。
 
 开发时所面临的现状
 1、获取经纬度（GPS）
 火星坐标：MKMapView
 地球坐标：CLLocationManager
 2、显示经纬度（地图）
 火星坐标：iOS地图、Gogole地图、搜搜、阿里云、高德地图
 地球坐标：Google 卫星地图（国外地图应该都是……）
 百度坐标：百度地图
 */

#import "CLLocation+DDTools.h"
#import <JZLocationConverter/JZLocationConverter.h>
#import "DDChinaLocation.h"

@implementation CLLocation (DDTools)

- (BOOL)isInsideChina{
    return [[DDChinaLocation shared] isInsideChina:self.coordinate];
}

- (CLLocation *)WGS84ToGCJ02{
    if (![self isInsideChina]) {
        return self;
    }
    else {
        CLLocationCoordinate2D coordinate2D = [JZLocationConverter wgs84ToGcj02:self.coordinate];
        CLLocation *convertedLocation = [[CLLocation alloc] initWithCoordinate:coordinate2D
                                                                      altitude:self.altitude
                                                            horizontalAccuracy:self.horizontalAccuracy
                                                              verticalAccuracy:self.verticalAccuracy
                                                                        course:self.course
                                                                         speed:self.speed
                                                                     timestamp:self.timestamp];
        return convertedLocation;
    }
}

@end
