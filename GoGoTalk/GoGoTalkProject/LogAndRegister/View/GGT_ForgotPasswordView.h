//
//  GGT_ForgotPasswordView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ForgotPasswordView : UIView

//手机账号view
@property (nonatomic, strong) UIView *phoneAccountView;
//手机icom
@property (nonatomic, strong) UIImageView *phoneImageView;
//手机输入框
@property (nonatomic, strong) UITextField *phoneAccountField;


//验证码view
@property (nonatomic, strong) UIView *verificationCodeView;
//验证码icom
@property (nonatomic, strong) UIImageView *verificationCodeImageView;
//验证码输入框
@property (nonatomic, strong) UITextField *verificationCodeField;
//获取验证码按钮
@property (nonatomic, strong) UIButton *getCodeButton;


//密码view
@property (nonatomic, strong) UIView *passwordView;
//密码icom
@property (nonatomic, strong) UIImageView *passwordImageView;
//密码输入框
@property (nonatomic, strong) UITextField *passwordField;


//确认按钮
@property (nonatomic, strong) UIButton *confirmButton;
@end
