//
//  NSMutableArray+SafeKit.m
//  SafeKitExample
//
//  Created by liyongqiang on 16-3-13.
//  Copyright (c) 2016年 liyongqiang. All rights reserved.
//

#import "NSMutableArray+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSMutableArray (SafeKit)

- (void)safe_addObject:(id)anObject {
    if (!anObject) {
        return;
    }
    [self safe_addObject:anObject];
}

- (void)safe_insertObject:(id)anObject atIndex:(NSUInteger)index {
    if (index > [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_insertObject:anObject atIndex:index];
}

- (void)safe_removeObjectAtIndex:(NSUInteger)index {
    if (index >= [self count]) {
        return;
    }
    
    return [self safe_removeObjectAtIndex:index];
}
- (void)safe_replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject {
    if (index >= [self count]) {
        return;
    }
    if (!anObject) {
        return;
    }
    [self safe_replaceObjectAtIndex:index withObject:anObject];
}

// array[index];
- (id)safe_objectAtIndexedSubscript:(NSUInteger)idx
{
    if (idx >= [self count]) {
        return nil;
    }
    return [self safe_objectAtIndexedSubscript:idx];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_addObject:) tarClass:@"__NSArrayM" tarSel:@selector(addObject:)];
        [self safe_swizzleMethod:@selector(safe_insertObject:atIndex:) tarClass:@"__NSArrayM" tarSel:@selector(insertObject:atIndex:)];
        [self safe_swizzleMethod:@selector(safe_removeObjectAtIndex:) tarClass:@"__NSArrayM" tarSel:@selector(removeObjectAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_replaceObjectAtIndex:withObject:) tarClass:@"__NSArrayM" tarSel:@selector(replaceObjectAtIndex:withObject:)];
        [self safe_swizzleMethod:@selector(safe_objectAtIndexedSubscript:) tarClass:@"__NSArrayM" tarSel:@selector(objectAtIndexedSubscript:)];

    });
}

@end
