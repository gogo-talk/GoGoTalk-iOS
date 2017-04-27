//
//  GGTalkTabBarController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGTalkTabBarController.h"
#import "HomeReservationViewController.h"
#import "OrderCourseViewController.h"
#import "ScheduleViewController.h"
#import "DiscoveryViewController.h"
#import "MineViewController.h"

#import "GGTalkNavigationController.h"



@interface GGTalkTabBarController ()

@end

@implementation GGTalkTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tabBar.tintColor = [UIColor whiteColor];
    
    [self setupChildControllers];
}

- (void)setupChildControllers {
    
    [self setupChildNavigationControllerWithClass:[GGTalkNavigationController class] tabbarImageName:@"icon_activity" rootViewControllerClass:[HomeReservationViewController class] tabbarTitle:@"首页"];
    
    [self setupChildNavigationControllerWithClass:[GGTalkNavigationController class] tabbarImageName:@"icon_position" rootViewControllerClass:[OrderCourseViewController class] tabbarTitle:@"预约"];
    
    [self setupChildNavigationControllerWithClass:[GGTalkNavigationController class] tabbarImageName:@"icon_message" rootViewControllerClass:[ScheduleViewController class] tabbarTitle:@"课表"];
    
    [self setupChildNavigationControllerWithClass:[GGTalkNavigationController class] tabbarImageName:@"icon_personal" rootViewControllerClass:[DiscoveryViewController class] tabbarTitle:@"发现"];

}

- (void)setupChildNavigationControllerWithClass:(Class)class tabbarImageName:(NSString *)name rootViewControllerClass:(Class)rootViewControllerClass tabbarTitle:(NSString *)title {

    UIViewController *rootVC = [[rootViewControllerClass alloc] init];
    UINavigationController *navVc = [[class  alloc] initWithRootViewController:rootVC];
    navVc.tabBarItem.title = title;
    navVc.tabBarItem.image = [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", name]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    navVc.tabBarItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [self addChildViewController:navVc];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
