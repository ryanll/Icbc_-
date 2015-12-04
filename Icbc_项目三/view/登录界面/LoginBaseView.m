//
//  LoginBaseView.m
//  Icbc_项目三
//
//  Created by yanll on 15/12/1.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "LoginBaseView.h"


@interface LoginBaseView ()
@property (nonatomic,strong) UITextField *nameField;//账号
@property (nonatomic,strong) UITextField *codeField;//密码
@property (nonatomic,strong) UIImageView *backImage;
@end


@implementation LoginBaseView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImage];
        [self addSubview:self.nameField];
        [self addSubview:self.codeField];
        [self addSubview:self.confirmBtn];
        [self addSubview:self.cancelBtn];
        [self addSubview:self.nameLabel];
        [self addSubview:self.codeLabel];
    }
    return self;
}


- (void)respondsToConfirm:(UIButton *)sender {
    
    if (_delegate && [_delegate respondsToSelector:@selector(getViewWithTextisRight:)]) {
        
        if (self.nameField.text.length > 0 && self.codeField.text.length > 0) {
            //用户名和密码都输入了
            if ([self.nameField.text isEqualToString:@"wz"] && [self.codeField.text isEqualToString:@"123456"]) {
                [_delegate getViewWithTextisRight:2];
            }else {
                [_delegate getViewWithTextisRight:1];
            }
        } else {
            //用户名和密码至少一个没输入
            [_delegate getViewWithTextisRight:0];
        }
        
        
    }
    
    
    
    
}



#pragma mark - getter 
- (UIImageView *)backImage {
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame),CGRectGetHeight(self.frame))];
        _backImage.image = [UIImage imageNamed:@"登录_灰色背景"];
        _backImage.userInteractionEnabled = YES;
    }
    return _backImage;
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(num_w(50), num_h(230), num_w(130), num_h(50));
        [_confirmBtn setImage:[UIImage imageNamed:@"登录_确定"] forState:UIControlStateNormal];
        [_confirmBtn addTarget:self action:@selector(respondsToConfirm:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _confirmBtn;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(CGRectGetMaxX(self.confirmBtn.frame)+num_w(40), num_h(230), num_w(130), num_h(50));
        [_cancelBtn setImage:[UIImage imageNamed:@"登录_取消"] forState:UIControlStateNormal];
    }
    return _cancelBtn;
}


- (UITextField *)nameField {
    if (!_nameField) {
        _nameField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame)-num_w(30), num_h(60), num_w(200), num_h(40))];
        
        _nameField.borderStyle = UITextBorderStyleRoundedRect;
    }
    return _nameField;
}

- (UITextField *)codeField {
    if (!_codeField) {
        _codeField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame)-num_w(30), CGRectGetMaxY(self.nameField.frame)+20, num_w(200), num_h(40))];
        
        _codeField.borderStyle = UITextBorderStyleRoundedRect;
        _codeField.secureTextEntry = YES;
        _codeField.clearsOnBeginEditing = YES;
    }
    return _codeField;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(num_w(10), num_h(60), CGRectGetMidX(self.frame)-num_w(30), num_h(40))];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"卡(账)号/用户名";
        _nameLabel.font = [UIFont systemFontOfSize:20];
    }
    return _nameLabel;
}

- (UILabel *)codeLabel {
    if (!_codeLabel) {
        _codeLabel = [[UILabel alloc] initWithFrame:CGRectMake(num_w(10), CGRectGetMaxY(self.nameField.frame)+20, CGRectGetMidX(self.frame)-num_w(30), num_h(40))];
        _codeLabel.textColor = [UIColor whiteColor];
        _codeLabel.textAlignment = NSTextAlignmentCenter;
        _codeLabel.text = @"密                    码";
        _codeLabel.font = [UIFont systemFontOfSize:20];
    }
    return _codeLabel;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
