//
//  NSArray+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSArray+DDTools.h"

@implementation NSArray (DDFile)

- (BOOL)ddWriteToDataFile:(NSString *)path atomically:(BOOL)atomically{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    BOOL didWriteSuccessful = [data writeToFile:path atomically:atomically];
    return didWriteSuccessful;
}

+ (NSDictionary *)ddReadFromDataFile:(NSString *)path{
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end

@implementation NSMutableArray (DDLogic)

- (void)ddReverse{
    if ([self count] == 0){
        return;
    }
    
    NSUInteger i = 0;
    NSUInteger j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i withObjectAtIndex:j];
        i++;
        j--;
    }
}

@end

@implementation NSArray (DDSafety)

- (id)ddObjectAtSafeIndex:(NSUInteger)index {
    if ([self count] > index) {
        return [self objectAtIndex:index];
    }
    else {
        NSLog(@"Error ddObjectAtSafeIndex:%lu count:%lu",(unsigned long)index,(unsigned long)self.count);
        return nil;
    }
}

@end


@implementation NSMutableArray (DDSafety)

- (void)ddAddSafeObject:(id)object{
    if (object) {
        [self addObject:object];
    } else {
        NSLog(@"Error ddAddSafeObject is nil");
    }
}

- (void)ddInsertSafeObject:(id)object atIndex:(NSUInteger)index{
    if (object && index <= self.count) {
        [self insertObject:object atIndex:index];
    } else {
        NSLog(@"Error ddInsertSafeObject:%@ index:%lu count:%lu",object,(unsigned long)index,(unsigned long)self.count);
    }
}

@end