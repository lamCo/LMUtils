//
//  NSMutableAttributedString+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSMutableAttributedString (LMUtils)

/**
 addAttribute:
 NSFontAttributeName & NSForegroundColorAttributeName
 
 @param color 颜色
 @param font 字体
 @param range 范围
 */
- (void)addTextColor:(UIColor *)color
                font:(UIFont *)font
               range:(NSRange)range;
@end
