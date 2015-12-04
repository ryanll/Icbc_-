//
//  CustomTableViewCell.m
//  Icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.backImage];
        [self addSubview:self.iconImage];
        [self addSubview:self.iconDetailImage];
        self.backgroundColor = COLORWITHRGB(106, 74, 4, 1);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        //可以通过self.selectedBackgroundView//设置选中背景图片
        
    }
    return self;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UIImageView *)backImage {
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CellHeight)];
//        _backImage.image = [UIImage imageNamed:]
    }
    return _backImage;
    
}


- (UIImageView *)iconImage {
    if (!_iconImage) {
        _iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 60, CellHeight)];
        
        
    }
    return _iconImage;
}

-(UIImageView *)iconDetailImage {
    if (!_iconDetailImage) {
        _iconDetailImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.iconImage.frame)+10, (CellHeight-20)/2.0, 70, 20)];
    }
    return _iconDetailImage;
}



@end
