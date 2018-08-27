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


#pragma mark - CornerRadius 圆角
/// 设置圆角
- (void)setCornerRadius:(CGFloat)cornerRadius {
    [self cornerSideType:kCornerRadiusTypeAll withCornerRadius:cornerRadius];
}

// 利用UIBezierPath给layer画圆角
- (void)cornerSideType:(kCornerRadiusType)sideType
      withCornerRadius:(CGFloat)cornerRadius {
    
    CGSize cornerSize = CGSizeMake(cornerRadius, cornerRadius);
    
    UIBezierPath *maskPath;
    
    UIRectCorner corners = UIRectCornerAllCorners;
    
    switch (sideType) {
        case kCornerRadiusTypeTop:
            corners = (UIRectCornerTopLeft|UIRectCornerTopRight);
            
            break;
        case kCornerRadiusTypeLeft:
            corners = (UIRectCornerTopLeft|UIRectCornerBottomLeft);
            
            break;
        case kCornerRadiusTypeBottom:
            corners = (UIRectCornerBottomLeft|UIRectCornerBottomRight);
            
            break;
        case kCornerRadiusTypeRight:
            corners = (UIRectCornerTopRight|UIRectCornerBottomRight);
            break;
            
        default:
            break;
    }
    
    //Create Bezier Path
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corners
                                           cornerRadii:cornerSize];
    
    // Create the shape layer and set its path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
    self.mask = maskLayer;
    
    [self setMasksToBounds:YES];
}


@end
