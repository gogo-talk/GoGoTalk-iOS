//
//  GGT_ForgotPasswordView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ForgotPasswordView : UIView <UITextFieldDelegate>
//手机输入框
@property (nonatomic, strong) UITextField *phoneAccountField;

//验证码输入框
@property (nonatomic, strong) UITextField *verificationCodeField;

//密码输入框
@property (nonatomic, strong) UITextField *passwordField;

//获取验证码按钮
@property (nonatomic, strong) UIButton *getCodeButton;

//确认按钮
@property (nonatomic, strong) UIButton *confirmButton;
@end
