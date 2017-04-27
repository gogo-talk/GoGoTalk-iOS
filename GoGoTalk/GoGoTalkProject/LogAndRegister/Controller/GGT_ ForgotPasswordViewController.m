//
//  GGT_ ForgotPasswordViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ ForgotPasswordViewController.h"
#import "GGT_ForgotPasswordView.h"

@interface GGT__ForgotPasswordViewController ()

@end

@implementation GGT__ForgotPasswordViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self setLeftBackButton];
    
    self.navigationItem.title = @"找回密码";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
