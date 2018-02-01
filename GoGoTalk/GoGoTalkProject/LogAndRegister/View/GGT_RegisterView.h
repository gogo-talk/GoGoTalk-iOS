//
//  GGT_RegisterView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_RegisterView : UIView <UITextFieldDelegate>
//手机输入框
@property (nonatomic, strong) UITextField *phoneAccountField;

//验证码输入框
@property (nonatomic, strong) UITextField *verificationCodeField;

//密码输入框
@property (nonatomic, strong) UITextField *passwordField;

//注册
@property (nonatomic, strong) UIButton *registerButton;

//获取验证码按钮
@property (nonatomic, strong) UIButton *getCodeButton;

//返回按钮
@property (nonatomic, strong) UIButton *backButton;
//立即登录 按钮
@property (nonatomic, strong) UIButton *loginButton;
@end
