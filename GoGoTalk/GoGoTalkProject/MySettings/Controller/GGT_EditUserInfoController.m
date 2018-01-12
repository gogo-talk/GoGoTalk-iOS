//
//  GGT_EditUserInfoController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  修改信息通用控制器

#import "GGT_EditUserInfoController.h"

@interface GGT_EditUserInfoController () <UITextFieldDelegate>
@property(nonatomic, strong) UITextField *editTextField;
@property(nonatomic, strong) UIButton *finishedButton;
@end

@implementation GGT_EditUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    
    [self createEditTextField];
    
}


-(void)createEditTextField {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(LineH(49));
        make.top.equalTo(self.view.mas_top).with.offset(LineY(10));
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
    }];
    
    
    
    self.editTextField = [UITextField new];
    self.editTextField.font = Font(16);
    self.editTextField.delegate = self;
    self.editTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeStr attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    [self.editTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [bgView addSubview:self.editTextField];

    [self.editTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
        make.right.equalTo(bgView.mas_right).with.offset(-LineX(20));
        make.top.bottom.equalTo(bgView);
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
        make.top.equalTo(self.editTextField.mas_bottom).with.offset(LineY(30));
        make.height.mas_offset(LineH(44));
    }];
}


#pragma mark 检测输入框
- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.text.length >0) {
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
