//
//  LoginView.m
//  Icbc_项目三
//
//  Created by yanll on 15/12/1.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "LoginView.h"
#import "log_in.h"



@interface LoginView ()<LoginBaseViewDelegate> {
    BOOL _islogFlag;
}
@property (nonatomic,strong) log_in *login;
@end


@implementation LoginView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.login];
    }
    return self;
}

- (void)respondsToFindPassword:(UIButton *)sender {
    [UIView animateWithDuration:0.7 animations:^{
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.login cache:NO];
        _islogFlag = YES;
        self.login.findPassword.hidden = YES;
        self.login.detailLabel.hidden = YES;
        self.login.nameLabel.text = @"注册卡(账)号";
        self.login.codeLabel.text = @"预留手机号码";
    }];
    
    
}
- (void)respondsToCancel:(UIButton *)sender {
    if (_islogFlag) {
        [UIView animateWithDuration:0.7 animations:^{
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.login cache:NO];
            _islogFlag = NO;
            self.login.findPassword.hidden = NO;
            self.login.detailLabel.hidden = NO;
            self.login.nameLabel.text = @"卡(账)号/用户名";
            self.login.codeLabel.text = @"密                    码";

        }];
    } else {
        self.hidden = YES;
    }
}


#pragma mark - delegate
- (void)getViewWithTextisRight:(NSInteger)isRight {
    switch (isRight) {
        case 0:
        {
            if (_islogFlag) {
                [[LLAllControllers standerdWithControllers] alertControllerWithTitle:@"温馨提示" message:@"请输入正确的注册卡(账号)和预留手机号!" buttonsWithTitle:@[@"确定"] target:self.superview.nextResponder preferredStyle:UIAlertControllerStyleAlert];
            } else {
                [[LLAllControllers standerdWithControllers] alertControllerWithTitle:@"温馨提示" message:@"请输入正确的用户名或密码" buttonsWithTitle:@[@"确定"] target:self.superview.nextResponder preferredStyle:UIAlertControllerStyleAlert];
            }
        }
            break;
        case 1:
        {
            if (_islogFlag) {
                [[LLAllControllers standerdWithControllers] alertControllerWithTitle:@"温馨提示" message:@"服务器忙，请稍后重试" buttonsWithTitle:@[@"确定"] target:self.superview.nextResponder preferredStyle:UIAlertControllerStyleAlert];
            } else {
               [[LLAllControllers standerdWithControllers] alertControllerWithTitle:@"温馨提示" message:@"用户名不存在或密码错误" buttonsWithTitle:@[@"确定"] target:self.superview.nextResponder preferredStyle:UIAlertControllerStyleAlert];
            }
        }
            break;
        case 2:
        {
            //登录成功，需要修改界面
            if (_delegate && [_delegate conformsToProtocol:@protocol(LoginViewDelegate) ]) {
                [_delegate LoginStatueWithFlag:YES];
            }
            self.hidden = YES;
            
            
        }
            break;
        default:
            break;
    }
    
    
}



#pragma mark - getter 
- (log_in *)login {
    if (!_login) {
        _login = [[log_in alloc] initWithFrame:CGRectMake(0, 0, num_w(400), num_h(400))];
        _login.center = self.center;
        _login.delegate = self;
        [_login.findPassword addTarget:self action:@selector(respondsToFindPassword:) forControlEvents:UIControlEventTouchUpInside];
        [_login.cancelBtn addTarget:self action:@selector(respondsToCancel:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _login;
}







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
