//
//  UIView+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIView+LMUtils.h"

@implementation UIView (LMViewXibUtils)

// 在Main Bundle内根据View的类名创建Xib View
+ (instancetype)instantiateFromNibInMainBundle {
    
    // 获取class name
    NSString *classname = NSStringFromClass([self class]);
    
    // 创建xib name
    if ([classname rangeOfString:@"."].location != NSNotFound) {
        classname = [classname componentsSeparatedByString:@"."].lastObject;
    }
    
    return [self instantiateFromNibInBundle:[NSBundle mainBundle] nibName:classname];
}

// 根据xib名字创建view
+ (instancetype)instantiateFromNibInBundle:(NSBundle *)bundle nibName:(NSString *)name {
    
    // nib
    UINib *nib = [UINib nibWithNibName:name bundle:bundle];
    
    if (nib) {
        // nib views
        NSArray *views = [nib instantiateWithOwner:self options:nil];
        
        for (UIView *view in views) {
            if ([view isMemberOfClass:self.class]) {
                return view;
            }
        }
    }
    
    return nil;
}

@end


@implementation UIView (LMViewAnimatedUtils)

// 执行约束动画
- (void)updateConstraintsIfNeeded:(BOOL)animated
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(BOOL finished))completion {
    
    if (animated && duration == 0) {
        duration = .25f;
    }
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         [self layoutIfNeeded];
                     } completion:completion];
}

// 模拟pop动画
- (void)popCustomAnimationWithDuration:(CFTimeInterval)duration {
    CAKeyframeAnimation * animation;
    animation                     = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.duration            = duration;
    animation.removedOnCompletion = YES;
    animation.fillMode = kCAFillModeForwards;
    
    NSArray *values = @[
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.0)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.9, 0.9, 0.9)],
                        [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]
                        ];
    
    animation.values = values;
    animation.timingFunction = [CAMediaTimingFunction functionWithName: kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.layer addAnimation:animation forKey:nil];
}

///  添加过渡动画
- (void)addCATransitionAnimation:(NSString *)type {
    CATransition *transition = [CATransition animation];
    transition.type = type;
    [self.layer addAnimation:transition forKey:nil];
}


@end


@implementation UIView (LMViewFrameUtils)

/// setter left
- (void)setLm_Left:(CGFloat)lm_Left {
    CGRect frame = self.frame;
    frame.origin.x = lm_Left;
    self.frame = frame;
}

/// getter left
- (CGFloat)lm_Left {
    return self.frame.origin.x;
}

/// setter right
- (void)setLm_Right:(CGFloat)lm_Right {
    CGRect frame = self.frame;
    frame.origin.x = lm_Right - frame.size.width;
    self.frame = frame;
}

/// getter right
- (CGFloat)lm_Right {
    return self.frame.origin.x + self.frame.size.width;
}

/// setter top
- (void)setLm_Top:(CGFloat)lm_Top {
    CGRect frame = self.frame;
    frame.origin.y = lm_Top;
    self.frame = frame;
}

//// getter top
- (CGFloat)lm_Top {
    return self.frame.origin.y;
}

/// setter bottom
- (void)setLm_Bottom:(CGFloat)lm_Bottom {
    CGRect frame = self.frame;
    frame.origin.y = lm_Bottom - frame.size.height;
    self.frame = frame;
}

/// getter bottom
- (CGFloat)lm_Bottom {
    return self.frame.origin.y + self.frame.size.height;
}

/// setter width
- (void)setLm_Width:(CGFloat)lm_Width {
    CGRect frame = self.frame;
    frame.size.width = lm_Width;
    self.frame = frame;
}

/// getter width
- (CGFloat)lm_Width {
    return CGRectGetWidth(self.frame);
}


// setter getter height
- (CGFloat)lm_Height {
    return self.frame.size.height;
}

- (void)setLm_Height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

// setter getter center x
- (CGFloat)lm_CenterX {
    return self.center.x;
}

- (void)setLm_CenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

// setter getter center y
- (CGFloat)lm_CenterY {
    return self.center.y;
}

- (void)setLm_CenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

// 针对给定的坐标系居中
- (void)centerInRect:(CGRect)rect {
    //如果参数是小数，则求最大的整数但不大于本身.
    //CGRectGetMilm_获取中心点的X轴坐标
    CGFloat x = floorf(CGRectGetMidX(rect)) + ((int)floorf([self lm_Width]) % 2 ? .5 : 0) ;
    CGFloat y = floorf(CGRectGetMidY(rect)) + ((int)floorf([self lm_Height]) % 2 ? .5 : 0);
    [self setCenter:CGPointMake(x,y)];
}

// 针对给定的坐标系纵向居中
- (void)centerVerticallyInRect:(CGRect)rect {
    CGFloat x = [self center].x;
    CGFloat y = floorf(CGRectGetMidY(rect)) + ((int)floorf([self lm_Height]) % 2 ? .5 : 0);
    [self setCenter:CGPointMake(x,y)];
}

// 针对给定的坐标系横向居中
- (void)centerHorizontallyInRect:(CGRect)rect {
    CGFloat x = floorf(CGRectGetMidX(rect)) + ((int)floorf([self lm_Width]) % 2 ? .5 : 0);
    CGFloat y = [self center].y;
    [self setCenter:CGPointMake(x,y)];
}

// 相对父视图居中
- (void)centerInSuperView {
    [self centerInRect:[[self superview] bounds]];
}

// 相对父视图纵向居中
- (void)centerVerticallyInSuperView {
    [self centerVerticallyInRect:[[self superview] bounds]];
}

// 相对父视图横向居中
- (void)centerHorizontallyInSuperView {
    [self centerHorizontallyInRect:[[self superview] bounds]];
}

//
- (void)centerHorizontallyBelow:(UIView *)view padding:(CGFloat)padding {
    // for now, could use screen relative positions.
    NSAssert([self superview] == [view superview], @"views must have the same parent");
    CGFloat x = [view center].x;
    CGFloat y = floorf(padding + CGRectGetMaxY([view frame]) + ([self lm_Height] / 2));
    [self setCenter:CGPointMake(x,y)];
}

// 同一父视图的兄弟视图水平居中
- (void)centerHorizontallyBelow:(UIView *)view {
    [self centerHorizontallyBelow:view padding:0];
}


@end














