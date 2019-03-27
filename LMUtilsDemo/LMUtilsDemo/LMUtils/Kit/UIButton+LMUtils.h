//
//  UIButton+LMUtils.h
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (LMUtils)
/// 忽略button classs
@property (nonatomic, class, copy)NSArray<NSString *> *ignoreButtons;
/// 事件间隔,默认0.5s
@property (nonatomic) NSTimeInterval acceptEventInterval;

@end


@interface UIButton (LMCreate)


/**
 快速设置button状态

 @param title title
 @param color color
 @param font 字体大小
 @param image 颜色
 @param backgroundImage 背景颜色
 @param state 状态
 */
- (void)setTitle:(NSString *)title
      titleColor:(UIColor *)color
            font:(UIFont *)font
           image:(UIImage *)image
 backgroundImage:(UIImage *)backgroundImage
        forState:(UIControlState)state;

@end
