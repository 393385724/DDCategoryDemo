//
//  NSString+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSString+DDTools.h"

@implementation NSString (DDPath)

+ (NSString *)ddDocumentsPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    return docDir;
}

+ (NSString *)ddCachesPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    return cachesDir;
}

+ (NSString *)ddTmpPath{
    NSString *tmpDir = NSTemporaryDirectory();
    return tmpDir;
}

@end

@implementation NSString (DDNetWork)

+ (NSString *)ddQueryStringWithDict:(NSDictionary *)dict{
    NSString *paramString = @"";
    for (NSString *keyString in dict) {
        id value = [dict objectForKey:keyString];
        paramString = [paramString stringByAppendingFormat:@"%@=%@&",keyString,value];
    }
    if([paramString length] > 1){
        paramString=[paramString substringToIndex:[paramString length]-1];
    }
    return paramString;
}


@end
