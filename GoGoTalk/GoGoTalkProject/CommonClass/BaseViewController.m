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

static BOOL isBackToHome;
@interface BaseViewController ()

@end

@implementation BaseViewController


- (void)setLeftBackButton{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 44, 44);
    [btn setImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"button_back"] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, -28, 0, 0);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = backItem;
    //解决手势问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    
}

- (void)setLeftItem:(NSString *)imageName
{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 0;
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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.navigationController.viewControllers isKindOfClass:[GGT_HomeReservationViewController class]] || [self.navigationController.viewControllers isKindOfClass:[GGT_OrderCourseViewController class]] || [self.navigationController.viewControllers isKindOfClass:[GGT_ScheduleViewController class]] || [self.navigationController.viewControllers isKindOfClass:[GGT_DiscoveryViewController class]]) {

    
        isBackToHome = NO;
        //导航左侧的个人中心
        [self initMineController];
    }
    
    
    

}


#pragma mark 进入到个人中心
- (void)initMineController {
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"button_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = 0;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
}

- (void)mineClick {
    
    GGT_MineViewController *mineVc = [[GGT_MineViewController alloc]init];
    mineVc.hidesBottomBarWhenPushed = YES;
    if ([BaseViewController isEqual:[GGT_HomeReservationViewController class]]) {
        NSLog(@"111");
    }
    
    
    
    
    if (isBackToHome == NO) {
        [self.navigationController pushViewController:mineVc animated:YES];
        isBackToHome = YES;

    } else {
        [self.navigationController popViewControllerAnimated:YES];
        isBackToHome = NO;
    }
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
