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
