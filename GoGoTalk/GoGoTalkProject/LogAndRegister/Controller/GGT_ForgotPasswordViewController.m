//
//  GGT_ForgotPasswordViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ForgotPasswordViewController.h"
#import "GGT_ForgotPasswordView.h"

@interface GGT_ForgotPasswordViewController ()

@end

@implementation GGT_ForgotPasswordViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBackButton];
    
    self.navigationItem.title = @"忘记密码";
    
    
    GGT_ForgotPasswordView *forgotPasswordView = [[GGT_ForgotPasswordView alloc]init];
    forgotPasswordView.backgroundColor = [UIColor whiteColor];
    self.view = forgotPasswordView;
    
    
}


@end
