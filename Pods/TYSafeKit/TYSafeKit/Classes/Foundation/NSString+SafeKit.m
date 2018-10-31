//
//  NSString+SafeKit.m
//  SafeKitExample
//
//  Created by liyongqiang on 16-3-15.
//  Copyright (c) 2016年 liyongqiang. All rights reserved.
//

#import "NSString+SafeKit.h"
#import "NSObject+swizzle.h"

@implementation NSString (SafeKit)

#if !DEBUG
- (unichar)safe_characterAtIndex:(NSUInteger)index {
    if (index >= [self length]) {
        return 0;
    }
    return [self safe_characterAtIndex:index];
}

- (NSString *)safe_substringWithRange:(NSRange)range {
    if (range.location + range.length > self.length) {
        return @"";
    }
    return [self safe_substringWithRange:range];
}

+ (void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self safe_swizzleMethod:@selector(safe_characterAtIndex:) tarClass:@"__NSCFString" tarSel:@selector(characterAtIndex:)];
        [self safe_swizzleMethod:@selector(safe_substringWithRange:) tarClass:@"__NSCFString" tarSel:@selector(substringWithRange:)];
        [self safe_swizzleMethod:@selector(safe_substringFromIndex:) tarClass:@"__NSCFString" tarSel:@selector(substringFromIndex:)];
        [self safe_swizzleMethod:@selector(safe_substringToIndex:) tarClass:@"__NSCFString" tarSel:@selector(substringToIndex:)];
    });
}


- (NSString *)safe_substringFromIndex:(NSUInteger)from {
    if (from > self.length) {
        return @"";
    }
    return [self safe_substringFromIndex:from];
}

- (NSString *)safe_substringToIndex:(NSUInteger)to {
    if (to > self.length) {
        return self;
    }
    return [self safe_substringToIndex:to];
}


#endif

@end
