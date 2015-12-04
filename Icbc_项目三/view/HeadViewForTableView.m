//
//  HeadViewForTableView.m
//  Icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "HeadViewForTableView.h"

@interface HeadViewForTableView ()

@property (nonatomic,strong) UIImageView *headImage;
@property (nonatomic,strong) UILabel     *titleLabel;

@end


@implementation HeadViewForTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.headImage];
        [self addSubview:self.titleLabel];
    }
    return self;
}



#pragma mark - getter 
- (UIImageView *)headImage {
    if (!_headImage) {
        _headImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame)/4.0, 64)];
        _headImage.image = [UIImage imageNamed:@"头像.png"];
    }
    return _headImage;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.headImage.frame)+5, 0, CGRectGetWidth(self.frame)-CGRectGetMaxX(self.headImage.frame), 64)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.text = @"尊敬的用户,上午好";
    }
    return _titleLabel;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
