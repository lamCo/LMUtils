//
//  NSNull+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSNull+LMUtils.h"

@implementation NSNull (LMUtils)
- (char)charValue {
    return @(0).charValue;
}

- (unsigned char)unsignedCharValue {
    return @(0).unsignedCharValue;
}

- (short)shortValue {
    return @(0).shortValue;
}

- (unsigned short)unsignedShortValue {
    return @(0).unsignedShortValue;
}

- (int)intValue {
    return @(0).intValue;
}

- (unsigned int)unsignedIntValue {
    return @(0).unsignedIntValue;
}

- (long)longValue {
    return @(0).longValue;
}

- (unsigned long)unsignedLongValue {
    return @(0).unsignedLongValue;
}

- (long long)longLongValue {
    return @(0).longLongValue;
}


- (unsigned long long)unsignedLongLongValue {
    return @(0).unsignedLongLongValue;
}

- (float)floatValue {
    return @(0).floatValue;
}

- (double)doubleValue {
    return @(0).doubleValue;
}

- (BOOL)boolValue {
    return @(0).boolValue;
}

- (NSInteger)integerValue {
    return @(0).integerValue;
}

- (NSUInteger)unsignedIntegerValue {
    return @(0).unsignedIntegerValue;
}

- (NSString *)stringValue {
    return @"";
}

- (BOOL)isEqualToString:(NSString *)aString {
    return NO;
}

@end
