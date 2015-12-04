//
//  LLAllControllers.m
//  text
//
//  Created by yanll on 15/10/14.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "LLAllControllers.h"

@interface LLAllControllers ()
@end

static LLAllControllers *controllers = nil;

@implementation LLAllControllers


+ (instancetype)standerdWithControllers {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       controllers = [[LLAllControllers alloc] init];
    });
    return controllers;
    
}

//按钮
- (nonnull UIButton *)buttonWithFrame:(CGRect)frame title:(nullable NSString *)title titleColor:(nullable UIColor *)titleColor backgroudColor:(nullable UIColor *)backgroudColor target:(nullable id)target action:(nonnull SEL)action {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.cornerRadius = 10;
    button.backgroundColor = backgroudColor;
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


//标签
- (UILabel *)labelWithFrame:(CGRect)frame text:(NSString *)text textColor:(UIColor *)textColor font:(CGFloat)font {
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = textColor;
    label.numberOfLines = 0;
    label.textAlignment = NSTextAlignmentLeft;
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(CGRectGetWidth(frame), 1000) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading|NSStringDrawingUsesDeviceMetrics attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    label.frame = CGRectMake(frame.origin.x, frame.origin.y, rect.size.width, rect.size.height);
    label.text = text;
    
    return label;
    
}



//弹出框
- (void)alertControllerWithTitle:(NSString *)title message:(NSString *)message buttonsWithTitle:(NSArray<NSString *> *)buttonsTitle target:(nullable id)target preferredStyle:(UIAlertControllerStyle)preferredStyle {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    for (int i = 0; i < buttonsTitle.count; i++) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:buttonsTitle[i] style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
    }
    [target presentViewController:alert animated:YES completion:nil];
    
}

//输入框
- (nonnull UITextField *)textFieldWithFrame:(CGRect)frame placeHolder:(nullable NSString *)placeHolder leftView:(nullable UIView *)leftView rightView:(nullable UIView *)rightView; {
    
    UITextField *textField = [[UITextField alloc] initWithFrame:frame];
    textField.placeholder = placeHolder;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.clearButtonMode = UITextFieldViewModeAlways;
    textField.secureTextEntry = NO;
    textField.clearsOnBeginEditing = NO;
    textField.returnKeyType = UIReturnKeyDone;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.keyboardAppearance = UIKeyboardAppearanceDefault;
    textField.leftView = leftView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.rightView = rightView;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    
    return textField;
    
}


- (UISlider *)sliderWithFrame:(CGRect)frame minValue:(CGFloat)minValue maxValue:(CGFloat)maxValue currentValue:(CGFloat)currentValue  {
    UISlider *slider = [[UISlider alloc] initWithFrame:frame];
    slider.minimumValue = minValue;
    slider.minimumValueImage = nil;
    slider.minimumTrackTintColor = [UIColor redColor];

    slider.maximumValue = maxValue;
    slider.maximumValueImage = nil;
    slider.maximumTrackTintColor = [UIColor whiteColor];
//    slider.currentThumbImage = nil;//当前圆球的图片
//    slider.thumbTintColor = nil; //球的颜色
    
    slider.value = currentValue;//起始值
    
    return slider;
}

- (UIColor *)specialRandomColor {
    
    CGFloat hue = arc4random() % 256 / 256.0 ;  //  0.0 to 1.0
    CGFloat saturation = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = arc4random() % 128 / 256.0 + 0.5;  //  0.5 to 1.0, away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}













@end
