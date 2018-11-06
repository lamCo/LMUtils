//
//  NSString+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

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

/// 获取文字size
- (CGSize)stringSizeFromFont:(UIFont *)font;

/**
 获取文字size
 
 @param size 最大szie
 @param font font
 @return size
 */
- (CGSize)stringSizeFromMaxSize:(CGSize)size font:(UIFont *)font;

/**
 *  date转string
 *
 *  @param timeInterval  时间戳
 *  @param dateFormatter 规则
 *
 */
+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval
                     dateFormatter:(NSString *)dateFormatter;
/// 转换
+ (NSString *)dateToString:(NSDate *)date
             dateFormatter:(NSString *)dateFormatter;
/// 转换
+ (NSDate *)stringToDate:(NSString *)string
           dateFormatter:(NSString *)dateFormatter;
/// 转换
- (NSDate *)toDateWithFormatter:(NSString *)dateFormatter;

@end
