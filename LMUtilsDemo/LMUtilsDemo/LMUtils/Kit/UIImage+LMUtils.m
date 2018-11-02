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


@end
