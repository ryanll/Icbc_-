//
//  LoginBaseView.h
//  Icbc_项目三
//
//  Created by yanll on 15/12/1.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginBaseViewDelegate <NSObject>
//0 代表至少一个没有输入，1代表用户名密码不对，2代码正确
- (void)getViewWithTextisRight:(NSInteger)isRight;
@end


@interface LoginBaseView : UIView

@property (nonatomic,weak) id<LoginBaseViewDelegate> delegate;
@property (nonatomic,strong) UIButton   *confirmBtn;
@property (nonatomic,strong) UIButton   *cancelBtn;
@property (nonatomic,strong) UILabel    *nameLabel;
@property (nonatomic,strong) UILabel    *codeLabel;

@end
