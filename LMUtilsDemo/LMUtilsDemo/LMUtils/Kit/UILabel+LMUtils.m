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
                             textColorHex:(unsigned int)textColorHex
                            textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWithSystemFontOfSize:size
                                 textColor:[UIColor colorWithHex:textColorHex]
                             textAlignment:textAlignment];
}

/// 创建
+ (instancetype)labelWithSystemFontOfSize:(CGFloat)size
                                textColor:(UIColor *)textColor
                          textAlignment:(NSTextAlignment)textAlignment {
    
    return [self labelWithFont:[UIFont systemFontOfSize:size]
                           textColor:textColor
                       textAlignment:textAlignment];
}

/// 创建不换行的label BoldSystemFontOfSize:
+ (instancetype)labelWithBoldSystemFontOfSize:(CGFloat)size
                                 textColorHex:(unsigned int)textColorHex
                                textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWithBoldSystemFontOfSize:size
                                     textColor:[UIColor colorWithHex:textColorHex]
                                 textAlignment:textAlignment];
}

/// 创建
+ (instancetype)labelWithBoldSystemFontOfSize:(CGFloat)size
                                    textColor:(UIColor *)textColor
                                textAlignment:(NSTextAlignment)textAlignment {
    
    return [self labelWithFont:[UIFont boldSystemFontOfSize:size]
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

/// 创建换行的label SystemFontOfSize: NSLineBreakByWordWrapping
+ (instancetype)labelWrapWithSystemFontOfSize:(CGFloat)size
                                 textColorHex:(unsigned int)textColorHex
                                textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWrapWithSystemFontOfSize:size
                                     textColor:[UIColor colorWithHex:textColorHex]
                                 textAlignment:textAlignment];
}

/// 创建
+ (instancetype)labelWrapWithSystemFontOfSize:(CGFloat)size
                                    textColor:(UIColor *)textColor
                                textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWrapWithFont:[UIFont systemFontOfSize:size]
                         textColor:textColor
                    textAlignment:textAlignment];
}

/// 创建不换行的label BoldSystemFontOfSize:
+ (instancetype)labelWrapWithBoldSystemFontOfSize:(CGFloat)size
                                     textColorHex:(unsigned int)textColorHex
                                    textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWrapWithBoldSystemFontOfSize:size
                                         textColor:[UIColor colorWithHex:textColorHex]
                                     textAlignment:textAlignment];
}

/// 创建
+ (instancetype)labelWrapWithBoldSystemFontOfSize:(CGFloat)size
                                        textColor:(UIColor *)textColor
                                    textAlignment:(NSTextAlignment)textAlignment {
    return [self labelWrapWithFont:[UIFont boldSystemFontOfSize:size]
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
