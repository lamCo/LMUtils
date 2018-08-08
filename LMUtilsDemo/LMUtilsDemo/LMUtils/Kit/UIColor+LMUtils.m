//
//  UIColor+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIColor+LMUtils.h"

@implementation UIColor (LMUtils)

/// 16进制颜色
+ (instancetype)colorWithHex:(unsigned int)hex {
    return [self colorWithHex:hex alpha:1.0];
}

/// 16进制颜色
+ (instancetype)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha {
    CGFloat r = (hex & 0xff0000) >> 16;
    CGFloat g = (hex & 0xff00) >> 8;
    CGFloat b = (hex & 0xff);
    return [self colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:alpha];
}

/// 随机颜色
+ (instancetype)randomColor {
    CGFloat r = rand() % 255;
    CGFloat g = rand() % 255;
    CGFloat b = rand() % 255;
    return [self colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1.0];
}

/// css 颜色
+ (instancetype)cssColor:(NSString *)css {
    return [self cssColor:css alpha:1.0];
}

/// css 颜色
+ (instancetype)cssColor:(NSString *)css alpha:(CGFloat)alpha{
    
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    
    NSString *cString = [[css stringByTrimmingCharactersInSet:set] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((CGFloat) r)/255.f
                           green:((CGFloat) g)/255.f
                            blue:((CGFloat) b)/255.f
                           alpha:alpha];
}


@end
