//
//  GGT_ScheduleViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleViewController.h"
//非正式学员
#import "GGT_NotVipHomeView.h"
#import "GGT_LessonDaishangView.h" //体验课待上
#import "GGT_EvaluationReportView.h" //测评报告



//正式学员


@interface GGT_ScheduleViewController ()
@end

@implementation GGT_ScheduleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];

//    GGT_NotVipHomeView *view = [[GGT_NotVipHomeView alloc] init];
//    [self.view addSubview:view];
//
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view.mas_top).with.offset(0);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
//    }];
    
    
    
//    GGT_LessonDaishangView *view = [[GGT_LessonDaishangView alloc] init];
//    [self.view addSubview:view];
//
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view.mas_top).with.offset(0);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
//    }];
    
    
//    GGT_EvaluationReportView *view = [[GGT_EvaluationReportView alloc] init];
//    [self.view addSubview:view];
//
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view.mas_top).with.offset(0);
//        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
//    }];
    
    
    
}


#pragma mark 导航
- (void)setNav {
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"课表";
    
    //隐藏导航下的黑线
    [self.navigationController.navigationBar  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    [self setRightButtonWithImg:@"kb_feixhengshi_kefu"];
}



@end
