//
//  GGT_SelectCoursewareViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/10.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_SelectCoursewareViewController.h"

@interface GGT_SelectCoursewareViewController ()

@end

@implementation GGT_SelectCoursewareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择课件";
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    [self setLeftItem:@"guanbi_xuanzekejian"];
    [self setRightBarButtonItemTitle:@"确定"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
