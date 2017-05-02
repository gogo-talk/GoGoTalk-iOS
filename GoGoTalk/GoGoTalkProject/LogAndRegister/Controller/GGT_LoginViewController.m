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
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}




- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.loginView = [[GGT_LoginView alloc]init];
    self.loginView.backgroundColor = [UIColor whiteColor];
    self.view = self.loginView;
    
    [self.loginView.forgotPasswordButton xc_addClickBlock:^(UIButton *button) {
        GGT_ForgotPasswordViewController *vc = [[GGT_ForgotPasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];

    
    [self.loginView.loginButton xc_addClickBlock:^(UIButton *button) {
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:@"yes" forKey:@"login"];
        BaseTabBarController *tabVc = [[BaseTabBarController alloc]init];
        [self.navigationController pushViewController:tabVc animated:YES];
    }];
    
    
    
    [self.loginView.registerButton xc_addClickBlock:^(UIButton *button) {

        GGT_RegisterViewController *vc = [[GGT_RegisterViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
