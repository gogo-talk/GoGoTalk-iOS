//
//  GGT_LoginViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_LoginViewController.h"
#import "BaseTabBarController.h"
#import "GGT_ForgotPasswordViewController.h"
#import "GGT_RegisterViewController.h"
#import "GGT_LoginView.h"



@interface GGT_LoginViewController ()

@property (nonatomic, strong) GGT_LoginView *loginView;

@end

@implementation GGT_LoginViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loginView = [[GGT_LoginView alloc]init];
    self.loginView.backgroundColor = [UIColor whiteColor];
    self.view = self.loginView;
    

    //忘记密码
    @weakify(self);
    [[self.loginView.forgotPasswordButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         GGT_ForgotPasswordViewController *vc = [[GGT_ForgotPasswordViewController alloc]init];
         [self.navigationController pushViewController:vc animated:YES];
     }];
    
    
    //注册
    [[self.loginView.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         GGT_RegisterViewController *vc = [[GGT_RegisterViewController alloc]init];
         [self.navigationController pushViewController:vc animated:YES];
     }];
    
    //登录
    [[self.loginView.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         
//         [self loginLoadData];
         NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
         [userDefaults setObject:@"yes" forKey:@"login"];
         BaseTabBarController *tabVc = [[BaseTabBarController alloc]init];
         [self.navigationController pushViewController:tabVc animated:YES];
         

     }];
    
}

#pragma mark 登录按钮处理
- (void)loginLoadData {
    if(IsStrEmpty(self.loginView.phoneAccountField.text)) {
        [MBProgressHUD showMessage:@"请输入手机号码" toView:self.view];
        return;
    }
    
    
    BOOL isPhoneNum =   [NSString xc_isMobilePhone:self.loginView.phoneAccountField.text];
    //判断手机号是否合法
    if (isPhoneNum == NO) {
        [MBProgressHUD showMessage:@"请输入正确的手机号码" toView:self.view];
        return;
    }
    
    //密码验证
    if(IsStrEmpty(self.loginView.passwordField.text) || self.loginView.passwordField.text.length <6 || self.loginView.passwordField.text.length >12) {
        [MBProgressHUD showMessage:@"请输入正确的登录密码（6~12位）" toView:self.view];
        return;
    }
    
    
    NSDictionary *postDic = @{@"UserName":self.loginView.phoneAccountField.text,@"Password":self.loginView.passwordField.text,@"DeviceId":@""};
    
    
    [MBProgressHUD hideHUDForView:self.view];
    [MBProgressHUD showLoading:self.view];
    [BaseNetManager afPostRequest:URL_Login parms:postDic finished:^(id responseObj) {
        [MBProgressHUD hideHUDForView:self.view];
        
        NSData *jsonData = [NSJSONSerialization  dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:nil];
        NSString*jsonStr=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"登录url=%@~~~%@",URL_Login,jsonStr);
        
        
        if ([responseObj[@"result"] isEqual:@1]) {
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
            
            
            [self performSelector:@selector(turnToHomeClick) withObject:nil afterDelay:1.5f];
            
        } else {
            
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
            
        }
 
    } failed:^(NSString *errorMsg) {
        
    }];

    
    
}

- (void)turnToHomeClick {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"yes" forKey:@"login"];
    BaseTabBarController *tabVc = [[BaseTabBarController alloc]init];
    [self.navigationController pushViewController:tabVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
