//
//  NSObject+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LMUtils)



/**
 替换系统方法

 @param swizzledSelector 替换方法
 @param systemSelector 系统方法
 @return 是否成功
 */
+ (BOOL)swizzledSelector:(SEL)swizzledSelector
          systemSelector:(SEL)systemSelector;

@end
