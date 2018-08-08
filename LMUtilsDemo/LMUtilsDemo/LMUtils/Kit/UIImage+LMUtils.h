//
//  UIImage+LMUtils.h
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
    UIImage 分类
 */
@interface UIImage (LMUtils)
/// height
@property (nonatomic, readonly)CGFloat height;
/// width
@property (nonatomic, readonly)CGFloat width;


/**
  颜色转image
 @param color 颜色
 */
+ (UIImage *)imageWithColor:(UIColor *)color ;

/**
 颜色转image
 @param color 颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;



@end
