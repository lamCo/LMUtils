//
//  NSString+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
    String 分类
 */
@interface NSString (LMUtils)

// 重写一些number方法，容错
@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) NSUInteger unsignedIntegerValue NS_AVAILABLE(10_5, 2_0);
@property (readonly, copy) NSString *stringValue;

@end
