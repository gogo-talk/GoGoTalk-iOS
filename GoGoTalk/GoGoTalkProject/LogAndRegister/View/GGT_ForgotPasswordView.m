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
    self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
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
    self.phonelineView = [[UIView alloc]init];
    self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.phoneAccountView addSubview:self.phonelineView];
    
    [self.phonelineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    //手机号码输入框
    self.phoneAccountField = [[UITextField alloc]init];
    self.phoneAccountField.font = Font(15);
    self.phoneAccountField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入手机号码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.phoneAccountField.delegate = self;
    self.phoneAccountField.keyboardType = UIKeyboardTypeNumberPad;
    [self.phoneAccountField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    self.verificationCodeView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
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
    self.verificationCodelineView1 = [[UIView alloc]init];
    self.verificationCodelineView1.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.verificationCodeView addSubview:self.verificationCodelineView1];
    
    [self.verificationCodelineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    //验证码的分割线
    self.verificationCodelineView2 = [[UIView alloc]init];
    self.verificationCodelineView2.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.verificationCodeView addSubview:self.verificationCodelineView2];
    
    [self.verificationCodelineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.verificationCodeView.mas_right).with.offset(-LineX(92));
        make.top.equalTo(self.verificationCodeView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    //验证码
    self.verificationCodeField = [[UITextField alloc]init];
    self.verificationCodeField.font = Font(15);
    self.verificationCodeField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入验证码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.verificationCodeField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.verificationCodeField.delegate = self;
    [self.verificationCodeField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    [self.getCodeButton setTitleColor:UICOLOR_FROM_HEX(ColorCF121C) forState:(UIControlStateNormal)];
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
    self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
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
    
    //密码的分割线
    self.passwordlineView = [[UIView alloc]init];
    self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.passwordView addSubview:self.passwordlineView];
    
    [self.passwordlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(LineX(44));
        make.top.equalTo(self.passwordView.mas_top).with.offset(LineY(0));
        make.size.mas_offset(CGSizeMake(LineW(0.5), LineH(44)));
    }];
    
    
    
    //密码
    self.passwordField = [[UITextField alloc]init];
    self.passwordField.font = Font(15);
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.passwordField.delegate = self;
    self.passwordField.secureTextEntry = YES;
    [self.passwordField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
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
    self.confirmButton.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
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

#pragma mark 开始点击输入框
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.phoneAccountField) {
        
        self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCF121C).CGColor;
        self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.phoneImageView.image = UIIMAGE_FROM_NAME(@"iphone_login_yi");
        self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
        
    } else if(textField == self.verificationCodeField) {
        
        self.verificationCodeView.layer.borderColor = UICOLOR_FROM_HEX(ColorCF121C).CGColor;
        self.verificationCodeField.tintColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.verificationCodeImageView.image = UIIMAGE_FROM_NAME(@"yanzhengma_wangjimima_yi");
        self.verificationCodelineView1.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.verificationCodelineView2.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);

    } else if (textField == self.passwordField) {
        
        self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCF121C).CGColor;
        self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.passwordImageView.image = UIIMAGE_FROM_NAME(@"mima_login_yi");
        self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
    }
}


#pragma mark 结束点击输入框
- (void)textFieldDidEndEditing:(UITextField *)textField {
    //手机号
    self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.phoneImageView.image = UIIMAGE_FROM_NAME(@"iphone_login_wei");
    self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    
    //验证码
    self.verificationCodeView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    self.verificationCodeField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.verificationCodeImageView.image = UIIMAGE_FROM_NAME(@"yanzhengma_wangjimima_wei");
    self.verificationCodelineView1.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.verificationCodelineView2.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);

    
    //密码
    self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.passwordImageView.image = UIIMAGE_FROM_NAME(@"mima_login_wei");
    self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    
    
}

#pragma mark 检测输入框的字数限制
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == self.phoneAccountField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    } else if(textField == self.verificationCodeField) {
        
        if (textField.text.length > 8) {
            textField.text = [textField.text substringToIndex:8];
        }
    } else if (textField == self.passwordField) {
        if (textField.text.length > 12) {
            textField.text = [textField.text substringToIndex:12];
        }
    }
}



@end
