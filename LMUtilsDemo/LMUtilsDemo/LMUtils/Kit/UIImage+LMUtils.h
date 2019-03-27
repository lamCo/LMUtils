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
 颜色Hex转image

 @param hex 16进制颜色 0x123456方式来创建
 @return image
 */
+ (UIImage *)imageWithColorHex:(unsigned int)hex;

/**
 颜色Hex转image
 
 @param hex 16进制颜色 0x123456方式来创建
 @param alpha 透明度
 @return image
 */
+ (UIImage *)imageWithColorHex:(unsigned int)hex alpha:(CGFloat)alpha;

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



/**
 改变图片size

 @param size size
 @return image
 */
- (UIImage *)scaleToSize:(CGSize)size;
@end
