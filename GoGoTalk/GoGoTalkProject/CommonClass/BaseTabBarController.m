//
//  BaseTabBarController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseTabBarController.h"
#import "GGT_HomeReservationViewController.h"
#import "GGT_OrderCourseViewController.h"
#import "GGT_ScheduleViewController.h"
#import "GGT_DiscoveryViewController.h"
#import "BaseNavigationController.h"



@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = MainColor;

    //设置视图
    [self setupChildControllers];
}

- (void)setupChildControllers {
    
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"home_tab" rootViewControllerClass:[GGT_HomeReservationViewController class] tabbarTitle:@"首页"];
    
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"yueke_tab" rootViewControllerClass:[GGT_OrderCourseViewController class] tabbarTitle:@"约课"];
    
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"kebiao_tab" rootViewControllerClass:[GGT_ScheduleViewController class] tabbarTitle:@"课表"];
    
    [self setupChildNavigationControllerWithClass:[BaseNavigationController class] tabbarImageName:@"faxian_tab" rootViewControllerClass:[GGT_DiscoveryViewController class] tabbarTitle:@"发现"];
    
}


#pragma mark 初始化子视图
- (void)setupChildNavigationControllerWithClass:(Class)class tabbarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass tabbarTitle:(NSString *)title {

    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    navVc.navigationController.navigationBar.translucent = NO;
    [self addChildViewController:navVc];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
