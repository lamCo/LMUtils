//
//  NSNull+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 NSNull 针对返回数据容错机制
 */
@interface NSNull (LMUtils)

// 重写一些number方法，容错
@property (readonly) char charValue;
@property (readonly) unsigned char unsignedCharValue;
@property (readonly) short shortValue;
@property (readonly) unsigned short unsignedShortValue;
@property (readonly) int intValue;
@property (readonly) unsigned int unsignedIntValue;
@property (readonly) long longValue;
@property (readonly) unsigned long unsignedLongValue;
@property (readonly) long long longLongValue;
@property (readonly) unsigned long long unsignedLongLongValue;
@property (readonly) float floatValue;
@property (readonly) double doubleValue;
@property (readonly) BOOL boolValue;
@property (readonly) NSInteger integerValue NS_AVAILABLE(10_5, 2_0);
@property (readonly) NSUInteger unsignedIntegerValue NS_AVAILABLE(10_5, 2_0);
@property (readonly, copy) NSString *stringValue;

@end
