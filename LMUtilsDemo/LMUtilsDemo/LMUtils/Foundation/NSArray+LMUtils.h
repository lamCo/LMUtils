//
//  NSArray+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray<ObjectType> (LMUtils)

/**
 通过NSPredicate筛选
 @param predicateString 筛选文字
 */
- (NSArray<ObjectType> *)filteredArrayUsingPredicateString:(NSString *)predicateString;

/**
 通过NSPredicate筛选，筛选不为nil，返回一个obj
 @param predicateString 筛选文字
 */
- (ObjectType)filteredArrayReturnFirstObjcet:(NSString *)predicateString;

@end
