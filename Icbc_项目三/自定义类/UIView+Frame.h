//
//  UIView+Frame.h
//  MagicClock
//
//  Created by yanll on 15/11/22.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <UIKit/UIKit.h>


//直接修改视图frame中的单个数值 用法self.view.origin = point
@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@end
