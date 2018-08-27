//
//  NSMutableAttributedString+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "NSMutableAttributedString+LMUtils.h"

@implementation NSMutableAttributedString (LMUtils)

// NSFontAttributeName & NSForegroundColorAttributeName
- (void)addTextColor:(UIColor *)color
                font:(UIFont *)font
               range:(NSRange)range {
    
    // 字体大小
    if (font) {
        [self addAttribute:NSFontAttributeName value:font range:range];
    }
    
    // 字体颜色
    if (color) {
        [self addAttribute:NSForegroundColorAttributeName value:color range:range];
    }
}
@end
