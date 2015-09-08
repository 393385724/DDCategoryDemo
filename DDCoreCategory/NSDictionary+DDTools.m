//
//  NSDictionary+DDTools.m
//  DDCategoryDemo
//
//  Created by lilingang on 15/9/7.
//  Copyright (c) 2015年 LeeLingang. All rights reserved.
//

#import "NSDictionary+DDTools.h"


@implementation NSDictionary (DDFile)

- (BOOL)ddWriteToDataFile:(NSString *)path atomically:(BOOL)atomically {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    BOOL didWriteSuccessful = [data writeToFile:path atomically:atomically];
    return didWriteSuccessful;
}

+ (NSDictionary *)ddReadFromDataFile:(NSString *)path {
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end

@implementation NSDictionary (DDNetWork)

- (NSString *)ddQueryString{
    NSString *paramString = @"";
    for (NSString *keyString in self) {
        id value = [self objectForKey:keyString];
        paramString = [paramString stringByAppendingFormat:@"%@=%@&",keyString,value];
    }
    if([paramString length] > 1){
        paramString=[paramString substringToIndex:[paramString length]-1];
    }
    return paramString;
}

@end

@implementation NSDictionary (DDSafety)

- (id)ddObjectForSafeKey:(id)aKey{
    if (!aKey) {
        return nil;
    }
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return object;
}

- (id)ddObjectForSafeKey:(id)aKey defaultValue:(id)value{
    id object = [self ddObjectForSafeKey:aKey];
    if (!object) {
        object = value;
    }
    return object;
}

@end

@implementation NSMutableDictionary (DDSafety)

- (void)ddSetSafeObject:(id)anObject forKey:(id <NSCopying>)aKey {
    if (aKey && anObject) {
        [self setObject:anObject forKey:aKey];
    }
}

@end


