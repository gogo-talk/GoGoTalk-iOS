//
//  GGT_EditPasswordController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  修改密码专用控制器

#import "GGT_EditPasswordController.h"

@interface GGT_EditPasswordController ()
//导航栏右侧提交按钮，不符合规则，则不可用
@property(nonatomic, strong) UIButton *rightBtn;
@end

@implementation GGT_EditPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationItems];
    [self initViews];
}
//状态栏白色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)setNavigationItems{
    self.navigationController.title = self.titleName;
    //右侧提交按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 100, 30);
    [rightBtn setFont:[UIFont systemFontOfSize:16]];
    [rightBtn sizeToFit];
    self.rightBtn = rightBtn;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    //约束线
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //约束线宽度
    negativeSpacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightItem];
}
//页面布局
-(void)initViews{
    UIView *baseView = [UIView new];
    [self.view addSubview:baseView];
    UILabel *oldPwdLabel = [UILabel new];
    oldPwdLabel.text = @"原密码";
    oldPwdLabel.font = Font(12);
    oldPwdLabel.textColor = UICOLOR_FROM_HEX(0xcccccc);
    oldPwdLabel.numberOfLines = 1;
    [baseView addSubview:oldPwdLabel];
    
    UILabel *newPwdLabel = [UILabel new];
    newPwdLabel.text = @"新密码";
    newPwdLabel.font = Font(12);
    newPwdLabel.textColor = UICOLOR_FROM_HEX(0xcccccc);
    newPwdLabel.numberOfLines = 1;
    [baseView addSubview:newPwdLabel];
    
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LineW(15), LineH(44))];
    paddingView.backgroundColor = [UIColor whiteColor];
    
    UITextField *oldTextField = [UITextField new];
    oldTextField.leftViewMode = UITextFieldViewModeAlways;
    oldTextField.placeholder = @"请输入原始登录密码";
    //oldTextField.placeholder
    [oldTextField setValue:[UIFont systemFontOfSize:16] forKeyPath:@"_placeholderLabel.font"];
    //[oldTextField setValue:Font(11) forKey:@"placeholderLabel.font"];
    oldTextField.secureTextEntry = YES;
    oldTextField.leftView = paddingView;
    oldTextField.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:oldTextField];
    UIView *paddingView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LineW(15), LineH(44))];
    UITextField *newTextField = [UITextField new];
    newTextField.leftViewMode = UITextFieldViewModeAlways;
    newTextField.placeholder = @"请设置新密码";
    newTextField.secureTextEntry = YES;
    newTextField.leftView = paddingView2;
    [newTextField setValue:[UIFont systemFontOfSize:16] forKey:@"_placeholderLabel.fon"];
    newTextField.backgroundColor = [UIColor whiteColor];
    [baseView addSubview:newTextField];
    
    [baseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.view.mas_top);
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(LineH(154));
    }];
    [oldPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(baseView.mas_top).with.offset(LineY(15));
        make.left.equalTo(baseView.mas_left).with.offset(LineX(15));
        make.height.mas_equalTo(LineH(12));
        make.right.mas_equalTo(baseView.mas_right);
    }];
    
    [oldTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldPwdLabel.mas_bottom).with.offset(LineY(6));
        make.left.mas_equalTo(baseView.mas_left);
        make.right.mas_equalTo(baseView.mas_right);
        make.height.mas_equalTo(LineH(44));
    }];
    
    [newPwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(oldTextField.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(baseView.mas_left).with.offset(LineX(15));
        make.height.mas_equalTo(LineH(12));
        make.right.mas_equalTo(baseView.mas_right);
    }];
    [newTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(newPwdLabel.mas_bottom).with.offset(LineY(6));
        make.left.mas_equalTo(baseView.mas_left);
        make.right.mas_equalTo(baseView.mas_right);
        make.height.mas_equalTo(LineH(44));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
