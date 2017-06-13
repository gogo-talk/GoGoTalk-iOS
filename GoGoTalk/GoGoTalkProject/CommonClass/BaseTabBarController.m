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

    self.tabBar.tintColor = UICOLOR_FROM_HEX(kThemeColor);
    //设置tabbar不透明
    self.tabBar.translucent = NO;
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
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_yi", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    
    //设置字体偏移量，防止字体偏下
    [navVc.tabBarItem setTitlePositionAdjustment:UIOffsetMake(-3, -3)];
    
    //设置tabbar的颜色以及字体大小
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = UICOLOR_FROM_HEX(0x666666);
    normalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = UICOLOR_FROM_HEX(kThemeColor);
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    [self addChildViewController:navVc];
    
}


//暂时解决横竖屏问题----不过如果是横屏启动的话，会出现bug
/*
//支持旋转
-(BOOL)shouldAutorotate{
    return YES;
}

//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAllButUpsideDown;
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
