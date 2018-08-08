//
//  NSArray+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LMUtils)

/**
 通过NSPredicate筛选
 @param predicateString 筛选文字
 */
- (NSArray *)filteredArrayUsingPredicateString:(NSString *)predicateString;

@end
