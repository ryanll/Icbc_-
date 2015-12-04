//
//  LeftView.h
//  icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LeftViewDelegate <NSObject>

- (void)getTableViewDidSelectedAtRow:(NSInteger )row section:(NSInteger)section;

@end


@interface LeftView : UIView

@property (nonatomic,assign) BOOL isLogin;
@property (nonatomic,weak) id<LeftViewDelegate> delegate;


@end
