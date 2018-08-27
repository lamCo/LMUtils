//
//  UIView+LMUtils.h
//  LMUtilsDemo
//
//  Created by lam on 2018/8/27.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

/// View xib分类
@interface UIView (LMViewXibUtils)

/**
 *  在Main Bundle内根据View的类名创建Xib View
 *
 *  @return view
 */
+ (instancetype)instantiateFromNibInMainBundle;


/**
 *  根据xib创建view
 *
 *  @return view
 */
+ (instancetype)instantiateFromNibInBundle:(NSBundle *)bundle
                                   nibName:(NSString *)name;


@end


/// 动画工具
@interface UIView (LMViewAnimatedUtils)

/**
 执行约束动画
 @param animated 是否动画
 @param completion 完成回调
 */
- (void)updateConstraintsIfNeeded:(BOOL)animated
                         duration:(NSTimeInterval)duration
                       completion:(void (^)(BOOL finished))completion;


/**
 *  自定义弹出动画，类似uialerview
 */
- (void)popCustomAnimationWithDuration:(CFTimeInterval)duration;


/**
 添加过渡动画
  @param type type
 */
- (void)addCATransitionAnimation:(NSString *)type;

@end



/**
    Frame工具
 */
@interface UIView (LMViewFrameUtils)
/// left x
@property (nonatomic) CGFloat lm_Left;
/// right x
@property (nonatomic) CGFloat lm_Right;
/// top y
@property (nonatomic) CGFloat lm_Top;
/// bottom y
@property (nonatomic) CGFloat lm_Bottom;
/// width
@property (nonatomic) CGFloat lm_Width;
/// height
@property (nonatomic) CGFloat lm_Height;
/// center x
@property (nonatomic) CGFloat lm_CenterX;
/// center y
@property (nonatomic) CGFloat lm_CenterY;


/**
 针对给定的坐标系居中
 
 @param rect 矩形
 */
- (void)centerInRect:(CGRect)rect;

/**
 针对给定的坐标系纵向居中
 
 @param rect 矩形
 */
- (void)centerVerticallyInRect:(CGRect)rect;

/**
 针对给定的坐标系横向居中
 
 @param rect 矩形
 */
- (void)centerHorizontallyInRect:(CGRect)rect;

/**
 相对父视图居中
 */
- (void)centerInSuperView;

/**
 相对父视图纵向居中
 */
- (void)centerVerticallyInSuperView;

/**
 相对父视图横向居中
 */
- (void)centerHorizontallyInSuperView;

/**
 同一父视图的兄弟视图水平居中偏移
 
 @param view 视图
 @param padding 偏移
 */
- (void)centerHorizontallyBelow:(UIView *)view
                        padding:(CGFloat)padding;


/**
 同一父视图的兄弟视图水平居中
 
 @param view 视图
 */
- (void)centerHorizontallyBelow:(UIView *)view;


@end



