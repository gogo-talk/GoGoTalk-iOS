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
    //icon
    UIImageView *iconImageView = [[UIImageView alloc]init];
    iconImageView.image = UIIMAGE_FROM_NAME(@"logo_login");
    [self addSubview:iconImageView];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(97));
        make.right.equalTo(self.mas_right).with.offset(-LineX(117));
        make.top.equalTo(self.mas_top).with.offset(LineY(100));
        make.height.mas_offset(LineH(47));
    }];
    
    
    //手机号码
    self.phoneAccountView = [[UIView alloc]init];
    self.phoneAccountView.layer.masksToBounds = YES;
    self.phoneAccountView.layer.cornerRadius = LineW(5);
    self.phoneAccountView.layer.borderWidth = LineW(0.5);
    self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(0xCCCCCC).CGColor;
    [self addSubview:self.phoneAccountView];
    
    [self.phoneAccountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(20));
        make.right.equalTo(self.mas_right).with.offset(-LineX(20));
        make.top.equalTo(iconImageView.mas_bottom).with.offset(LineY(40));
        make.height.mas_offset(LineH(44));
    }];
    
    
    //手机icon
    self.phoneImageView = [[UIImageView alloc]init];
    self.phoneImageView.image = UIIMAGE_FROM_NAME(@"iphone_login_wei");
    [self.phoneAccountView addSubview:self.phoneImageView];
    
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(LineX(15));
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(LineY(12));
        make.size.mas_offset(CGSizeMake(LineW(14), LineH(20)));
    }];
    
    //手机号的分割线
    UIView *phonelineView = [[UIView alloc]init];
    phonelineView.backgroundColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.phoneAccountView addSubview:phonelineView];
    
    [phonelineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    //手机号码输入框
//    self.phoneAccountField = [[UITextField alloc]init];
//    self.phoneAccountField.font = Font(15);
//    self.phoneAccountField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入手机号码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(0xCCCCCC)}];
//    [self.phoneAccountView addSubview:self.phoneAccountField];
//    
//    [self.phoneAccountField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(LineX(54));
//        make.right.equalTo(self.phoneImageView.mas_right).with.offset(-0);
//        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(0);
//        make.height.mas_offset(LineH(44));
//    }];
    
    
    
    /****************************************************/
    //密码view
    self.passwordView = [[UIView alloc]init];
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.cornerRadius = LineW(5);
    self.passwordView.layer.borderWidth = LineW(0.5);
    self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(0xCCCCCC).CGColor;
    [self addSubview:self.passwordView];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(20));
        make.right.equalTo(self.mas_right).with.offset(-LineX(20));
        make.top.equalTo(self.phoneAccountView.mas_bottom).with.offset(LineY(20));
        make.height.mas_offset(LineH(44));
    }];
    
    //密码icon
    self.passwordImageView = [[UIImageView alloc]init];
    self.passwordImageView.image = UIIMAGE_FROM_NAME(@"mima_login_wei");
    [self.passwordView addSubview:self.passwordImageView];
    
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(LineX(15));
        make.top.equalTo(self.passwordView.mas_top).with.offset(LineY(12));
        make.size.mas_offset(CGSizeMake(LineW(14), LineH(20)));
    }];
    
    //手机号的分割线
//    UIView *passwordlineView = [[UIView alloc]init];
//    passwordlineView.backgroundColor = UICOLOR_FROM_HEX(0xCCCCCC);
//    [self.passwordView addSubview:passwordlineView];
//    
//    [passwordlineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.passwordImageView.mas_right).with.offset(LineX(15));
//        make.top.equalTo(self.passwordView.mas_top).with.offset(LineY(0));
//        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
//    }];
    
    
    
    
    //密码
//    self.passwordField = [[UITextField alloc]init];
//    self.passwordField.font = Font(15);
//    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(0xCCCCCC)}];
//    [self.passwordView addSubview:self.passwordField];
//    
//    
//    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(passwordlineView.mas_right).with.offset(LineX(10));
//        make.right.equalTo(self.passwordImageView.mas_right).with.offset(-0);
//        make.top.equalTo(self.passwordView.mas_top).with.offset(0);
//        make.height.mas_offset(LineH(44));
//    }];
    
    
    
    
    
    
    
    
    //
    //
    //    self.forgotPasswordButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //    [self.forgotPasswordButton setTitle:@"忘记密码" forState:(UIControlStateNormal)];
    //    [self.forgotPasswordButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    //    self.forgotPasswordButton.backgroundColor = UICOLOR_RANDOM_COLOR();
    //    [self addSubview:self.forgotPasswordButton];
    //
    //
    //    [self.forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.right.equalTo(self.passwordField.mas_right).with.offset(-20);
    //        make.top.equalTo(self.passwordField.mas_bottom).with.offset(10);
    //        make.height.mas_offset(20);
    //    }];
    //
    //
    //    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //    [self.loginButton setTitle:@"登录" forState:(UIControlStateNormal)];
    //    [self.loginButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    //    self.loginButton.layer.borderWidth = 0.5;
    //    self.loginButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    //    [self addSubview:self.loginButton];
    //
    //    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(self.mas_left).with.offset(30);
    //        make.right.equalTo(self.mas_right).with.offset(-30);
    //        make.top.equalTo(self.forgotPasswordButton.mas_bottom).with.offset(30);
    //        make.height.mas_offset(44);
    //    }];
    //
    //
    //    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //    [self.registerButton setTitle:@"注册" forState:(UIControlStateNormal)];
    //    [self.registerButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    //    self.registerButton.layer.borderWidth = 0.5;
    //    self.registerButton.layer.borderColor = UICOLOR_RANDOM_COLOR().CGColor;
    //    [self addSubview:self.registerButton];
    //
    //    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.left.equalTo(self.mas_left).with.offset(30);
    //        make.right.equalTo(self.mas_right).with.offset(-30);
    //        make.top.equalTo(self.loginButton.mas_bottom).with.offset(20);
    //        make.height.mas_offset(44);
    //    }];
    //    
    
    
    
}











@end
