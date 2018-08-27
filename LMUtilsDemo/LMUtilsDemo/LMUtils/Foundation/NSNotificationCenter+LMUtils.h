//
//  NSNotificationCenter+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 通知类
@interface NSNotificationCenter (LMUtils)


/**
    主线程中Post通知
 */
+ (void)postNotificationOnMainThread:(NSNotificationName)name
                              object:(id)anObject
                            userInfo:(NSDictionary *)aUserInfo;


/**
    添加通知
 */
+ (void)addNotificationObserver:(id)observer
                       selector:(SEL)aSelector
                           name:(NSNotificationName)aName
                         object:(id)anObject;


/**
 移除通知
 */
+ (void)removeObserver:(id)observer
                  name:(NSNotificationName)aName
                object:(id)anObject;


@end
