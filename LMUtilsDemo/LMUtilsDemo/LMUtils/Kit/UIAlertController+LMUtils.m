//
//  UIAlertController+LMUtils.m
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIAlertController+LMUtils.h"
#import <objc/runtime.h>

NSString *const kLMAttributedTitleKey = @"attributedTitle";

NSString *const kLMAttributedMessageKey = @"attributedMessage";

static UIColor *_DefaultColor = nil;

@implementation UIAlertController (LMUtils)
NS_INLINE bool kAAValidArrayWithCount(NSArray * array) {
    return array != nil && [array isKindOfClass:[NSArray class]] && array.count > 0;
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(alertControllerWithTitle:message:preferredStyle:);
        
        SEL swizzledSelector = @selector(lm_alertControllerWithTitle:message:preferredStyle:);
        
        Method originalMethod = class_getClassMethod(class, originalSelector);
        
        Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
    });
}


+ (instancetype)lm_alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    UIAlertController *alertController = [self lm_alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    /// set title attributed
    if (title && [title isKindOfClass:NSString.class] ) {
        
        UIColor *color = [self defaultColor];
        if (color) {
            UILabel *label = [alertController titleLabel];
            if (label) {
                NSRange range = NSMakeRange(0, title.length);
                NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:title];
                [attributed addAttribute:NSForegroundColorAttributeName value:color range:range];
                [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17.0] range:range];
                alertController.titleAttributed = attributed;
            }
        }
    }
    
    /// set message attributed
    if (message && [message isKindOfClass:NSString.class] ) {
        
        UIColor *color = [self defaultColor];
        if (color) {
            UILabel *label = [alertController messageLabel];
            if (label) {
                NSRange range = NSMakeRange(0, message.length);
                NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithString:message];
                [attributed addAttribute:NSForegroundColorAttributeName value:color range:range];
                [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13.0] range:range];
                alertController.messageAttributed = attributed;
            }
        }
    }
    
    return alertController;
}

+ (UIColor *)defaultColor {
    return _DefaultColor;
}

+ (void)setDefaultColor:(UIColor *)defaultColor {
    if (_DefaultColor != defaultColor) {
        _DefaultColor = defaultColor.copy;
    }
}

/// set title & massage attributed
- (void)setTitleAttributed:(NSAttributedString *)title
         messageAttributed:(NSAttributedString *)message {
    [self setTitleAttributed:title];
    [self setMessageAttributed:message];
}


/// set
- (void)setTitleAttributed:(NSAttributedString *)attributedTitle {
    if (attributedTitle) {
        [self setValue:attributedTitle.copy forKey:kLMAttributedTitleKey];
    }
}

/// get
- (NSAttributedString *)titleAttributed {
    return [self valueForKey:kLMAttributedTitleKey];
}

/// set
- (void)setMessageAttributed:(NSAttributedString *)messageAttributed {
    if (messageAttributed) {
        [self setValue:messageAttributed.copy forKey:kLMAttributedMessageKey];
    }
}

/// get
- (NSAttributedString *)messageAttributed {
    return [self valueForKey:kLMAttributedMessageKey];
}

/// get
- (UILabel *)messageLabel {
    
    UILabel *messageLabel = nil;
    
    NSArray *subviews = self.view.subviews;
    if (kAAValidArrayWithCount(subviews)) {
        UIView *subView1 = subviews[0];
        if (kAAValidArrayWithCount(subView1.subviews)) {
            UIView *subView2 = subView1.subviews[0];
            if (kAAValidArrayWithCount(subView2.subviews)) {
                UIView *subView3 = subView2.subviews[0];
                if (kAAValidArrayWithCount(subView3.subviews)) {
                    UIView *subView4 = subView3.subviews[0];
                    if (kAAValidArrayWithCount(subView4.subviews)) {
                        UIView *subView5 = subView4.subviews[0];
                        if (subView5.subviews.count >= 1) {
                            messageLabel = subView5.subviews[1];
                            if (messageLabel && [messageLabel isKindOfClass:[UILabel class]]) {
                                return messageLabel;
                            }
                        }
                    }
                }
            }
        }
    }
    return messageLabel;
}

/// get
- (UILabel *)titleLabel {
    
    UILabel *titleLabel = nil;
    
    NSArray *subviews = self.view.subviews;
    if (kAAValidArrayWithCount(subviews)) {
        UIView *subView1 = subviews[0];
        if (kAAValidArrayWithCount(subView1.subviews)) {
            UIView *subView2 = subView1.subviews[0];
            if (kAAValidArrayWithCount(subView2.subviews)) {
                UIView *subView3 = subView2.subviews[0];
                if (kAAValidArrayWithCount(subView3.subviews)) {
                    UIView *subView4 = subView3.subviews[0];
                    if (kAAValidArrayWithCount(subView4.subviews)) {
                        UIView *subView5 = subView4.subviews[0];
                        if (subView5.subviews.count > 0) {
                            titleLabel = subView5.subviews[0];
                            if (titleLabel && [titleLabel isKindOfClass:[UILabel class]]) {
                                return titleLabel;
                            }
                        }
                    }
                }
            }
        }
    }
    return titleLabel;
}



@end
