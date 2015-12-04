//
//  LoginView.h
//  Icbc_项目三
//
//  Created by yanll on 15/12/1.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LoginViewDelegate <NSObject>

- (void)LoginStatueWithFlag:(BOOL)flag;

@end


@interface LoginView : UIView

@property (nonatomic,weak) id<LoginViewDelegate> delegate;


@end
