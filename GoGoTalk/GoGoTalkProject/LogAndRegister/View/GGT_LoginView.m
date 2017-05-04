//
//  GGT_LoginView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_LoginView.h"

@implementation GGT_LoginView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpContentView];
    }
    return self;
}


- (void)setUpContentView {
    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.image = UIIMAGE_FROM_NAME(@"logo_login");
    [self addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(97);
        make.right.equalTo(self.mas_right).with.offset(-117);
        make.top.equalTo(self.mas_top).with.offset(100);
        make.height.mas_offset(GGTFrom_X(47));
    }];
    
    
    
    
    self.phoneAccountField = [[UITextField alloc]init];
    self.phoneAccountField.placeholder = @"请输入手机账号";
    self.phoneAccountField.layer.borderWidth = 0.5;
    self.phoneAccountField.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.phoneAccountField];
    
    [self.phoneAccountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.mas_top).with.offset(200);
        make.height.mas_offset(44);
    }];
    
    
    self.passwordField = [[UITextField alloc]init];
    self.passwordField.placeholder = @"请输入密码";
    self.passwordField.layer.borderWidth = 0.5;
    self.passwordField.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.passwordField];
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.phoneAccountField.mas_bottom).with.offset(20);
        make.height.mas_offset(44);
    }];
    
    
    self.forgotPasswordButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.forgotPasswordButton setTitle:@"忘记密码" forState:(UIControlStateNormal)];
    [self.forgotPasswordButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.forgotPasswordButton.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.forgotPasswordButton];
    
    
    [self.forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordField.mas_right).with.offset(-20);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(10);
        make.height.mas_offset(20);
    }];
    
    
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    [self.loginButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.loginButton.layer.borderWidth = 0.5;
    self.loginButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.forgotPasswordButton.mas_bottom).with.offset(30);
        make.height.mas_offset(44);
    }];

    
    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.registerButton setTitle:@"注册" forState:(UIControlStateNormal)];
    [self.registerButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.registerButton.layer.borderWidth = 0.5;
    self.registerButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.registerButton];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(20);
        make.height.mas_offset(44);
    }];
    
    
    
    
}











@end
