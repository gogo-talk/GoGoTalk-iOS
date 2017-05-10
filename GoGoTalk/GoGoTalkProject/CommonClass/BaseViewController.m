//
//  BaseViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseViewController.h"
#import "GGT_MineViewController.h"
#import "GGT_HomeReservationViewController.h"
#import "GGT_OrderCourseViewController.h"
#import "GGT_ScheduleViewController.h"
#import "GGT_DiscoveryViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航颜色
    self.navigationController.navigationBar.barTintColor = MainColor;
    //设置导航不透明
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Font(19),NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
}



#pragma mark 左侧返回按钮
- (void)setLeftBackButton{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanhui_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = - LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
}


- (void)setLeftItem:(NSString *)imageName
{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = - LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
}


- (void)setRightBarButtonItemTitle:(NSString *)title{
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItem = right;
    self.navigationItem.rightBarButtonItem.tintColor = MainColor;
    
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightAction{
    
}

- (void)setRightButtonWithImg:(NSString *)imageName{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    UIBarButtonItem *navSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    navSpace.width = - LineX(5);
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:navSpace,imageItem, nil];
  
}





#pragma mark 进入到个人中心
- (void)initMineController {
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"wode_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
    
}


- (void)mineClick {
    GGT_MineViewController *mineVc = [[GGT_MineViewController alloc]init];
    mineVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mineVc animated:YES];
    
}


#pragma mark 客服电话
- (void)initServiceTelephone {

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"400-8787-276" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [cancelAction setValue:UICOLOR_FROM_HEX(kThemeColor) forKey:@"_titleTextColor"];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf CallPhoneWithNum:phoneNumber];
    }];
    [defaultAction setValue:UICOLOR_FROM_HEX(0x666666) forKey:@"_titleTextColor"];
    
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)CallPhoneWithNum:(NSString *)phoneNum {
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc]initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
