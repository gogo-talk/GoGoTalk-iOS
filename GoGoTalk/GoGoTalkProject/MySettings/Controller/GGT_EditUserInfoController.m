//
//  GGT_EditUserInfoController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  修改信息通用控制器

#import "GGT_EditUserInfoController.h"

@interface GGT_EditUserInfoController ()<UITextFieldDelegate>
@property(nonatomic, weak)UITextField *editTextField;

@property(nonatomic, weak) UIBarButtonItem *rightItem;
@end

@implementation GGT_EditUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationItems];
    [self createEditTextField];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)setNavigationItems
{
    //导航栏标题
    self.navigationItem.title = self.titleName;
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    
    rightBtn.frame = CGRectMake(0, 0, 100, 30);
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [rightBtn sizeToFit];
    [rightBtn addTarget:self action:@selector(updateInfo:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightItem setEnabled:NO];
    self.rightItem = rightItem;
    //创建FixedSpace。用来控制上面按钮位置
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //设置negativeSpacer的宽度
    negativeSpacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,rightItem];
    
}
-(void)updateInfo:(UIButton *)sender
{
    NSLog(@"提交了信息");
}
-(void)createEditTextField
{
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:bgView];
    UITextField *editTextField = [UITextField new];
    editTextField.placeholder = @"请输入信息";
    editTextField.font = Font(16);
    editTextField.text = self.info;
    editTextField.backgroundColor = [UIColor whiteColor];
    self.editTextField = editTextField;
    self.editTextField.delegate = self;
    [bgView addSubview:editTextField];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(LineH(44));
        make.top.mas_equalTo(LineY(10));
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
    }];
    
    
    [editTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
        make.top.mas_equalTo(bgView.mas_top);
        make.bottom.mas_equalTo(bgView.mas_bottom);
        make.right.mas_equalTo(bgView.mas_right);
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
#pragma mark -- UITextFieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if([textField.text isEqualToString:self.info] || textField.text.length <= 6){
        [self.rightItem setEnabled:NO];
        [self.rightItem setTintColor:[UIColor redColor]];
        NSLog(@"输入的内容相同或内容为空，不可提交。输入的:%@!!原内容:%@",self.info,textField.text);
    }else{
        [self.rightItem setEnabled:YES];
    }
    
}
@end
