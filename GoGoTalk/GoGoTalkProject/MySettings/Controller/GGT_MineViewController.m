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
    //头像
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wudingdan_wode"]];
    imageView1.layer.masksToBounds =YES;
    imageView1.layer.cornerRadius =32;
    [imageView1.layer setBorderWidth:5];
    [imageView1.layer setBorderColor:[[UIColor colorWithRed:207/255.0 green:18/255.0 blue:28/255.0 alpha:1] CGColor]];
    [userInfoView addSubview:imageView1];
    //英文昵称
    UILabel *name_en = [[UILabel alloc] init];
    name_en.text = @"Ruihua";
    name_en.textColor = [UIColor whiteColor];
    name_en.font = Font(16);
    [userInfoView addSubview:name_en];
    //中文昵称
    UILabel *name = [[UILabel alloc] init];
    name.textColor = [UIColor whiteColor];
    name.text = @"托尼";
    
    [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        make.height.mas_equalTo(LineH(168));
    }];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_top).with.offset(LineY(11));
        make.left.equalTo(userInfoView.mas_left).with.offset(LineX(20));
        make.width.mas_equalTo(LineW(65));
        make.height.mas_equalTo(LineH(65));
    }];
    //英文昵称布局
    [name_en mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_top).with.offset(LineY(22));
        make.left.equalTo(imageView1.mas_right).with.offset(LineX(10));
    }];
}
@end
