//
//  GGT_LoginView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_LoginView : UIView

//手机账号view
@property (nonatomic, strong) UIView *phoneAccountView;
//手机icom
@property (nonatomic, strong) UIImageView *phoneImageView;
//手机输入框
@property (nonatomic, strong) UITextField *phoneAccountField;


//密码view
@property (nonatomic, strong) UIView *passwordView;
//密码icom
@property (nonatomic, strong) UIImageView *passwordImageView;
//密码输入框
@property (nonatomic, strong) UITextField *passwordField;





//
@property (nonatomic, strong) UIButton *forgotPasswordButton;
//
@property (nonatomic, strong) UIButton *loginButton;
//
@property (nonatomic, strong) UIButton *registerButton;
//
@property (nonatomic, strong) UIImageView *footerImageView;

@end

