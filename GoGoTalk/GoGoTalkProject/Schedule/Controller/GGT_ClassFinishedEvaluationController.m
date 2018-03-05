//
//  GGT_ClassFinishedEvaluationController.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/3/2.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedEvaluationController.h"
#import "GGT_ClassFinishedEvaluationView.h"

@interface GGT_ClassFinishedEvaluationController ()

@end

@implementation GGT_ClassFinishedEvaluationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"课后评价";
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    GGT_ClassFinishedEvaluationView *view = [[GGT_ClassFinishedEvaluationView alloc] init];
    self.view = view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
