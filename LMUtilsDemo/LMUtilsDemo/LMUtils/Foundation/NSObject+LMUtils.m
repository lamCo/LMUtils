//
//  NSObject+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSObject+LMUtils.h"
#import <objc/runtime.h>

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


/// 替换系统方法
+ (BOOL)swizzledSelector:(SEL)swizzledSelector systemSelector:(SEL)systemSelector  {
    
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    if (!systemMethod) {
        return NO;
    }
    
    Method swizzledMethod = class_getInstanceMethod(self, swizzledSelector);
    if (!swizzledMethod) {
        
        return NO;
    }
    
    if (class_addMethod([self class], systemSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        
        class_replaceMethod([self class], swizzledSelector, method_getImplementation(systemMethod), method_getTypeEncoding(systemMethod));
    }else{
        method_exchangeImplementations(systemMethod, swizzledMethod);
    }
    
    return YES;
}


@end
