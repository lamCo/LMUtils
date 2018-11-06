//
//  NSString+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSString+LMUtils.h"

@implementation NSString (LMUtils)

-(char)charValue {
    return [NSDecimalNumber decimalNumberWithString:self].charValue;
}

- (unsigned char)unsignedCharValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedCharValue;
}

- (short)shortValue {
    return [NSDecimalNumber decimalNumberWithString:self].shortValue;
}

- (unsigned short)unsignedShortValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedShortValue;
}

- (unsigned int)unsignedIntValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedIntValue;
}

- (long)longValue {
    return [NSDecimalNumber decimalNumberWithString:self].longValue;
}

- (unsigned long)unsignedLongValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedLongValue;
}

- (unsigned long long)unsignedLongLongValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedLongLongValue;
}

- (NSUInteger)unsignedIntegerValue {
    return [NSDecimalNumber decimalNumberWithString:self].unsignedIntegerValue;
}

- (NSString *)stringValue {
    return self;
}


/// 获取文字size
- (CGSize)stringSizeFromFont:(UIFont *)font {
    return [self stringSizeFromMaxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:font];
}

///  获取文字size
- (CGSize)stringSizeFromMaxSize:(CGSize)masSize font:(UIFont *)font {
    CGSize size = [self boundingRectWithSize:masSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName:font} context:nil].size;
    
    return size;
}

/// 转换
+ (NSString *)dateToString:(NSDate *)date dateFormatter:(NSString *)dateFormatter {
    //日期
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateStyle:NSDateFormatterMediumStyle];
    [dateformatter setTimeStyle:NSDateFormatterShortStyle];
    [dateformatter setDateFormat:dateFormatter];
    NSString *dateString = [dateformatter stringFromDate:date];
    return dateString ? dateString : @"";
}


//date转string
+ (NSString *)timeIntervalToString:(NSTimeInterval)timeInterval dateFormatter:(NSString *)dateFormatter {
    
    if (timeInterval <= 0) return @"";
    
    if (!dateFormatter || ![dateFormatter isKindOfClass:[NSString class]])return @"";
    
    
    NSDate *date = nil;
    
    //毫秒级
    if (timeInterval > 1000000000000.f) {
        date = [NSDate dateWithTimeIntervalSince1970:timeInterval / 1000.f];
    } else {
        date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    }
    
    return [self dateToString:date dateFormatter:dateFormatter];
}

/// 转换
+ (NSDate *)stringToDate:(NSString *)string dateFormatter:(NSString *)dateFormatter {
    return [string toDateWithFormatter:dateFormatter];
}

/// 转换
- (NSDate *)toDateWithFormatter:(NSString *)dateFormatter {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat : dateFormatter];
    
    NSDate *dateTime = [formatter dateFromString:self];
    
    return dateTime ? dateTime : [NSDate date];
}

@end
