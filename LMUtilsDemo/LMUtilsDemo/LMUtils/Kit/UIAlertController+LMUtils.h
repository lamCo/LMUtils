//
//  UIAlertController+LMUtils.h
//  LMUtils
//
//  Created by hl on 2018/4/17.
//  Copyright © 2018年 lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (LMUtils)
/// runtime exchange init title&message color,font 17 & 13
@property (nonatomic, class, copy)UIColor *defaultColor;
/// title label
@property (nonatomic, readonly) UILabel *titleLabel;
/// title attributed
@property (nonatomic, copy) NSAttributedString *titleAttributed;
/// message label
@property (nonatomic, readonly) UILabel *messageLabel;
/// message attributed
@property (nonatomic, copy) NSAttributedString *messageAttributed;

/// set title & massage attributed
- (void)setTitleAttributed:(NSAttributedString *)title
         messageAttributed:(NSAttributedString *)message;
@end
