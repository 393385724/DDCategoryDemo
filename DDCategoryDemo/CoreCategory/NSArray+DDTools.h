//
//  NSArray+DDTools.h
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DDFile)

- (BOOL)ddWriteToDataFile:(NSString *)path atomically:(BOOL)atomically;
+ (NSDictionary *)ddReadFromDataFile:(NSString *)path;

@end

@interface NSMutableArray (DDLogic)

- (void)ddReverse;

@end

@interface NSArray (DDSafety)

- (id)ddObjectAtSafeIndex:(NSUInteger)index;

@end

@interface NSMutableArray (DDSafety)

- (void)ddAddSafeObject:(id)object;
- (void)ddInsertSafeObject:(id)object atIndex:(NSUInteger)index;

@end