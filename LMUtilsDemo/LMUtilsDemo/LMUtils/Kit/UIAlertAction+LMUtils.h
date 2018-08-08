//
//  UIAlertAction+LMUtils.h
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertAction (LMUtils)
/// runtime exchange init title color
@property (nonatomic, class, copy)UIColor *defaultTitleColor;
/// title color
@property (nonatomic, strong)UIColor *titleColor;

@end
