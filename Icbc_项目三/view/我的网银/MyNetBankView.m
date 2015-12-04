//
//  MyNetBankView.m
//  Icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "MyNetBankView.h"

@interface MyNetBankView ()

- (void)initializeUserInterface;/**< 初始化用户界面  */
@property (nonatomic, strong)UIButton *webBank;
@property (nonatomic, strong)UIButton *experience;

@end

@implementation MyNetBankView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName
{
    self = [super initWithFrame:frame imageName:imageName];
    if (self) {
        [self initializeUserInterface];
    }
    return self;
}

#pragma mark -- Initialize
- (void)initializeUserInterface {
    [self addSubview:self.webBank];
    [self addSubview:self.experience];
}

#pragma mark -- Getter
- (UIButton *)webBank {
    if (!_webBank) {
        _webBank = [[UIButton alloc]initWithFrame:[LLFlexibleTool rectWithOriginalRect:CGRectMake(70, 100, 557, 400) isFlexibleHeight:NO]];
        _webBank.layer.cornerRadius = 10;
        [_webBank setBackgroundImage:[UIImage imageNamed:@"我的网银_网上银行"] forState:UIControlStateNormal];
        [_webBank addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
        _webBank.tag = 100;
    }
    return _webBank;
}

- (UIButton *)experience {
    if (!_experience) {
        _experience = [[UIButton alloc]initWithFrame:[LLFlexibleTool rectWithOriginalRect:CGRectMake(70, 560, 557, 400) isFlexibleHeight:NO]];
        _experience.layer.cornerRadius = 10;
        [_experience setBackgroundImage:[UIImage imageNamed:@"我的网银_体验指南"] forState:UIControlStateNormal];
        [_experience addTarget:self action:@selector(respondsToButton:) forControlEvents:UIControlEventTouchUpInside];
        _experience.tag = 101;
    }
    return _experience;
}

#pragma mark -- respondsToButton
- (void)respondsToButton:(UIButton *)sender {
    if (sender.tag == 100) {
        NSString *string = @"http://www.icbc.com.cn/icbc/";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    }else {
        NSString *string = @"http://www.icbc.com.cn/icbc/";
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:string]];
    }

}

@end
