//
//  NSError+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/12.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSError+DDTools.h"
#import "NSDictionary+DDTools.h"

@implementation NSError (DDTools)

+ (NSError *)errorWithTitle:(NSString *)title code:(NSInteger)code otherInfo:(NSDictionary *)otherInfo{
    return [self errorWithTitle:title description:nil code:code otherInfo:otherInfo];
}

+ (NSError *)errorWithTitle:(NSString *)title description:(NSString *)description code:(NSInteger)code otherInfo:(NSDictionary *)otherInfo{
    NSMutableDictionary *userInfo = [[NSMutableDictionary alloc] init];
    [userInfo ddSetSafeObject:title forKey:NSLocalizedDescriptionKey];
    [userInfo ddSetSafeObject:description forKey:NSLocalizedFailureReasonErrorKey];
    [userInfo addEntriesFromDictionary:otherInfo];
    return [NSError errorWithDomain:NSStringFromClass([self class]) code:code userInfo:userInfo];
}

@end
