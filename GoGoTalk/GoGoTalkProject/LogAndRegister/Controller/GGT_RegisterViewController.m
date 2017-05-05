//
//  GGT_RegisterViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_RegisterViewController.h"
#import "GGT_RegisterView.h"
#import "BaseTabBarController.h"

@interface GGT_RegisterViewController ()

@property (nonatomic, strong) GGT_RegisterView *registerView;


@end

@implementation GGT_RegisterViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBackButton];

    self.registerView = [[GGT_RegisterView alloc]init];
    self.registerView.backgroundColor = [UIColor whiteColor];
    self.view = self.registerView;
    
    //返回
     @weakify(self);
     [[self.registerView.backButton rac_signalForControlEvents:UIControlEventTouchUpInside]
      subscribeNext:^(id x) {
          @strongify(self);
        [self.navigationController popViewControllerAnimated:YES];
      }];
    
    
    //注册
    [[self.registerView.registerButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
         
         [self registerLoadData];
     }];
    
}


#pragma mark 注册
- (void)registerLoadData {
    if(IsStrEmpty(self.registerView.phoneAccountField.text)) {
        [MBProgressHUD showMessage:@"请输入手机号码" toView:self.view];
        return;
    }
    
    
    BOOL isPhoneNum =   [NSString xc_isMobilePhone:self.registerView.phoneAccountField.text];
    //判断手机号是否合法
    if (isPhoneNum == NO) {
        [MBProgressHUD showMessage:@"请输入正确的手机号码" toView:self.view];
        return;
    }
    
    
    
    if(IsStrEmpty(self.registerView.passwordField.text) || self.registerView.passwordField.text.length <6 || self.registerView.passwordField.text.length >12) {
        [MBProgressHUD showMessage:@"请设置6~12位的登录密码" toView:self.view];
        return;
    }
    
    //只有账号和密码。其余的设置为空或者默认
     NSDictionary *postDic = @{@"UserId":@0,@"Cell":self.registerView.phoneAccountField.text,@"NickName":@"",@"Password":self.registerView.passwordField.text,@"Sex":@3,@"Birthday":@"",@"OrgId":@0};
    
    
    [MBProgressHUD hideHUDForView:self.view];
    [MBProgressHUD showLoading:self.view];
    [BaseNetManager afPostRequest:[GGT_Request_Url URL_Resigt] parms:postDic finished:^(id responseObj) {
        [MBProgressHUD hideHUDForView:self.view];

        NSData *jsonData = [NSJSONSerialization  dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:nil];
        NSString*jsonStr=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"注册成功url=%@~~~%@",[GGT_Request_Url URL_Resigt],jsonStr);
        
        
        if ([responseObj[@"result"] isEqual:@1]) {
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
            
            if (IsStrEmpty(responseObj[@"msg"])) {
                [MBProgressHUD showMessage:@"注册成功" toView:self.view];
            }
            
            
            [self performSelector:@selector(turnToHomeClick) withObject:nil afterDelay:1.5f];
          
        } else {
            
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
            
            if (IsStrEmpty(responseObj[@"msg"])) {
                [MBProgressHUD showMessage:@"注册失败" toView:self.view];
            }
            
        }
        
        
        
    } failed:^(NSString *errorMsg) {
        
    }];
}


-(void)turnToHomeClick{
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
