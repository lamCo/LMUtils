//
//  UIAlertAction+LMUtils.m
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIAlertAction+LMUtils.h"
#import <objc/runtime.h>

NSString *const kLMTextColorKey = @"titleTextColor";

static UIColor *_DefaultTitleColor = nil;

@implementation UIAlertAction (LMUtils)

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(actionWithTitle:style:handler:);
        
        SEL swizzledSelector = @selector(lm_actionWithTitle:style:handler:);
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}

+ (instancetype)lm_actionWithTitle:(NSString *)title style:(UIAlertActionStyle)style handler:(void (^)(UIAlertAction *))handler {
    UIAlertAction *action = [self lm_actionWithTitle:title style:style handler:handler];
    UIColor *color = [self defaultTitleColor];
    if (color) {
        [action setTitleColor:color];
    }
    return action;
}

+ (void)setDefaultTitleColor:(UIColor *)defaultTitleColor {
    if (_DefaultTitleColor != defaultTitleColor) {
        _DefaultTitleColor = defaultTitleColor.copy;
    }
}

+ (UIColor *)defaultTitleColor {
    return _DefaultTitleColor;
}

- (void)setTitleColor:(UIColor *)color {
    [self setValue:color forKey:kLMTextColorKey];
}
- (UIColor *)titleColor {
    return [self valueForKey:kLMTextColorKey];
}
@end
