//
//  BaseViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseViewController.h"

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
