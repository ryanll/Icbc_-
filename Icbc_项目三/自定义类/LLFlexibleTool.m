//
//  LLFlexibleTool.m
//  CodeLayout_项目阶段
//
//  Created by yanll on 15/10/15.
//  Copyright © 2015年 yanll. All rights reserved.
//






#import "LLFlexibleTool.h"

@implementation LLFlexibleTool

//YYRect
+ (CGRect)rectWithOriginalRect:(CGRect)rect isFlexibleHeight:(BOOL)isFlexibleHeight {
    CGRect currentRect = CGRectMake(0, 0, 0, 0);
    currentRect.origin = [self pointWithOriginalPoint:rect.origin isFlexibleHeight:isFlexibleHeight];
    currentRect.size = [self sizeWithOriginalSize:rect.size isFlexibleHeight:isFlexibleHeight];
    
    return currentRect;
}

+ (CGPoint)pointWithOriginalPoint:(CGPoint)point isFlexibleHeight:(BOOL)isFlexibleHeight{
    CGPoint currentPoint = CGPointZero;
    currentPoint.x = point.x * FIEXIBLE_W;
    
    if (isFlexibleHeight) {
        currentPoint.y = point.y * FIEXIBLE_H;
    } else {
        currentPoint.y = point.y * FIEXIBLE_W;
    }


    
    return currentPoint;
    
}

+ (CGSize)sizeWithOriginalSize:(CGSize)size isFlexibleHeight:(BOOL)isFlexibleHeight {
    CGSize currentSize = CGSizeZero;
    currentSize.width = size.width * FIEXIBLE_W;
    
    if (isFlexibleHeight) {
        currentSize.height = size.height * FIEXIBLE_H;
    } else {
        currentSize.height = size.height * FIEXIBLE_W;
    }

    
    return currentSize;
}

+ (CGFloat)floatWithOriginalFloat:(CGFloat)originalFloat isFlexibleHeight:(BOOL)isHeight {
    
    if (isHeight) {
        return originalFloat * FIEXIBLE_H;
    } else {
        return originalFloat * FIEXIBLE_W;
    }
    
}






@end
