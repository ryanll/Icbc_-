//
//  log_in.m
//  Icbc_项目三
//
//  Created by yanll on 15/12/1.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "log_in.h"


@interface log_in ()


@end


@implementation log_in

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.detailLabel];
        [self addSubview:self.findPassword];
    }
    return self;
}


#pragma mark - getter 
- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(num_w(60), CGRectGetMaxY(self.codeLabel.frame), num_w(300), num_h(30))];
        _detailLabel.text = @"首次登录，请输入您签约时的主卡卡号及预留密码";
        _detailLabel.textColor = [UIColor whiteColor];
        _detailLabel.font = [UIFont systemFontOfSize:12];
    }
    return _detailLabel;
}


- (UIButton *)findPassword {
    if (!_findPassword) {
        _findPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        _findPassword.frame = CGRectMake(CGRectGetMinX(self.cancelBtn.frame)+num_w(30), CGRectGetMaxY(self.cancelBtn.frame)+num_h(40), num_w(100), num_h(35));
        [_findPassword setImage:[UIImage imageNamed:@"登录_取回用户名"] forState:UIControlStateNormal];
    }
    return _findPassword;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
