//
//  GGT_RegisterViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_RegisterViewController.h"
#import "GGT_RegisterView.h"

@interface GGT_RegisterViewController ()

@end

@implementation GGT_RegisterViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setLeftBackButton];

    GGT_RegisterView *registerView = [[GGT_RegisterView alloc]init];
    registerView.backgroundColor = [UIColor whiteColor];
    self.view = registerView;
    
    
    [registerView.backButton xc_addClickBlock:^(UIButton *button) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
