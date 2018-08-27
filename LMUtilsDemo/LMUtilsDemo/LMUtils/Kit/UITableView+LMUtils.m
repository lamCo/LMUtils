//
//  UITableView+LMUtils.m
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UITableView+LMUtils.h"

@implementation UITableView (LMUtils)

// 对齐cell下线边缘
- (void)alignmentCellLineEdge {
    [self setSeparatorInset:UIEdgeInsetsZero];
    [self setLayoutMargins:UIEdgeInsetsZero];
}

//注册cell for cell class
- (void)registerCellNibClass:(Class)cellClass
      forCellReuseIdentifier:(NSString *)identifier {
    
    //注册cell
    UINib *cellNib = [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil];
    
    if (cellNib) {
        [self registerNib:cellNib forCellReuseIdentifier:identifier];
    } else {
#if DEBUG
         NSLog(@"<%s> %@ register nil Cell Nib",__FUNCTION__,NSStringFromClass(cellClass));
#endif
    }
}

@end
