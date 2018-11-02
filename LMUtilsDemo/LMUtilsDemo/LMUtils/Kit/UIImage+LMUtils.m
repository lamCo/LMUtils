//
//  UIImage+LMUtils.m
//  LMUtils
//
//  Created by lam on 2018/8/8.
//  Copyright © 2018年 lam. All rights reserved.
//

#import "UIImage+LMUtils.h"
#import <objc/runtime.h>


@implementation UIImage (LMUtils)

+ (void)load {
    @autoreleasepool {
        static dispatch_once_t onceToken;
        
        dispatch_once(&onceToken, ^{
            
            Class class = [self class];
            
            SEL originalSelector = @selector(imageNamed:);
            
            SEL swizzledSelector = @selector(lm_imageNamed:);
            
            Method originalMethod = class_getClassMethod(class, originalSelector);
            
            Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
            
            method_exchangeImplementations(originalMethod, swizzledMethod);
        });
    }
}

+ (UIImage *)lm_imageNamed:(NSString *)name {
    
    if (!name || name.length == 0) {
        return nil;
    }
    
    UIImage *image = [self lm_imageNamed:name];
    
#ifdef DEBUG
    if (!image) NSLog(@"image name:<%@> no file",name);
#endif
    return image;
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGFloat wd = 1.0 / UIScreen.mainScreen.scale;
    return [self imageWithColor:color size:CGSizeMake(wd, wd)];
}


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size{
    @autoreleasepool {
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
        [color setFill];
        UIRectFill(rect);
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
}

- (CGFloat)width {
    return self.size.width;
}

- (CGFloat)height {
    return self.size.height;
}


/// 创建二维码 图片
+ (UIImage *)creatCIQRCodeImage:(NSString *)content imageSize:(CGFloat)size {
    // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2.恢复默认设置
    [filter setDefaults];
    
    // 3. 给过滤器添加数据
    NSString *dataString = content;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 注意，这里的value必须是NSData类型
    [filter setValue:data forKeyPath:@"inputMessage"];
    // 4. 生成二维码
    CIImage *outputImage = [filter outputImage];
    return [self creatNonInterpolatedUIImageFormCIImage:outputImage withSize:size];
}


/// 根据CIImage生成指定大小的UIImage
+ (UIImage *)creatNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size {
    @autoreleasepool {
        CGRect extent = CGRectIntegral(image.extent);
        CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
        
        // 1. 创建bitmap
        size_t width = CGRectGetWidth(extent) * scale;
        size_t height = CGRectGetHeight(extent) * scale;
        CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
        CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
        CIContext *context = [CIContext contextWithOptions:nil];
        CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
        CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
        CGContextScaleCTM(bitmapRef, scale, scale);
        CGContextDrawImage(bitmapRef, extent, bitmapImage);
        
        // 2.保存bitmap图片
        CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
        CGContextRelease(bitmapRef);
        CGImageRelease(bitmapImage);
        return [UIImage imageWithCGImage:scaledImage];
    }
}


@end
