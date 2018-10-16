//
//  UINavigationController+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/10/16.
//  Copyright © 2018 lam. All rights reserved.
//

#import "UINavigationController+LMUtils.h"

@implementation UINavigationController (LMUtils)

// 删除导航中间层
- (void)removeCenterViewControllers:(NSRange)range {
    [self removeCenterViewControllers:range animated:NO];
}

// 删除导航中间层
- (void)removeCenterViewControllers:(NSRange)range animated:(BOOL)animated {
    
    NSMutableArray *controllers = self.viewControllers.mutableCopy;
    
    if (range.length + range.location <= controllers.count) {
        
        [controllers removeObjectsInRange:range];
        
        [self setViewControllers:controllers animated:NO];
    }
}

@end
