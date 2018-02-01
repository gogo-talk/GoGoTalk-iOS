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
#import "GGT_ClassUnFinishedViewController.h"
#import "GGT_ClassFinishedViewController.h"


@interface GGT_ScheduleViewController ()
//未结课
@property (nonatomic, strong) UIButton *weijiekeButton;
//已结课
@property (nonatomic, strong) UIButton *yijiekeButton;
@property (nonatomic, strong) UIView *animaView;



@property (nonatomic, strong) UIView *headerbgView;
@property (nonatomic, strong) GGT_ClassUnFinishedViewController *weiVC;
@property (nonatomic, strong) GGT_ClassFinishedViewController  *yiVc;
@property (nonatomic, strong) UIViewController *currentVC;
@end

@implementation GGT_ScheduleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNav];

    
#pragma mark 非VIP

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
    
#pragma mark VIP
    [self setUpNewController];
    [self initHeaderView];
}

- (void)setUpNewController {
    self.weiVC = [[GGT_ClassUnFinishedViewController alloc] init];
    [self.weiVC.view setFrame:CGRectMake(0,49, SCREEN_WIDTH(), SCREEN_HEIGHT()-49)];
    [self addChildViewController:self.weiVC];
    
    self.yiVc = [[GGT_ClassFinishedViewController alloc] init];
    [self.yiVc.view setFrame:CGRectMake(0, 49, SCREEN_WIDTH(), SCREEN_HEIGHT() - NAVIGATION_BAR_HEIGHT- TAB_BAR_HEIGHT-49)];

    //  默认,第一个视图(你会发现,全程就这一个用了addSubview)
    [self.view addSubview:self.weiVC.view];
    self.currentVC = self.weiVC;
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController {
    
    [self addChildViewController:newController];
    [self transitionFromViewController:oldController toViewController:newController duration:0.3f options:UIViewAnimationOptionTransitionNone animations:nil completion:^(BOOL finished) {
        if (finished) {
            [newController didMoveToParentViewController:self];
            [oldController willMoveToParentViewController:nil];
            [oldController removeFromParentViewController];
            self.currentVC = newController;
        } else {
            self.currentVC = oldController;
        }
    }];
}


- (void)initHeaderView {
    self.headerbgView = [[UIView alloc]init];
    self.headerbgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self.view addSubview:self.headerbgView];
    
    [self.headerbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.height.mas_equalTo(49);
    }];

    
    self.animaView = [[UIView alloc]init];
    self.animaView.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.animaView.layer.masksToBounds = YES;
    self.animaView.layer.cornerRadius = LineH(1.5);
    [self.headerbgView addSubview:self.animaView];
    
    [self.animaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headerbgView.mas_bottom).with.offset(-0);
        make.left.equalTo(self.headerbgView.mas_left).with.offset((SCREEN_WIDTH()/2-LineW(64))/2);
        make.size.mas_equalTo(CGSizeMake(64, 3));
    }];
    
    
    self.weijiekeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.weijiekeButton setTitle:@"未结课(4)" forState:(UIControlStateNormal)];
    [self.weijiekeButton setTitleColor:UICOLOR_FROM_HEX(Color333333) forState:(UIControlStateNormal)];
    self.weijiekeButton.titleLabel.font = SystemFont(16);
    self.weijiekeButton.tag = 888;
    self.weijiekeButton.selected = YES;
    [self.weijiekeButton addTarget:self action:@selector(chooseVc:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headerbgView addSubview:self.weijiekeButton];
    
    [self.weijiekeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.headerbgView);
        make.left.equalTo(self.headerbgView.mas_left).with.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH()/2);
    }];
    
    
    self.yijiekeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.yijiekeButton setTitle:@"已结课(99)" forState:(UIControlStateNormal)];
    [self.yijiekeButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.yijiekeButton.titleLabel.font = SystemFont(16);
    self.yijiekeButton.tag = 999;
    [self.yijiekeButton addTarget:self action:@selector(chooseVc:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.headerbgView addSubview:self.yijiekeButton];
    
    
    [self.yijiekeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.headerbgView);
        make.left.equalTo(self.weijiekeButton.mas_right).with.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH()/2);
    }];
}

- (void)chooseVc:(UIButton *)button {
    if (button.tag == 888) {
          //点击处于当前页面的按钮,直接跳出
        if (self.currentVC == self.weiVC) {
            return;
        } else {
            [button setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];

            UIButton *btn = [self.view viewWithTag:999];
            [btn setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
            [button setTitleColor:UICOLOR_FROM_HEX(Color333333) forState:(UIControlStateNormal)];

            [UIView animateWithDuration:0.3 animations:^{
                [self.animaView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.headerbgView.mas_bottom).with.offset(-0);
                    make.left.equalTo(self.headerbgView.mas_left).with.offset((SCREEN_WIDTH()/2-LineW(64))/2);
                    make.size.mas_equalTo(CGSizeMake(64, 3));
                }];
                
            } completion:nil];


            [self replaceController:self.currentVC newController:self.weiVC];
        }
    } else if (button.tag == 999) {
        if (self.currentVC == self.yiVc) {
            return;
        } else {
            [button setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];

            UIButton *btn = [self.view viewWithTag:888];
            [btn setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
            [button setTitleColor:UICOLOR_FROM_HEX(Color333333) forState:(UIControlStateNormal)];


            [UIView animateWithDuration:0.3 animations:^{
                [self.animaView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self.headerbgView.mas_bottom).with.offset(-0);
                    make.right.equalTo(self.headerbgView.mas_right).with.offset(-(SCREEN_WIDTH()/2-LineW(64))/2);
                    make.size.mas_equalTo(CGSizeMake(64, 3));
                }];
            } completion:nil];

            [self replaceController:self.currentVC newController:self.yiVc];
        }
    }
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
