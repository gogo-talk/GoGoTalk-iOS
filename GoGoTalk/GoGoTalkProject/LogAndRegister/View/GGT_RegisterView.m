//
//  GGT_RegisterView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_RegisterView.h"

@implementation GGT_RegisterView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpContentView];
    }
    return self;
}


- (void)setUpContentView {
    self.backButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.backButton.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self.backButton setImage:[UIImage imageNamed:@"button_back"] forState:(UIControlStateNormal)];
    [self addSubview:self.backButton];
    
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(15);
        make.top.equalTo(self.mas_top).with.offset(15);
        make.size.mas_offset(CGSizeMake(30, 30));
    }];
    
    
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
    
    
    
    
   
    //注册
    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.registerButton setTitle:@"注 册" forState:(UIControlStateNormal)];
    [self.registerButton setTitleColor:UICOLOR_FROM_HEX(0xFFFFFF) forState:(UIControlStateNormal)];
    self.registerButton.backgroundColor = UICOLOR_FROM_HEX(0xCF121C);
    self.registerButton.titleLabel.font = Font(18);
    self.registerButton.layer.cornerRadius = LineW(22);
    self.registerButton.layer.masksToBounds = YES;
    [self addSubview:self.registerButton];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(31));
        make.right.equalTo(self.mas_right).with.offset(-LineX(31));
        make.top.equalTo(self.passwordView.mas_bottom).with.offset(LineY(40));
        make.height.mas_offset(LineH(44));
    }];
    
    
    
    //背景图
    UIImageView *footerImageView = [[UIImageView alloc]init];
    footerImageView.image = UIIMAGE_FROM_NAME(@"beijing_login");
    [self addSubview:footerImageView];
    
    [footerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.height.mas_offset(LineH(128.5));
    }];
    
}



@end
