
//
//  BaseView.m
//  icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "BaseView.h"

@interface BaseView ()

@property (nonatomic,strong) UIImageView *lineView;
@property (nonatomic,strong) UIImageView *backImage;
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;
@property (nonatomic,strong) UITapGestureRecognizer *tapGesture;


@end

@implementation BaseView

- (instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)imageName {
    self = [self initWithFrame:frame];
    if (self) {
        if (imageName.length > 0) {
            self.headImage.image = [UIImage imageNamed:imageName];
        }
        
        
    }
    return self;
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.backImage];
        [self addSubview:self.headImage];
        [self addSubview:self.lineView];
        [self addGestureRecognizer:self.panGesture];
        [self addGestureRecognizer:self.tapGesture];
        
    }
    return self;
}

- (void)respondsToPan:(UIPanGestureRecognizer *)pan {
    CGPoint point = [pan translationInView:self];
    
    CGFloat float_x = pan.view.center.x+point.x;
//        NSLog(@"pan x+point.x is %lf",pan.view.center.x+point.x);
    if (float_x <= 624 && float_x >= 414 ) {
        pan.view.center = CGPointMake(float_x, pan.view.center.y);
        [pan setTranslation:CGPointMake(0, 0) inView:self];
        
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
//            NSLog(@"pan.state end");
        if (pan.view.center.x < 520) {
            [self pullToLeft:pan.view];
        }else {
            [self pullToRight:pan.view];
        }
    } else {
//            NSLog(@"pan.state is %ld",(long)pan.state);
    }

    
    

}

- (void)pullToLeft:(UIView *)view {
    [UIView animateWithDuration:0.3 animations:^{
        view.center = CGPointMake(414, view.center.y);
    }];
    _isOpenFlag = NO;
    NSLog(@"left");
    [[NSUserDefaults standardUserDefaults] setBool:_isOpenFlag forKey:@"isopen"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}


- (void)pullToRight:(UIView *)view {
    [UIView animateWithDuration:0.3 animations:^{
        view.center = CGPointMake(584, view.center.y);
    }];
    _isOpenFlag = YES;
    NSLog(@"right");
    [[NSUserDefaults standardUserDefaults] setBool:_isOpenFlag forKey:@"isopen"];
    [[NSUserDefaults standardUserDefaults]synchronize];
}

- (void)respondsToTap:(UITapGestureRecognizer *)tap {
    [self pullToLeft:self];
}




- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(num_w(20), num_h(20), num_w(150), num_h(40))];
        
    }
    return _headImage;
}

- (UIImageView *)lineView {
    if (!_lineView) {
        _lineView = [[UIImageView alloc] initWithFrame:CGRectMake(0, num_h(75), CGRectGetWidth(self.frame), 2)];
        _lineView.image = [UIImage imageNamed:@"公用_分割线"];
        _lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}


- (UIImageView *)backImage {
    if (!_backImage ) {
        _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _backImage.image = [UIImage imageNamed:@"底_04"];
    }
    return _backImage;
}

- (UIPanGestureRecognizer *)panGesture {
    if (!_panGesture) {
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToPan:)];
    }
    return _panGesture;
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(respondsToTap:)];
    }
    return _tapGesture;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
