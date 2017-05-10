//
//  GGT_OrderCourseOfFocusViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderCourseOfFocusViewController.h"
#import "GGT_OrderTimeTableView.h"

@interface GGT_OrderCourseOfFocusViewController ()

@end

@implementation GGT_OrderCourseOfFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    
    GGT_OrderTimeTableView *View = [[GGT_OrderTimeTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-64-49)];
//    View.backgroundColor = [UIColor redColor];
    [self.view addSubview:View];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
