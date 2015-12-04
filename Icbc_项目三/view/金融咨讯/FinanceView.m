//
//  FinanceView.m
//  Icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "FinanceView.h"
#define FINANCEBUTTON 750

@interface FinanceView (){
    NSArray *_uncheckedImage;
    UIImageView *_firstImage;
    UIImageView *_topImage;
    UITextField *_searchTextField;
    UIButton *_searchButton;
    UIButton *_spaceButton;
    UIImageView *_spaceImage;
}

@end

@implementation FinanceView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeUserInterface];
    }
    return self;
}


- (void)initializeUserInterface{
//    [self financeImage];
    [self financeButton];
    [self detailImage];
}


- (void)financeImage{
    UIImageView *financeImage = [[UIImageView alloc]initWithFrame:CGRectMake(30, 30, 150, 50)];
    financeImage.image = [UIImage imageNamed:@"head_金融资讯"];
    [self addSubview:financeImage];
    
}
#pragma mark -- 详细页面
- (void)detailImage{
    _firstImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 170, [UIScreen mainScreen].bounds.size.height-150)];
    _firstImage.image = [UIImage imageNamed:@"金属资讯_存贷利率_表格"];
    _firstImage.userInteractionEnabled = YES;
    [self addSubview:_firstImage];
}

#pragma mark -- 上面的按钮
- (void)financeButton{
    NSArray *fiImage = @[@"金融资讯_存贷利率_选中",@"金融资讯_外汇贵金属_未选中",@"金融资讯_投资理财_未选中",@"金融资讯_附近网点_未选中"];
    for (int i = 0 ; i < 4; i ++) {
        UIButton *financeButton = [UIButton buttonWithType:UIButtonTypeSystem];
        financeButton.frame = CGRectMake(200 + i * 120, 20, 90, 40);
        financeButton.tag = FINANCEBUTTON + i;
        [financeButton setBackgroundImage:[UIImage imageNamed:fiImage[i]] forState:UIControlStateNormal];
        [financeButton addTarget:self action:@selector(action_financeButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:financeButton];
    }
    
}


- (void)action_financeButton:(UIButton *)sender{
    _uncheckedImage = @[@"金融资讯_存贷利率_未选中",@"金融资讯_外汇贵金属_未选中",@"金融资讯_投资理财_未选中",@"金融资讯_附近网点_未选中"];
    switch (sender.tag) {
        case FINANCEBUTTON:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_存贷利率_选中"] forState:UIControlStateNormal];
            [self buttonOne];
        }break;
        case FINANCEBUTTON + 1:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_外汇贵金属_选中"] forState:UIControlStateNormal];
            [self buttonTwo];
        }break;
        case FINANCEBUTTON + 2:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_投资理财_选中"] forState:UIControlStateNormal];
            [self buttonThree];
        }break;
        case FINANCEBUTTON + 3:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_附近网点_选中"] forState:UIControlStateNormal];
            [self buttonFour];
        }break;
        case FINANCEBUTTON + 10:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_附近网点_距离选中"] forState:UIControlStateNormal];
            for (int i = 11; i < 14; i ++) {
                UIButton *button = (UIButton *)[self viewWithTag:i + FINANCEBUTTON];
                [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
                
            }
        }break;
        case FINANCEBUTTON + 11:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_附近网点_距离选中"] forState:UIControlStateNormal];
            UIButton *button = (UIButton *)[self viewWithTag:10 + FINANCEBUTTON];
            [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            for (int i = 12; i < 14; i ++) {
                UIButton *button = (UIButton *)[self viewWithTag:i + FINANCEBUTTON];
                [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            }
        }break;
        case FINANCEBUTTON + 12:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_附近网点_距离选中"] forState:UIControlStateNormal];
            UIButton *button = (UIButton *)[self viewWithTag:13 + FINANCEBUTTON];
            [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            for (int i = 10; i < 12; i ++) {
                UIButton *button = (UIButton *)[self viewWithTag:i + FINANCEBUTTON];
                [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            }
        }break;
        case FINANCEBUTTON + 13:{
            [sender setBackgroundImage:[UIImage imageNamed:@"金融资讯_附近网点_距离选中"] forState:UIControlStateNormal];
            for (int i = 10; i < 13; i ++) {
                UIButton *button = (UIButton *)[self viewWithTag:i + FINANCEBUTTON];
                [button setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            }
        }break;
            
        default:
            break;
    }
}

//改变点击状态
- (void)buttonOne{
    [_spaceButton removeFromSuperview];
    [_spaceImage removeFromSuperview];
    [_topImage removeFromSuperview];
    [_searchButton removeFromSuperview];
    [_searchTextField removeFromSuperview];
    _firstImage.frame = CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 170, [UIScreen mainScreen].bounds.size.height-150);
    _firstImage.image = [UIImage imageNamed:@"金属资讯_存贷利率_表格"];
    for (int i = 1; i < 4; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:FINANCEBUTTON + i];
        [button setBackgroundImage:[UIImage imageNamed:_uncheckedImage[i]] forState:UIControlStateNormal];
    }
}
- (void)buttonTwo{
    [_spaceButton removeFromSuperview];
    [_spaceImage removeFromSuperview];
    [_searchButton removeFromSuperview];
    [_searchTextField removeFromSuperview];
    [_topImage removeFromSuperview];
    _firstImage.frame = CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 170, [UIScreen mainScreen].bounds.size.height-150);
    _firstImage.image = [UIImage imageNamed:@"金融资讯_外汇贵金属_表格"];
    UIButton *button = (UIButton *)[self viewWithTag:FINANCEBUTTON ];
    [button setBackgroundImage:[UIImage imageNamed:_uncheckedImage[0]] forState:UIControlStateNormal];
    for (int i = 2; i < 4; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:FINANCEBUTTON + i];
        [button setBackgroundImage:[UIImage imageNamed:_uncheckedImage[i]] forState:UIControlStateNormal];
    }
}
- (void)buttonThree{
    [_spaceButton removeFromSuperview];
    [_spaceImage removeFromSuperview];
    [self textFieldSearch];
    _topImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 200, 50)];
    _topImage.image = [UIImage imageNamed:@"金融资讯_投资理财_基金选中.png"];
    [self addSubview:_topImage];
    _firstImage.frame = CGRectMake(50, 280, [UIScreen mainScreen].bounds.size.width - 170, [UIScreen mainScreen].bounds.size.height-320);
    _firstImage.image = [UIImage imageNamed:@"金融资讯_投资理财_理财表"];
    for (int i = 0; i < 2; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:FINANCEBUTTON + i];
        [button setBackgroundImage:[UIImage imageNamed:_uncheckedImage[i]] forState:UIControlStateNormal];
    }
    UIButton *thiButton = (UIButton *)[self viewWithTag:FINANCEBUTTON +3];
    [thiButton setBackgroundImage:[UIImage imageNamed:_uncheckedImage[3]] forState:UIControlStateNormal];
    
    
}
- (void)buttonFour{
    [_topImage removeFromSuperview];
    [_searchButton removeFromSuperview];
    [_searchTextField removeFromSuperview];
    [self website];
    _firstImage.frame = CGRectMake(50, 120, [UIScreen mainScreen].bounds.size.width - 170, [UIScreen mainScreen].bounds.size.height-150);
    _firstImage.image = [UIImage imageNamed:@"金融资讯_附近网点_背景"];
    for (int i = 0; i < 3; i++) {
        UIButton *button = (UIButton *)[self viewWithTag:FINANCEBUTTON + i];
        [button setBackgroundImage:[UIImage imageNamed:_uncheckedImage[i]] forState:UIControlStateNormal];
    }
    
}

