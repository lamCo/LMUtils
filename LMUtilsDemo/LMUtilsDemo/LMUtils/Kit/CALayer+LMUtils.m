//
//  CALayer+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "CALayer+LMUtils.h"


@implementation CALayer (LMUtils)

// 使用set替代在xib key path 没办法设置layer的borderColor
- (void)setBorderColorFromUIColor:(UIColor *)color{
    self.borderColor = color.CGColor;
}

@end
