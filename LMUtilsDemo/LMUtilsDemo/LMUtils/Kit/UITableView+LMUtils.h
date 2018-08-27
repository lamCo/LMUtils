//
//  UITableView+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/// table view 分类
@interface UITableView (LMUtils)


/**
 对齐cell下线边缘
 */
- (void)alignmentCellLineEdge;

/**
 *  注册cell for cell class
 *
 *  @param cellClass  cell class
 *  @param identifier 复用string
 */
- (void)registerCellNibClass:(Class)cellClass
      forCellReuseIdentifier:(NSString *)identifier;

@end