#pragma mark -- 附近网点
- (void)website{
    _spaceImage = [[UIImageView alloc]initWithFrame:CGRectMake(150, 150, 300, 75)];
    _spaceImage.image = [UIImage imageNamed:@"金融资讯_附近网点_距离未选中"];
    _spaceImage.userInteractionEnabled = YES;
    [_firstImage addSubview:_spaceImage];
    
    for (int i = 0; i < 4; i ++) {
        _spaceButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _spaceButton.frame = CGRectMake(0 + 85 * i, 20, 50, 60);
        _spaceButton.tag = FINANCEBUTTON + i + 10;
        [_spaceButton addTarget:self action:@selector(action_financeButton:) forControlEvents:UIControlEventTouchUpInside];
        [_spaceImage addSubview:_spaceButton];
    }
    
}

#pragma mark -- 搜索加文本
- (void)textFieldSearch{
    _searchTextField = [[UITextField alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 -30, 220, [UIScreen mainScreen].bounds.size.width/2 - 150, 30)];
    _searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _searchTextField.backgroundColor = [UIColor whiteColor];
    _searchTextField.placeholder = @"请输入代码或名称查询";
    [self addSubview: _searchTextField];
    
    _searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _searchButton.frame = CGRectMake([UIScreen mainScreen].bounds.size.width - 180, 220,30 , 30);
    [_searchButton setBackgroundImage:[UIImage imageNamed:@"搜索"] forState:UIControlStateNormal];
    [_searchButton addTarget:self action:@selector(action_financeButton:) forControlEvents:UIControlEventTouchUpInside];
    _searchButton.tag = FINANCEBUTTON + 4;
    [self addSubview:_searchButton];
}


@end
