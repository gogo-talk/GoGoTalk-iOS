//
//  GGT_EditPasswordController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  修改密码专用控制器

#import "GGT_EditPasswordController.h"

@interface GGT_EditPasswordController () <UITextFieldDelegate>
/**
 原密码
 */
@property(nonatomic, strong) UITextField *oldTextField;
/**
 新密码
 */
@property(nonatomic, strong) UITextField *newpTextField;
/**
 确认
 */
@property(nonatomic, strong) UIButton *finishedButton;

@end

@implementation GGT_EditPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self initView];

}


//页面布局
- (void)initView {
    UILabel *oldPwdLabel = [UILabel new];
    oldPwdLabel.text = @"原密码:";
    oldPwdLabel.font = Font(12);
    oldPwdLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    [self.view addSubview:oldPwdLabel];
    
    [oldPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(LineY(15));
        make.left.equalTo(self.view.mas_left).with.offset(LineX(15));
        make.height.mas_equalTo(LineH(12));
    }];
    
    
    UIView *oldView = [UIView new];
    oldView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:oldView];
    
    [oldView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldPwdLabel.mas_bottom).with.offset(LineY(6));
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(LineH(49));
    }];
    
    
    self.oldTextField = ({
        UITextField *textField = [UITextField new];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入原登录密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
        textField.font = Font(16);
        textField.secureTextEntry = YES;
        textField.backgroundColor = [UIColor whiteColor];
        textField;
    });
    [self.oldTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [oldView addSubview:self.oldTextField];
    
    [self.oldTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldView.mas_top).with.offset(0);
        make.left.equalTo(oldView.mas_left).with.offset(LineX(15));
        make.right.equalTo(oldView.mas_right).with.offset(-LineX(15));
        make.height.mas_equalTo(LineH(44));
    }];
    
    
    
    UILabel *newPwdLabel = [UILabel new];
    newPwdLabel.text = @"新密码:";
    newPwdLabel.font = Font(12);
    newPwdLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    [self.view addSubview:newPwdLabel];

    [newPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldView.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(self.view.mas_left).with.offset(LineX(15));
        make.height.mas_equalTo(LineH(12));
    }];
    
    
    UIView *newView = [UIView new];
    newView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:newView];
    
    [newView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newPwdLabel.mas_bottom).with.offset(LineY(6));
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(LineH(49));
    }];

    
    self.newpTextField = ({
        UITextField *textField = [UITextField new];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请设置新密码"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
        textField.font = Font(16);
        textField.secureTextEntry = YES;
        textField.backgroundColor = [UIColor whiteColor];
        textField;
    });
    [self.newpTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [newView addSubview:self.newpTextField];
    
    [self.newpTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newView.mas_top).with.offset(0);
        make.left.equalTo(newView.mas_left).with.offset(LineX(15));
        make.right.equalTo(newView.mas_right).with.offset(-LineX(15));
        make.height.mas_equalTo(LineH(44));
    }];
    
    
    //确认
    self.finishedButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.finishedButton setTitle:@"确 认" forState:(UIControlStateNormal)];
    [self.finishedButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.finishedButton.titleLabel.font = Font(18);
    self.finishedButton.layer.cornerRadius = LineH(22);
    self.finishedButton.layer.masksToBounds = YES;
    self.finishedButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.view addSubview:self.finishedButton];
    
    [self.finishedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(LineX(30));
        make.right.equalTo(self.view.mas_right).with.offset(-LineX(30));
        make.top.equalTo(self.newpTextField.mas_bottom).with.offset(LineY(30));
        make.height.mas_offset(LineH(44));
    }];
}

#pragma mark 检测输入框
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField == self.oldTextField) {
        self.oldTextField.text = textField.text;
    } else if (textField == self.newpTextField) {
        self.newpTextField.text = textField.text;
    }
    
    
    if (self.oldTextField.text.length > 0 && self.newpTextField.text.length >0) {
        self.finishedButton.enabled = YES;
        self.finishedButton.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    } else {
        self.finishedButton.enabled = NO;
        self.finishedButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
