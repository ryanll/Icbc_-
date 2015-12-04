//
//  BaseView.h
//  icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView
@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,assign) BOOL isOpenFlag;
- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName;
@end
