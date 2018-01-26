//
//  GGT_DetailsOfTeacherViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_DetailsOfTeacherViewController.h"
#import "GGT_TeacherDetailHeaderView.h"

@interface GGT_DetailsOfTeacherViewController ()
@property (nonatomic, strong) GGT_TeacherDetailHeaderView *teacherDetailHeaderView;
@end

@implementation GGT_DetailsOfTeacherViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"外教详情";
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

    
    self.teacherDetailHeaderView = [[GGT_TeacherDetailHeaderView alloc] init];
    [self.teacherDetailHeaderView.guanzhuButton addTarget:self action:@selector(guanzhuButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    self.teacherDetailHeaderView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self.view addSubview:self.teacherDetailHeaderView];
    
    [self.teacherDetailHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    
    
}

- (void)guanzhuButtonClick {
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
