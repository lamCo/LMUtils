//
//  UIScrollView+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIScrollView+LMUtils.h"

@implementation UIScrollView (LMUtils)

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
