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
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 颜色转image
 @param color 颜色
 */
+(UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


/**
 创建二维码 图片
 
 @param content 内容
 @param size 宽高
 @return image
 */
+ (UIImage *)creatCIQRCodeImage:(NSString *)content imageSize:(CGFloat)size;

/**
 *
 根据CIImage生成指定大小的UIImage
 *
 * @param image CIImage
 * @param size 图片宽度
 *
 * @return 生成高清的UIImage
 */
+ (UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;



@end
