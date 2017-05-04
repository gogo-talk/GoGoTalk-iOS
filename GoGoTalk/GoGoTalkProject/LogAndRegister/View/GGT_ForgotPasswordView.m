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
        make.top.equalTo(self.mas_top).with.offset(LineY(20));
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
    self.phoneAccountField = [[UITextField alloc]init];
    self.phoneAccountField.font = Font(15);
    self.phoneAccountField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入手机号码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(0xCCCCCC)}];
    self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.phoneAccountView addSubview:self.phoneAccountField];
    
    [self.phoneAccountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(LineX(54));
        make.right.equalTo(self.phoneAccountView.mas_right).with.offset(-0);
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(0);
        make.height.mas_offset(LineH(44));
    }];
    
    
    /****************************************************/
    //验证码view
    self.verificationCodeView = [[UIView alloc]init];
    self.verificationCodeView.layer.masksToBounds = YES;
    self.verificationCodeView.layer.cornerRadius = LineW(5);
    self.verificationCodeView.layer.borderWidth = LineW(0.5);
    self.verificationCodeView.layer.borderColor = UICOLOR_FROM_HEX(0xCCCCCC).CGColor;
    [self addSubview:self.verificationCodeView];
    
    [self.verificationCodeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(20));
        make.right.equalTo(self.mas_right).with.offset(-LineX(20));
        make.top.equalTo(self.phoneAccountView.mas_bottom).with.offset(LineY(20));
        make.height.mas_offset(LineH(44));
    }];
    
    
    //验证码icon
    self.verificationCodeImageView = [[UIImageView alloc]init];
    self.verificationCodeImageView.image = UIIMAGE_FROM_NAME(@"yanzhengma_wangjimima_wei");
    [self.verificationCodeView addSubview:self.verificationCodeImageView];
    
    [self.verificationCodeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_left).with.offset(LineX(13));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(LineY(12));
        make.size.mas_offset(CGSizeMake(LineW(18), LineH(20)));
    }];
    
    
    //验证码的分割线
    UIView *verificationCodelineView1 = [[UIView alloc]init];
    verificationCodelineView1.backgroundColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.verificationCodeView addSubview:verificationCodelineView1];
    
    [verificationCodelineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    //验证码的分割线
    UIView *verificationCodelineView2 = [[UIView alloc]init];
    verificationCodelineView2.backgroundColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.verificationCodeView addSubview:verificationCodelineView2];
    
    [verificationCodelineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_right).with.offset(-LineX(92));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    //验证码
    self.verificationCodeField = [[UITextField alloc]init];
    self.verificationCodeField.font = Font(15);
    self.verificationCodeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入验证码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(0xCCCCCC)}];
    self.verificationCodeField.tintColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.verificationCodeView addSubview:self.verificationCodeField];
    
    [self.verificationCodeField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_left).with.offset(LineX(54));
        make.right.equalTo(self.verificationCodeView.mas_right).with.offset(-LineX(92));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(0);
        make.height.mas_offset(LineH(44));
    }];
    
    
    //获取验证码
    self.getCodeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.getCodeButton setTitle:@"获取验证码" forState:(UIControlStateNormal)];
    [self.getCodeButton setTitleColor:UICOLOR_FROM_HEX(0xCF121C) forState:(UIControlStateNormal)];
    self.getCodeButton.titleLabel.font = Font(13);
    [self.verificationCodeView addSubview:self.getCodeButton];
    
    
    [self.getCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_right).with.offset(-LineX(92));
        make.right.equalTo(self.verificationCodeView.mas_right).with.offset(-0);
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(0);
        make.height.mas_offset(LineH(44));
    }];
    
    
    
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
        make.top.equalTo(self.verificationCodeView.mas_bottom).with.offset(LineY(20));
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
    UIView *passwordlineView = [[UIView alloc]init];
    passwordlineView.backgroundColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.passwordView addSubview:passwordlineView];
    
    [passwordlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.passwordView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    
    //密码
    self.passwordField = [[UITextField alloc]init];
    self.passwordField.font = Font(15);
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(0xCCCCCC)}];
    self.passwordField.tintColor = UICOLOR_FROM_HEX(0xCCCCCC);
    [self.passwordView addSubview:self.passwordField];
    
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(LineX(54));
        make.right.equalTo(self.passwordView.mas_right).with.offset(-0);
        make.top.equalTo(self.passwordView.mas_top).with.offset(0);
        make.height.mas_offset(LineH(44));
    }];
    
    
    
    
    
    
    self.confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.confirmButton setTitle:@"确 认" forState:(UIControlStateNormal)];
    [self.confirmButton setTitleColor:UICOLOR_FROM_HEX(0xFFFFFF) forState:(UIControlStateNormal)];
    self.confirmButton.backgroundColor = UICOLOR_FROM_HEX(0xCF121C);
    self.confirmButton.titleLabel.font = Font(18);
    self.confirmButton.layer.cornerRadius = LineW(22);
    self.confirmButton.layer.masksToBounds = YES;
    [self addSubview:self.confirmButton];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(31));
        make.right.equalTo(self.mas_right).with.offset(-LineX(31));
        make.top.equalTo(self.passwordView.mas_bottom).with.offset(LineY(40));
        make.height.mas_offset(LineH(44));
    }];
    
    
    
}


@end
