//
//  UIButton+LMUtils.m
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIButton+LMUtils.h"
#import <objc/runtime.h>

static NSTimeInterval const kDefaultEventInterval = .5f;

static NSArray *_IgnoreButtonsClasss = nil;

@implementation UIButton (LMUtils)

+ (void)setIgnoreButtons:(NSArray<NSString *> *)ignoreButtons {
    if (_IgnoreButtonsClasss != ignoreButtons) {
        _IgnoreButtonsClasss = ignoreButtons.copy;
    }
}

+ (NSArray<NSString *> *)ignoreButtons {
    if (_IgnoreButtonsClasss) {
        return _IgnoreButtonsClasss;
    }
    return @[];
}


+ (void)load {
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(sendAction:to:forEvent:);
        
        SEL swizzledSelector = @selector(lm_sendAction:to:forEvent:);
        
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
            
            class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

static const char *UIControl_acceptEventInterval = "UIControl_acceptEventInterval";

- (NSTimeInterval)acceptEventInterval {
    
    NSNumber *number = objc_getAssociatedObject(self, UIControl_acceptEventInterval);
    
    if (number) {
        return [number doubleValue];
    }
    
    return kDefaultEventInterval;
}

- (void)setAcceptEventInterval:(NSTimeInterval)acceptEventInterval
{
    objc_setAssociatedObject(self, UIControl_acceptEventInterval, @(acceptEventInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

static const char *UIControl_ignoreEvent = "UIControl_ignoreEvent";

- (BOOL)ignoreEvent {
    return [objc_getAssociatedObject(self, UIControl_ignoreEvent) doubleValue];
}

- (void)setIgnoreEvent:(BOOL)ignoreEvent{
    objc_setAssociatedObject(self, UIControl_ignoreEvent, @(ignoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lm_sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event {
    
    NSString *classString = NSStringFromClass(self.class);
    
    if ([self isMemberOfClass:[UIButton class]] || [[self.class ignoreButtons] containsObject:classString]) {
        
        if (self.ignoreEvent) {
            return;
        }
        
        if (self.acceptEventInterval > 0) {
            self.ignoreEvent = YES;
            __weak typeof(self) weakSelf = self;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.acceptEventInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                __strong typeof(weakSelf) strongSelf = weakSelf;
                if(!strongSelf)return;
                strongSelf.ignoreEvent = NO;
            });
        }
    }
    
    [self lm_sendAction:action to:target forEvent:event];
}
@end
