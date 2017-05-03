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
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_HEX(0xEA5851);
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xEA5851);
    NSLog(@"我的设置页面");
    [self setLeftBackButton];
    
}


@end
