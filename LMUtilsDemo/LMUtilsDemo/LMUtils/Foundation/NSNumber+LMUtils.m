//
//  NSNumber+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/11/2.
//  Copyright © 2018 lam. All rights reserved.
//

#import "NSNumber+LMUtils.h"

@implementation NSNumber (LMUtils)


- (BOOL)isEqualToString:(NSString *)aString {
    
    /// 如果是number
    if ([aString isKindOfClass:[NSNumber class]]) {
        return [self isEqualToNumber:(NSNumber *)aString];
    }
    
    /// 如果是string
    if ([aString isKindOfClass:[NSString class]]) {
        return [self.stringValue isEqualToString:aString];
    }
    return NO;
}

@end
