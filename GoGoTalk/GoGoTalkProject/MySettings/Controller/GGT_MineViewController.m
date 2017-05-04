//
//  GGT_MineViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_MineViewController.h"

@interface GGT_MineViewController ()

@end

@implementation GGT_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationStyle];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUserInfo];
    NSLog(@"我的设置页面");
    [self setLeftBackButton];
    
}
//设置导航栏样式
-(void)setNavigationStyle
{
    self.navigationItem.title = @"我的";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui_top"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_HEX(0xEA5851);
    self.navigationController.navigationBar.translucent = NO;
}
//设置用户基本信息
-(void)setUserInfo
{
    UIImageView *userInfoView = [UIImageView new];
    userInfoView.image = UIIMAGE_FROM_NAME(@"beijing_wode_top");
    [self.view addSubview:userInfoView];
    [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.height.mas_equalTo(LineH(168));
    }];
}
@end
