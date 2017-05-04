//
//  GGT_ForgotPasswordViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/27.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ForgotPasswordViewController.h"
#import "GGT_ForgotPasswordView.h"

@interface GGT_ForgotPasswordViewController ()

@property (nonatomic, strong) GGT_ForgotPasswordView *forgotPasswordView;
@end

@implementation GGT_ForgotPasswordViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBackButton];
    
    self.navigationItem.title = @"忘记密码";
    
    
    self.forgotPasswordView = [[GGT_ForgotPasswordView alloc]init];
    self.forgotPasswordView.backgroundColor = [UIColor whiteColor];
    self.view = self.forgotPasswordView;
    
    
    //获取验证码
    @weakify(self);
    [[self.forgotPasswordView.getCodeButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);

         [self getCodeLoadData];
     }];
    
    
}


#pragma mark 获取验证码
- (void)getCodeLoadData {
    if(IsStrEmpty(self.forgotPasswordView.phoneAccountField.text)) {
        [MBProgressHUD showMessage:@"请输入手机号码" toView:self.view];
        return;
    }
    
    
    BOOL isPhoneNum =   [NSString xc_isMobilePhone:self.forgotPasswordView.phoneAccountField.text];
    //判断手机号是否合法
    if (isPhoneNum == NO) {
        [MBProgressHUD showMessage:@"请输入正确的手机号码" toView:self.view];
        return;
    }
    
    
    NSDictionary *postDic = @{@"cell":self.forgotPasswordView.phoneAccountField.text};
    
    
    [MBProgressHUD hideHUDForView:self.view];
    [MBProgressHUD showLoading:self.view];
    [BaseNetManager afPostRequest:[GGT_Request_Url URL_Resigt] parms:postDic finished:^(id responseObj) {
        [MBProgressHUD hideHUDForView:self.view];
        
        NSData *jsonData = [NSJSONSerialization  dataWithJSONObject:responseObj options:NSJSONWritingPrettyPrinted error:nil];
        NSString*jsonStr=[[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        NSLog(@"获取验证码~~~%@",jsonStr);
        
        
        if ([responseObj[@"result"] isEqual:@1]) {
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
  
        } else {
            
            [MBProgressHUD showMessage:responseObj[@"msg"] toView:self.view];
            
        }
        
        
        
    } failed:^(NSString *errorMsg) {
        
    }];

}















@end
