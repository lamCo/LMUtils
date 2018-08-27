//
//  UIScrollView+LMEventObstruct.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIScrollView+LMEventObstruct.h"

@implementation UIScrollView (LMEventObstruct)
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self isMemberOfClass:[UIScrollView class]]) {
        [[self nextResponder] touchesBegan:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesBegan:touches withEvent:event];
        }
        
    }
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self isMemberOfClass:[UIScrollView class]]) {
        [[self nextResponder] touchesMoved:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesMoved:touches withEvent:event];
        }
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([self isMemberOfClass:[UIScrollView class]]) {
        [[self nextResponder] touchesEnded:touches withEvent:event];
        if ([super respondsToSelector:@selector(touchesBegan:withEvent:)]) {
            [super touchesEnded:touches withEvent:event];
        }
        
    }
}
@end
