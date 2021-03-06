//
//  GGT_LoginView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_LoginView.h"

@interface GGT_LoginView()
//手机账号view
@property (nonatomic, strong) UIView *phoneAccountView;
//手机icom
@property (nonatomic, strong) UIImageView *phoneImageView;
//手机号的分割线
@property (nonatomic, strong) UIView *phonelineView;


//密码view
@property (nonatomic, strong) UIView *passwordView;
//密码icom
@property (nonatomic, strong) UIImageView *passwordImageView;
//密码的分割线
@property (nonatomic, strong) UIView *passwordlineView;
@end

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
    iconImageView.image = UIIMAGE_FROM_NAME(@"logo");
    [self addSubview:iconImageView];
    
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).with.offset(100);
        make.size.mas_offset(CGSizeMake(160, 48));
    }];
    
    
    //手机号码
    self.phoneAccountView = [[UIView alloc]init];
    self.phoneAccountView.layer.masksToBounds = YES;
    self.phoneAccountView.layer.cornerRadius = 5;
    self.phoneAccountView.layer.borderWidth = 0.5;
    self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    [self addSubview:self.phoneAccountView];
    
    [self.phoneAccountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin20);
        make.right.equalTo(self.mas_right).with.offset(-margin20);
        make.top.equalTo(iconImageView.mas_bottom).with.offset(40);
        make.height.mas_offset(44);
    }];
    
    
    //手机icon
    self.phoneImageView = [[UIImageView alloc]init];
    self.phoneImageView.image = UIIMAGE_FROM_NAME(@"icon-shoujihao-hui");
    [self.phoneAccountView addSubview:self.phoneImageView];
    
    [self.phoneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(margin15);
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(12);
        make.size.mas_offset(CGSizeMake(14, margin20));
    }];
    
    //手机号的分割线
    self.phonelineView = [[UIView alloc]init];
    self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.phoneAccountView addSubview:self.phonelineView];
    
    [self.phonelineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(44);
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(0);
        make.size.mas_offset(CGSizeMake(0.5, 44));
    }];
    
    
    //手机号码输入框
    self.phoneAccountField = [[UITextField alloc]init];
    self.phoneAccountField.font = SystemFont(15);
    self.phoneAccountField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入手机号码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.phoneAccountField.delegate = self;
    self.phoneAccountField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneAccountField.clearButtonMode = YES;
    [self.phoneAccountField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.phoneAccountView addSubview:self.phoneAccountField];
    
    [self.phoneAccountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.phoneAccountView.mas_left).with.offset(54);
        make.right.equalTo(self.phoneAccountView.mas_right).with.offset(-0);
        make.top.equalTo(self.phoneAccountView.mas_top).with.offset(0);
        make.height.mas_offset(44);
    }];
    
    
    
    /****************************************************/
    //密码view
    self.passwordView = [[UIView alloc]init];
    self.passwordView.layer.masksToBounds = YES;
    self.passwordView.layer.cornerRadius = 5;
    self.passwordView.layer.borderWidth = 0.5;
    self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    [self addSubview:self.passwordView];
    
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin20);
        make.right.equalTo(self.mas_right).with.offset(-margin20);
        make.top.equalTo(self.phoneAccountView.mas_bottom).with.offset(margin20);
        make.height.mas_offset(44);
    }];
    
    //密码icon
    self.passwordImageView = [[UIImageView alloc]init];
    self.passwordImageView.image = UIIMAGE_FROM_NAME(@"icon-mima-hui");
    [self.passwordView addSubview:self.passwordImageView];
    
    [self.passwordImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(margin15);
        make.top.equalTo(self.passwordView.mas_top).with.offset(12);
        make.size.mas_offset(CGSizeMake(14, margin20));
    }];
    
    //密码的分割线
    self.passwordlineView = [[UIView alloc]init];
    self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.passwordView addSubview:self.passwordlineView];
    
    [self.passwordlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(44);
        make.top.equalTo(self.passwordView.mas_top).with.offset(0);
        make.size.mas_offset(CGSizeMake(0.5, 44));
    }];
    
    
    
    
    //密码
    self.passwordField = [[UITextField alloc]init];
    self.passwordField.font = SystemFont(15);
    self.passwordField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.passwordField.delegate = self;
    self.passwordField.secureTextEntry = YES;
    self.passwordField.clearButtonMode = YES;
     [self.passwordField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.passwordView addSubview:self.passwordField];
    
    
    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordView.mas_left).with.offset(54);
        make.right.equalTo(self.passwordView.mas_right).with.offset(-0);
        make.top.equalTo(self.passwordView.mas_top).with.offset(0);
        make.height.mas_offset(44);
    }];
    
    
    
    
    //忘记密码
    self.forgotPasswordButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.forgotPasswordButton setTitle:@"忘记密码" forState:(UIControlStateNormal)];
    [self.forgotPasswordButton setTitleColor:UICOLOR_FROM_HEX(0x666666) forState:(UIControlStateNormal)];
    self.forgotPasswordButton.titleLabel.font = SystemFont(13);
    [self addSubview:self.forgotPasswordButton];
    
    
    [self.forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.passwordView.mas_right).with.offset(-5);
        make.top.equalTo(self.passwordView.mas_bottom).with.offset(margin10);
        make.height.mas_offset(13);
    }];
    
    
    //登录
    self.loginButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.loginButton setTitle:@"登 录" forState:(UIControlStateNormal)];
    [self.loginButton setTitleColor:UICOLOR_FROM_HEX(0xFFFFFF) forState:(UIControlStateNormal)];
    self.loginButton.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
    self.loginButton.titleLabel.font = SystemFont(18);
    [self addSubview:self.loginButton];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(31);
        make.right.equalTo(self.mas_right).with.offset(-31);
        make.top.equalTo(self.forgotPasswordButton.mas_bottom).with.offset(30);
        make.height.mas_offset(44);
    }];
    
    
    
    
    
    //注册
    self.registerButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.registerButton setTitle:@"注 册" forState:(UIControlStateNormal)];
    [self.registerButton setTitleColor:UICOLOR_FROM_HEX(ColorCF121C) forState:(UIControlStateNormal)];
    self.registerButton.titleLabel.font = SystemFont(18);
    [self addSubview:self.registerButton];
    
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(31);
        make.right.equalTo(self.mas_right).with.offset(-31);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(margin20);
        make.height.mas_offset(44);
    }];
    
    
    
    //背景图
    UIImageView *footerImageView = [[UIImageView alloc]init];
    footerImageView.image = UIIMAGE_FROM_NAME(@"beijing-dibu");
    [self addSubview:footerImageView];
    
    [footerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(0);
        make.height.mas_offset(130);
    }];
    
}

