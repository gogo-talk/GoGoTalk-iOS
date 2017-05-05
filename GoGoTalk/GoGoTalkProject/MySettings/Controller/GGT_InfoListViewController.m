//
//  GGT_InfoListViewController.m
//  GoGoTalk
//
//  Created by GoGoTalk on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_InfoListViewController.h"
@interface GGT_InfoListViewController()
@property(nonatomic, strong) UITableView *tableView;
@end
@interface GGT_InfoListViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GGT_InfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self setNavigationStyle];
    
}
//-(void)setNavigationStyle
//{
////    self.navigationItem.title = @"个人信息";
////    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanhui_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
////    
////    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
////                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
////                                       target:nil action:nil];
////    negativeSpacer.width = - LineX(5);
////    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
//    
//    
////    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_HEX(0xEA5851);
////    self.navigationController.navigationBar.translucent = NO;
//}
-(void)leftAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
