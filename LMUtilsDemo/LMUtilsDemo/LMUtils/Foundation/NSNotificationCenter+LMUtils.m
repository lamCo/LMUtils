//
//  NSNotificationCenter+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSNotificationCenter+LMUtils.h"
#import <pthread.h>
@implementation NSNotificationCenter (LMUtils)
// 主线程中Post通知
+ (void)postNotificationOnMainThread:(NSNotificationName)name
                              object:(id)anObject
                            userInfo:(NSDictionary *)userinfo {
    
    
    
    if (pthread_main_np()) {
        [[self defaultCenter] postNotificationName:name object:anObject userInfo:userinfo];
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self defaultCenter] postNotificationName:name object:anObject userInfo:userinfo];
        });
    }
}


// 添加通知
+ (void)addNotificationObserver:(id)observer
                       selector:(SEL)aSelector
                           name:(NSNotificationName)aName
                         object:(id)anObject{
    [[self defaultCenter] addObserver:observer
                             selector:aSelector
                                 name:aName
                               object:anObject];
}


// 移除通知
+ (void) removeObserver:(id)observer
                   name:(NSNotificationName)aName
                 object:(id)anObject{
    [[self defaultCenter] removeObserver:observer
                                    name:aName
                                  object:anObject];
}
@end
