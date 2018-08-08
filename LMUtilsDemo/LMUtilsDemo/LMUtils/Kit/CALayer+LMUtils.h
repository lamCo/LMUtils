//
//  CALayer+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

/**
    CALayer 分类
 */
@interface CALayer (LMUtils)

/**
 *  使用set替代在xib key path 没办法设置layer的borderColor
 *
 *  @param color 颜色
 */
- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
