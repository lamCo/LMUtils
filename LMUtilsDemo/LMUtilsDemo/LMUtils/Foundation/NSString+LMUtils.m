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

@end
