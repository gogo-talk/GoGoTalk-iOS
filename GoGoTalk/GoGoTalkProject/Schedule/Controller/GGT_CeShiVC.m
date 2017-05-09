//
//  GGT_CeShiVC.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/9.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_CeShiVC.h"

@interface GGT_CeShiVC ()

@end

@implementation GGT_CeShiVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
}

// 设置屏幕选装  需要在xcode中开启支持屏幕旋转
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeLeft;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self.navigationController popViewControllerAnimated:YES];
}

@end
