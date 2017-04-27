//
//  GGT_LoginViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_LoginViewController.h"
#import "BaseTabBarController.h"
#import "GGT_LoginView.h"

@interface GGT_LoginViewController ()

@property (nonatomic, strong) GGT_LoginView *loginView;

@end

@implementation GGT_LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.loginView = [[GGT_LoginView alloc]init];
    self.view = self.loginView;
    
    
    
    
    
    
    
    
//    UIButton *loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    loginButton.frame = CGRectMake((SCREEN_WIDTH-100)/2, (SCREEN_HEIGHT-44)/2, 100, 44);
//    [loginButton setTitle:@"立即登录" forState:(UIControlStateNormal)];
//    [loginButton setTitleColor:[UIColor redColor] forState:(UIControlStateNormal)];
//    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
//    [self.view addSubview:loginButton];

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
