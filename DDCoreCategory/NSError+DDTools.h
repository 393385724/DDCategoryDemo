//
//  NSError+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/12.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (DDTools)

+ (NSError *)errorWithTitle:(NSString *)title code:(NSInteger)code otherInfo:(NSDictionary *)otherInfo;

+ (NSError *)errorWithTitle:(NSString *)title description:(NSString *)description code:(NSInteger)code otherInfo:(NSDictionary *)otherInfo;

@end
