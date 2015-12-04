//
//  LeftView.m
//  icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "LeftView.h"
#import "CustomTableViewCell.h"
#import "HeadViewForTableView.h"


@interface LeftView ()<UITableViewDelegate,UITableViewDataSource> {
    NSInteger _selectIndex;
    NSArray *_iconArray;
    NSArray *_iconNameArray;
}
@property (nonatomic,strong) UITableView *tableView;


@end


@implementation LeftView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initDataResourse];
        [self addSubview:self.tableView];
    }
    return self;
}


/*  初始化数据源       */
- (void)initDataResourse {
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"isopen"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"isopen si dad");
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_isLogin) {
        if (section == 0) {
            return 10;
        }else {
            return 3;
        }
    } else {
        if (section == 0) {
            return 5;
        }else {
            return 2;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _iconArray = @[@[@"icon_首页",@"icon_金融资讯",@"icon_理财服务",@"icon_银行卡",@"icon_缴费服务",@"icon_代理产品",@"icon_我的网银",@"icon_活动交流",@"icon_日程提醒",@"icon_业务咨询"],@[@"icon_设置",@"icon_登出",@"icon_滑动",@"icon_登录"]];
    
    _iconNameArray = @[@[@"title_首页",@"title_金融资讯",@"title_理财服务",@"title_银行卡",@"title_缴费服务",@"title_代理产品",@"title_我的网银",@"title_活动交流",@"title_日程提醒",@"title_业务咨询"],@[@"title_设置",@"title_登出",@"title_登录"]];
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell"];
    if (!cell) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"customCell"];
    }
    
    if (!_isLogin) {
        cell.backImage.image = nil;
        if (indexPath.section == 0 && indexPath.row == 0) {
            cell.backImage.image = [UIImage imageNamed:@"icon_menu_选中.png"];
            [self tableView:tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        }
    }
    
    
    
    if (indexPath.section == 0) {

        cell.iconDetailImage.frame = CGRectMake(CGRectGetMaxX(cell.iconImage.frame)+10, 27, 70, 20);
        if (_isLogin) {
            cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][indexPath.row]];
            cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][indexPath.row]];
        } else {
            if (indexPath.row == 3) {
                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][5]];
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][5]];
                
            } else if (indexPath.row == 4) {
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][6]];
                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][6]];
                
            } else {
                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][indexPath.row]];
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][indexPath.row]];
            }
        }
       
    } else {
        cell.iconDetailImage.frame = CGRectMake(CGRectGetMaxX(cell.iconImage.frame)+10, 27, 50, 30);
        if (_isLogin) {
            if (indexPath.row == 2) {
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][indexPath.row]];
                cell.iconDetailImage.image = nil;
            } else {
                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][indexPath.row]];
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][indexPath.row]];
            }
            
        } else {
            
            if (indexPath.row == 0) {
                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][2]];
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][3]];
            } else {
//                cell.iconDetailImage.image = [UIImage imageNamed:_iconNameArray[indexPath.section][3]];
                cell.iconImage.image = [UIImage imageNamed:_iconArray[indexPath.section][2]];
            }
        }
        
    }
    

    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        HeadViewForTableView *view = [[HeadViewForTableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 64)];
        view.backgroundColor = COLORWITHRGB(106, 74, 4, 1);
        return view;

    } else {
        UIView *view = [UIView new];
        view.backgroundColor = COLORWITHRGB(106, 74, 4, 1);
        return view;
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 64;
    }
    if (_isLogin) {
        return 25;
    } else {
        return num_h(425);
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return CellHeight;
    } else {
        return 64;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_delegate && [_delegate respondsToSelector:@selector(getTableViewDidSelectedAtRow:section:)]) {
        [_delegate getTableViewDidSelectedAtRow:indexPath.row section:indexPath.section];
    }
    
    
    if (indexPath.section == 0) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:_selectIndex inSection:0];
        CustomTableViewCell *cellLast = [tableView cellForRowAtIndexPath:path];
        cellLast.backImage.image =nil;
        
        CustomTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.backImage.image = [UIImage imageNamed:@"icon_menu_选中.png"];
        _selectIndex = indexPath.row;
    }
    
    
    
    
    
    
    
}




- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = COLORWITHRGB(106, 74, 4, 1);
        _tableView.bounces = YES;
    }
    return _tableView;
    
}

- (void)setIsLogin:(BOOL)isLogin {
    _isLogin = isLogin;
    [self.tableView reloadData];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
