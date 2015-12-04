//
//  LLFlexibleTool.h
//  CodeLayout_项目阶段
//
//  Created by yanll on 15/10/15.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define ORIGINAL_W  768
#define ORIGINAL_H  1024

#define SCREEN_W  [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define FIEXIBLE_W  SCREEN_W/ORIGINAL_W
#define FIEXIBLE_H  SCREEN_H/ORIGINAL_H
#define num_w(_a)   (_a)*FIEXIBLE_W
#define num_h(_a)   (_a)*FIEXIBLE_H



@interface LLFlexibleTool : NSObject
+ (CGRect)rectWithOriginalRect:(CGRect)rect isFlexibleHeight:(BOOL)isFlexibleHeight;

+ (CGSize)sizeWithOriginalSize:(CGSize)size isFlexibleHeight:(BOOL)isFlexibleHeight;


//isheight == YES 根据高度适配
+ (CGFloat)floatWithOriginalFloat:(CGFloat)originalFloat isFlexibleHeight:(BOOL)isHeight;
@end
