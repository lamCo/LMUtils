//
//  UIColor+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 UIColor分类
 */
@interface UIColor (LMUtils)

/**
 16进制颜色 0x123456方式来创建
 */
+ (instancetype)colorWithHex:(unsigned int)hex ;

/**
 16进制颜色 0x123456方式来创建
 */
+ (instancetype)colorWithHex:(unsigned int)hex alpha:(CGFloat)alpha ;

/**
 随机颜色
 */
+ (instancetype)randomColor;

/**
 css 颜色，字符创建，类似 @"0x123456"或@"#FF12FF"
 */
+ (instancetype)cssColor:(NSString *)css;

/**
 css 颜色，字符创建，类似 @"0x123456"或@"#FF12FF"
 */
+ (instancetype)cssColor:(NSString *)css alpha:(CGFloat)alpha;


@end
