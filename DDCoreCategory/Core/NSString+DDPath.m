//
//  NSString+DDPath.m
//  DDCategoryDemo
//
//  Created by 李林刚 on 2017/12/6.
//  Copyright © 2017年 huami. All rights reserved.
//

#import "NSString+DDPath.h"

@implementation NSString (DDPath)

+ (NSString *)dd_documentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    return docDir;
}

+ (NSString *)dd_cachesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}

+ (NSString *)dd_tmpPath{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

@end
