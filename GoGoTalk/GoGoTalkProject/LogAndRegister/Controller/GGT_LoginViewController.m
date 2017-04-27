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
