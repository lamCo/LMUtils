//
//  CALayer+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,kCornerRadiusType) {
    kCornerRadiusTypeTop    = 0,
    kCornerRadiusTypeLeft   = 1,
    kCornerRadiusTypeBottom = 2,
    kCornerRadiusTypeRight  = 3,
    kCornerRadiusTypeAll    = 4,
};



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


#pragma mark - CornerRadius 圆角

/**
 *
 *  设置不同边的圆角
 *
 *  @param sideType 圆角类型
 *  @param cornerRadius 圆角半径
 */
- (void)cornerSideType:(kCornerRadiusType)sideType
      withCornerRadius:(CGFloat)cornerRadius;


/**
 @param cornerRadius cornerRadius 圆角半径
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;


@end
