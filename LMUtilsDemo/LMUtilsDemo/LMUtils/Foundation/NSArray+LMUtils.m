//
//  NSArray+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSArray+LMUtils.h"

/**
    NSArray
 */
@implementation NSArray (LMUtils)

// 通过NSPredicate筛选
- (NSArray *)filteredArrayUsingPredicateString:(NSString *)predicateString {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:predicateString];
    return [self filteredArrayUsingPredicate:predicate];
}

@end
