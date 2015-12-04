//
//  HomeViewController.m
//  icbc_项目三
//
//  Created by yanll on 15/11/30.
//  Copyright © 2015年 yanll. All rights reserved.
//

#import "HomeViewController.h"
#import "LeftView.h"
#import "HomeView.h"
#import "FinanceView.h"
#import "FinancialServiceView.h"
#import "BankCardView.h"
#import "PayServiceView.h"
#import "AgentProductsView.h"
#import "MyNetBankView.h"
#import "CommunicationView.h"
#import "DateNoticeView.h"
#import "BusinessConsultingView.h"
#import "LoginView.h"




@interface HomeViewController ()<LeftViewDelegate,LoginViewDelegate> {
    NSArray *_viewName;
    NSArray *_allWithView;
    NSInteger _lastSelectView;
    BOOL     _islogin;
}
@property (nonatomic,strong) LeftView *leftView;
@property (nonatomic,strong) LoginView *loginView;

@end

@implementation HomeViewController

/*  初始化界面控件参数   */
- (void)initAppParam {
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.leftView];
//    [self.view addSubview:self.homeView];
    
    
    CGRect normalRect = CGRectMake(num_w(60), 0, SCREEN_W - num_w(60), SCREEN_H);
    
    
    HomeView *homeView = [[HomeView alloc] initWithFrame:normalRect imageName:_viewName[0]];
    [self.view addSubview:homeView];
    
    FinanceView *finance = [[FinanceView alloc] initWithFrame:normalRect imageName:_viewName[1]];
    
    FinancialServiceView *finacialService = [[FinancialServiceView alloc] initWithFrame:normalRect imageName:_viewName[2]];
    
    BankCardView *bankcard = [[BankCardView alloc] initWithFrame:normalRect imageName:_viewName[3]];
    
    PayServiceView *payService = [[PayServiceView alloc] initWithFrame:normalRect imageName:_viewName[4]];
    
    AgentProductsView *agent = [[AgentProductsView alloc] initWithFrame:normalRect imageName:_viewName[5]];
    
    MyNetBankView *myNetBank = [[MyNetBankView alloc] initWithFrame:normalRect imageName:_viewName[6]];
    
    CommunicationView *communicate = [[CommunicationView alloc] initWithFrame:normalRect imageName:_viewName[7]];
    
    DateNoticeView *dateNotice = [[DateNoticeView alloc] initWithFrame:normalRect imageName:_viewName[8]];
    
    BusinessConsultingView *business = [[BusinessConsultingView alloc] initWithFrame:normalRect imageName:_viewName[9]];
    
    
    _allWithView = @[homeView,finance,finacialService,bankcard,payService,agent,myNetBank,communicate,dateNotice,business];
    
    [self.view addSubview:self.loginView];
    
    
    
}

/*  初始化数据源       */
- (void)initDataResourse {
    _viewName = @[@"head_首页",@"head_金融资讯",@"head_理财服务",@"head_银行卡",@"head_缴费服务",@"head_代理产品",@"head_我的网银",@"head_活动交流",@"head_日程提醒",@"head_业务咨询"];
    _islogin = [[NSUserDefaults standardUserDefaults]boolForKey:@"login"]?[[NSUserDefaults standardUserDefaults]boolForKey:@"login"]:NO;
}

- (void)getTableViewDidSelectedAtRow:(NSInteger)row section:(NSInteger)section {
    NSLog(@"section is %d, row is %d",section,row);
    NSLog(@"is login is %@",_islogin?@"YEs":@"no");
    BOOL flag = [[NSUserDefaults standardUserDefaults] boolForKey:@"isopen"];
    NSLog(@"flag is %@",flag?@"YEs":@"no");
    
    if (section == 1 && row == 0) {
        if (_islogin) {
            //设置view
        } else {
            self.loginView.hidden = NO;
            [self.view bringSubviewToFront:self.loginView];
        }
        
    }else if (section == 1 && row == 1){
        if (_islogin) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"确定退出登录?" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                self.leftView.isLogin = NO;
                _islogin = NO;
                [[NSUserDefaults standardUserDefaults]setBool:_islogin forKey:@"login"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                
            }];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:okAction];
            [alert addAction:cancelAction];
            
            [self presentViewController:alert animated:YES completion:nil];
        } else {

            UIView *view = _allWithView[_lastSelectView];
            
            NSLog(@"11view is %@",NSStringFromCGPoint(view.center));
            [self openOrCloseTheListWithView:view flag:flag];

            if (!flag) {
                UIView *view = _allWithView[_lastSelectView];
                
                NSLog(@"view is %@",NSStringFromCGPoint(view.center));
                [UIView animateWithDuration:0.5 animations:^{
                    view.center = CGPointMake(584, 512);
                }];
                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"isopen"];
                [[NSUserDefaults standardUserDefaults]synchronize];
            }

        }
  
    } else if(section == 1 && row == 2) {
        
        UIView *view = _allWithView[_lastSelectView];
        
        NSLog(@"view is %@,22view is %@",view,NSStringFromCGPoint(view.center));
        [self openOrCloseTheListWithView:view flag:flag];
        
        
    } else {
        for (UIView *view in _allWithView) {
            [view removeFromSuperview];
        }
        if (!_islogin) {
            if (row == 3) {
                row = 5;
            }else if (row == 4) {
                row = 6;
            }
        }
        
        
        UIView *selectView = _allWithView[row];
        NSLog(@"selcetview is %@",selectView);
        if (flag) {
            selectView.center = CGPointMake(584, selectView.center.y);
        }else {
            selectView.center = CGPointMake(414, selectView.center.y);
        }
        [self.view addSubview:selectView];
        
        _lastSelectView = row;
    }
    

    
}

//打开或关闭菜单
- (void)openOrCloseTheListWithView:(UIView *)view flag:(BOOL)flag {
    if (!flag) {
        [UIView animateWithDuration:0.5 animations:^{
            view.center = CGPointMake(584, 512);
        }];
    } else {
        [UIView animateWithDuration:0.5 animations:^{
            view.center = CGPointMake(414, 512);
        }];
      
    }
    [[NSUserDefaults standardUserDefaults] setBool:!flag forKey:@"isopen"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

- (void)LoginStatueWithFlag:(BOOL)flag {
    self.leftView.isLogin = flag;
    _islogin = flag;
    [[NSUserDefaults standardUserDefaults]setBool:_islogin forKey:@"login"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataResourse];
    [self initAppParam];

//    NSLog(@"width is %lf,height is %lf",SCREEN_W,SCREEN_H);
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (LeftView *)leftView {
    if (!_leftView) {
        _leftView = [[LeftView alloc] initWithFrame:CGRectMake(0, 0, num_w(270), SCREEN_H)];
        _leftView.delegate = self;
        _leftView.isLogin = _islogin;
    }
    return _leftView;
}

- (LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] initWithFrame:self.view.frame];
        _loginView.delegate = self;
        _loginView.hidden = YES;
        _loginView.backgroundColor = CUSTOMBACKCOLOR;
        
    }
    return _loginView;
}


//
//- (HomeView *)homeView {
//    if (!_homeView) {
//        _homeView = [[HomeView alloc] initWithFrame:CGRectMake(num_w(60), 0, SCREEN_W - num_w(60), SCREEN_H) imageName:nil];
//    }
//    return _homeView;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
