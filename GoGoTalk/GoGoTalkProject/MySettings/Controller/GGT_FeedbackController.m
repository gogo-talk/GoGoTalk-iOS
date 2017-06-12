//
//  GGT_FeedbackController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/9.
//  Copyright © 2017年 XieHenry. All rights reserved.
//  意见反馈

#import "GGT_FeedbackController.h"
#import "GGT_FeedbackMessageController.h"
@interface GGT_FeedbackController ()<UITextViewDelegate>
@property(nonatomic, strong)UITextView *textView;
@property(nonatomic, strong) UILabel *pLabel;
@end

@implementation GGT_FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationItems];
    [self initViews];
}
-(void)setNavigationItems
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn setTintColor:[UIColor whiteColor]];
    rightBtn.frame = CGRectMake(0, 0, 0, 0);
    [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [rightBtn sizeToFit];
    [rightBtn addTarget:self action:@selector(submitFeedback:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[spacer,rightItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)submitFeedback:(UIButton *)sender
{
    GGT_FeedbackMessageController *vc = [GGT_FeedbackMessageController new];
    vc.title = @"意见反馈";
    [self.navigationController pushViewController:vc animated:YES];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)initViews
{
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"反馈内容：";
    titleLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    titleLabel.font = Font(12);
    [titleLabel sizeToFit];
    [self.view addSubview:titleLabel];
    UITextView *textView = [UITextView new];
    //textView.placeholder = @"请输入您要投诉的内容";
    textView.font = Font(13);
    
//    textView.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 15, 0)];
//    //设置显示模式为永远显示(默认不显示 必须设置 否则没有效果)
//    textView.leftViewMode = UITextFieldViewModeAlways;
    UILabel *pLabel = [UILabel new];
    pLabel.text = @"请输入您要投诉的内容";
    pLabel.font = [UIFont systemFontOfSize:13];
    pLabel.textColor = UICOLOR_FROM_HEX(0xcccccc);
    [pLabel sizeToFit];
    self.pLabel = pLabel;
    
    [textView addSubview:pLabel];
    [pLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(textView.mas_left).with.offset(15);
        make.top.equalTo(textView.mas_top).with.offset(10);
    }];
    
    
    self.textView = textView;
    self.textView.delegate = self;
    [self.view addSubview:textView];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(LineY(15));
        make.left.equalTo(self.view.mas_left).with.offset(LineX(15));
    }];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).with.offset(LineY(6));
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(LineH(242));
    }];
    //底部400电话
    UILabel *telLabel = [UILabel new];
    telLabel.text = @"客服电话：400-8787-276";
    telLabel.font = Font(12);
    telLabel.textColor = UICOLOR_FROM_HEX(0xea5851);
    [telLabel sizeToFit];
    [self.view addSubview:telLabel];
    [telLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-20);
    }];
}
#pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.pLabel.hidden = YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    NSMutableString *content = [[NSMutableString alloc] initWithString:textView.text];
    if (content.length!=0) {
        self.navigationItem.rightBarButtonItem.enabled=YES;
    }else{
        self.navigationItem.rightBarButtonItem.enabled=NO;
        self.pLabel.hidden = NO;
    }
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