#pragma mark 开始点击输入框
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.phoneAccountField) {
        self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCF121C).CGColor;
        self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.phoneImageView.image = UIIMAGE_FROM_NAME(@"icon-shoujihao-hongse");
        self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
    } else {
        self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCF121C).CGColor;
        self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCF121C);
        self.passwordImageView.image = UIIMAGE_FROM_NAME(@"icon-mima-hong");
        self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCF121C);
    }
}


#pragma mark 结束点击输入框
- (void)textFieldDidEndEditing:(UITextField *)textField {
    //手机号
    self.phoneAccountView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    self.phoneAccountField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.phoneImageView.image = UIIMAGE_FROM_NAME(@"icon-shoujihao-hui");
    self.phonelineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);


    //密码
    self.passwordView.layer.borderColor = UICOLOR_FROM_HEX(ColorCCCCCC).CGColor;
    self.passwordField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.passwordImageView.image = UIIMAGE_FROM_NAME(@"icon-mima-hui");
    self.passwordlineView.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
}


#pragma mark 检测输入框的字数限制
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == self.phoneAccountField) {
        if (textField.text.length > 11) {
            textField.text = [textField.text substringToIndex:11];
        }
    } else {
        
        if (textField.text.length > 12) {
            textField.text = [textField.text substringToIndex:12];
        }
    }
}


- (void)drawRect:(CGRect)rect {
    [self.loginButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:22];
    
    [self.registerButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:22];
    [self.registerButton addBorderForViewWithBorderWidth:0.5 BorderColor:UICOLOR_FROM_HEX(ColorCF121C) CornerRadius:22];
}


@end
