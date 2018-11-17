//
//  UILabel+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/10/22.
//  Copyright © 2018 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    label分类
 */
@interface UILabel (LMUtils)
/**
 *  创建不换行的label NSLineBreakByTruncatingTail
 *
 *  @param size          字体大小系统字体
 *  @param textColor     字体颜色
 *  @param textAlignment 字体位置格式
 *
 *  @return label
 */
+ (instancetype)labelWithSystemFontOfSize:(CGFloat)size
                                textColor:(UIColor *)textColor
                            textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建不换行的label NSLineBreakByTruncatingTail
 *
 *  @param font          字体大小
 *  @param textColor     字体颜色
 *  @param textAlignment 字体位置格式
 *
 *  @return label
 */
+ (instancetype)labelWithFont:(UIFont *)font
                    textColor:(UIColor *)textColor
                textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建换行的label NSLineBreakByWordWrapping
 *
 *  @param size          字体大小
 *  @param textColor     字体颜色
 *  @param textAlignment 字体位置格式
 *
 *  @return label
 */
+ (instancetype)labelWrapWithFontSize:(CGFloat)size
                            textColor:(UIColor *)textColor
                        textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建换行的label NSLineBreakByWordWrapping
 *
 *  @param font          字体大小
 *  @param textColor     字体颜色
 *  @param textAlignment 字体位置格式
 *
 *  @return label
 */
+ (instancetype)labelWrapWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment;
@end

