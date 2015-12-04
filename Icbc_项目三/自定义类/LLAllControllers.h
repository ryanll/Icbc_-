//
//  LLAllControllers.h
//  text
//
//  Created by yanll on 15/10/14.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>

#define LLCONTROLLERS [LLAllControllers standerdWithControllers]

@interface LLAllControllers : UIView

+ (nonnull instancetype)standerdWithControllers;

- (nonnull UIButton *)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor backgroudColor:(nullable UIColor *)backgroudColor target:(nullable id)target action:(nonnull SEL)action;

- (nonnull UILabel *)labelWithFrame:(CGRect)frame text:(nullable NSString *)text textColor:(nullable UIColor *)textColor font:(CGFloat)font;

- (void)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message buttonsWithTitle:(nullable NSArray<NSString *> *)buttonsTitle target:(nullable id)target preferredStyle:(UIAlertControllerStyle)preferredStyle;

- (nonnull UITextField *)textFieldWithFrame:(CGRect)frame placeHolder:(nullable NSString *)placeHolder leftView:(nullable UIView *)leftView rightView:(nullable UIView *)rightView;


//随机颜色
- (nonnull UIColor *)specialRandomColor;

@end
