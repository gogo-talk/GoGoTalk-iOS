//
//  GGT_ForgotPasswordView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ForgotPasswordView : UIView

@property (nonatomic, strong) UITextField *phoneAccountField;

@property (nonatomic, strong) UITextField *verificationCodeField;

@property (nonatomic, strong) UITextField *passwordField;

@property (nonatomic, strong) UIButton *getCodeButton;

@property (nonatomic, strong) UIButton *confirmButton;

@end
