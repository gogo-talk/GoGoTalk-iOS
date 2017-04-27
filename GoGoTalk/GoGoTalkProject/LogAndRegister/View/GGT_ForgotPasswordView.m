//
//  GGT_ForgotPasswordView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ForgotPasswordView.h"

@implementation GGT_ForgotPasswordView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpContentView];
    }
    return self;
}


- (void)setUpContentView {
    self.phoneAccountField = [[UITextField alloc]init];
    self.phoneAccountField.placeholder = @"请输入手机账号";
    self.phoneAccountField.layer.borderWidth = 0.5;
    self.phoneAccountField.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.phoneAccountField];
    
    [self.phoneAccountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.mas_top).with.offset(100);
        make.height.mas_offset(44);
    }];
    
    
    self.verificationCodeField = [[UITextField alloc]init];
    self.verificationCodeField.placeholder = @"请输入验证码";
    self.verificationCodeField.layer.borderWidth = 0.5;
    self.verificationCodeField.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.verificationCodeField];
    
    
    self.getCodeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.getCodeButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.getCodeButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.getCodeButton.layer.borderWidth = 0.5;
    self.getCodeButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.getCodeButton];
    
    
    [self.verificationCodeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.getCodeButton.mas_left).with.offset(-5);
        make.top.equalTo(self.phoneAccountField.mas_bottom).with.offset(20);
        make.height.mas_offset(44);
    }];

    
    
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeField.mas_right).with.offset(5);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.phoneAccountField.mas_bottom).with.offset(20);
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
        make.top.equalTo(self.verificationCodeField.mas_bottom).with.offset(20);
        make.height.mas_offset(44);
    }];

    
    
    self.confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.confirmButton setTitle:@"确定" forState:(UIControlStateNormal)];
    [self.confirmButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.confirmButton.layer.borderWidth = 0.5;
    self.confirmButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    [self addSubview:self.confirmButton];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(30);
        make.right.equalTo(self.mas_right).with.offset(-30);
        make.top.equalTo(self.passwordField.mas_bottom).with.offset(60);
        make.height.mas_offset(44);
    }];
    
    
    
}


@end
