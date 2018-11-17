//
//  UILabel+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/10/22.
//  Copyright © 2018 lam. All rights reserved.
//

#import "UILabel+LMUtils.h"

@implementation UILabel (LMUtils)

/// 创建
+ (instancetype)labelWithSystemFontOfSize:(CGFloat)size
                                textColor:(UIColor *)textColor
                          t extAlignment:(NSTextAlignment)textAlignment {
    
    return [self labelWithFont:[UIFont systemFontOfSize:size]
                           textColor:textColor
                       textAlignment:textAlignment];
}
/// 创建
+ (instancetype)labelWithFont:(UIFont *)font
                          textColor:(UIColor *)textColor
                      textAlignment:(NSTextAlignment)textAlignment {
    
    return [self label:[UIColor clearColor]
                        font:font
                   textColor:textColor
               textAlignment:textAlignment
               numberOfLines:1
               lineBreakMode:NSLineBreakByTruncatingTail];
}

/// 创建
+ (instancetype)labelWrapWithFontSize:(CGFloat)size
                                  textColor:(UIColor *)textColor
                              textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWrapWithFont:[UIFont systemFontOfSize:size]
                         textColor:textColor
                    textAlignment:textAlignment];
}

/// 创建
+ (instancetype)labelWrapWithFont:(UIFont *)font
                        textColor:(UIColor *)textColor
                    textAlignment:(NSTextAlignment)textAlignment {
    return [self label:[UIColor clearColor]
                        font:font
                   textColor:textColor
               textAlignment:textAlignment
               numberOfLines:0
               lineBreakMode:NSLineBreakByCharWrapping];
}


// 创建
+ (instancetype)label:(UIColor *)backgroundColor
                       font:(UIFont *)font
                  textColor:(UIColor *)textColor
              textAlignment:(NSTextAlignment)textAlignment
              numberOfLines:(NSInteger)numberOfLines
              lineBreakMode:(NSLineBreakMode)lineBreakMode{
    UILabel *label = [self new];
    label.backgroundColor = backgroundColor;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.numberOfLines = numberOfLines;
    label.lineBreakMode = lineBreakMode;
    return label;
}

@end
