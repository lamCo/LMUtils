//
//  UINavigationController+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/10/16.
//  Copyright © 2018 lam. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
    nav 分类
 */
@interface UINavigationController (LMUtils)

/**
 删除导航中间层
 
 @param range 范文
 @param animated 是否动画
 */
- (void)removeCenterViewControllers:(NSRange)range animated:(BOOL)animated;

/**
 删除导航中间层
 */
- (void)removeCenterViewControllers:(NSRange)range;

@end

