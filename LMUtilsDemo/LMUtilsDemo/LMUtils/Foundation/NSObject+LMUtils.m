//
//  NSObject+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSObject+LMUtils.h"

@implementation NSObject (LMUtils)

#pragma mark - your can overwrite
- (void)setNilValueForKey:(NSString *)key {
    NSLog(@"%@ setNilValueForKey",NSStringFromClass([self class]));
}

- (id)valueForUndefinedKey:(NSString *)key {
    NSLog(@"%@ KVC GET KEY Undefined :%@",NSStringFromClass([self class]),key);
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    NSLog(@"%@ KVC SET KEY Undefined :%@",NSStringFromClass([self class]),key);
}

@end
