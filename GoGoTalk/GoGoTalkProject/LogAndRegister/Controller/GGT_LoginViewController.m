//
//  GGT_LoginViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_LoginViewController.h"
#import "BaseTabBarController.h"
#import "GGT_ ForgotPasswordViewController.h"
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
    self.view.backgroundColor = UICOLOR_RANDOM_COLOR();

    
    self.loginView = [[GGT_LoginView alloc]init];
    self.view = self.loginView;
    
    [self.loginView.forgotPasswordButton xc_addClickBlock:^(UIButton *button) {
        GGT__ForgotPasswordViewController *vc = [[GGT__ForgotPasswordViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];

    }];
  

}

- (void)loginButtonClick {
    BaseTabBarController *tabVc = [[BaseTabBarController alloc]init];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"yes" forKey:@"login"];
    self.view.window.rootViewController = tabVc;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
