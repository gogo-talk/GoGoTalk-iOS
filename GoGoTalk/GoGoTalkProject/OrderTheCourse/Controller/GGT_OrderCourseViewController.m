//
//  GGT_OrderCourseViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderCourseViewController.h"
#import "GGT_OrderCourseOfAllViewController.h"
#import "GGT_OrderCourseOfFocusViewController.h"

@interface GGT_OrderCourseViewController ()
@property (nonatomic, strong) GGT_OrderCourseOfAllViewController *allVC;
@property (nonatomic, strong) GGT_OrderCourseOfFocusViewController  *focusVc;
@property (nonatomic, strong) UIViewController *currentVC;

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *animaView;
@end

@implementation GGT_OrderCourseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建导航上的2个切换按钮
    [self initSegmentedControl];
    
    //添加2个子视图
    [self setUpNewController];
}

- (void)setUpNewController {
    self.allVC = [[GGT_OrderCourseOfAllViewController alloc] init];
    [self.allVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
    [self addChildViewController:self.allVC];
    
    self.focusVc = [[GGT_OrderCourseOfFocusViewController alloc] init];
    [self.focusVc.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT() - NAVIGATION_BAR_HEIGHT- TAB_BAR_HEIGHT)];

    //  默认,第一个视图(你会发现,全程就这一个用了addSubview)
    [self.view addSubview:self.allVC.view];
    self.currentVC = self.allVC;
}

//  切换各个标签内容
- (void)replaceController:(UIViewController *)oldController newController:(UIViewController *)newController {
    /*
     transitionFromViewController:toViewController:duration:options:animations:completion:
     *  fromViewController      当前显示在父视图控制器中的子视图控制器
     *  toViewController        将要显示的姿势图控制器
     *  duration                动画时间(这个属性,old friend 了 O(∩_∩)O)
     *  options                 动画效果(渐变,从下往上等等,具体查看API)
     *  animations              转换过程中得动画
     *  completion              转换完成
     */
    
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


- (void)initSegmentedControl {
    //添加到视图
    self.titleView = [[UIView alloc]init];
    self.titleView.frame = CGRectMake((SCREEN_WIDTH()-LineW(185))/2, LineY(6), LineW(185), LineH(32));
    self.navigationItem.titleView = self.titleView;
    
    
    self.animaView = [[UIView alloc]init];
    self.animaView.frame = CGRectMake(0,self.titleView.height-LineH(1), LineW(80), LineH(3));
    self.animaView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.animaView.layer.masksToBounds = YES;
    self.animaView.layer.cornerRadius = LineH(1.5);
    [self.titleView addSubview:self.animaView];
    
    
    
    UIButton *waijiaoButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    waijiaoButton.frame = CGRectMake(0, 0, LineW(80), LineH(32));
    [waijiaoButton setTitle:@"全部外教" forState:(UIControlStateNormal)];
    [waijiaoButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    waijiaoButton.titleLabel.font = Font(16);
    [waijiaoButton addTarget:self action:@selector(changeVc:) forControlEvents:(UIControlEventTouchUpInside)];
    waijiaoButton.tag = 888;
    waijiaoButton.selected = YES;
    [self.titleView addSubview:waijiaoButton];
    
    
    
    UIButton *guanzhuButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    guanzhuButton.frame = CGRectMake(LineW(105), 0, LineW(80), LineH(32));
    [guanzhuButton setTitle:@"我的关注" forState:(UIControlStateNormal)];
    [guanzhuButton setTitleColor:UICOLOR_FROM_HEX(ColorFFCAC7) forState:(UIControlStateNormal)];
    [guanzhuButton addTarget:self action:@selector(changeVc:) forControlEvents:(UIControlEventTouchUpInside)];
    guanzhuButton.tag = 999;
    guanzhuButton.titleLabel.font = Font(16);
    [self.titleView addSubview:guanzhuButton];
}

- (void)changeVc:(UIButton *)button {
    if (button.tag == 888) {
        //  点击处于当前页面的按钮,直接跳出
        if (self.currentVC == self.allVC) {
            return;
        } else {
            [button setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];
            
            UIButton *btn = [self.titleView viewWithTag:999];
            [btn setTitleColor:UICOLOR_FROM_HEX(ColorFFCAC7) forState:(UIControlStateNormal)];
            [button setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
            
            [UIView animateWithDuration:0.3 animations:^{
                self.animaView.frame = CGRectMake(0,self.titleView.height-LineH(1), LineW(80), LineH(3));
            } completion:nil];

        
            [self replaceController:self.currentVC newController:self.allVC];
            
        }
    } else if (button.tag == 999) {
        if (self.currentVC == self.focusVc) {
            return;
        } else {
            [button setTitleColor:[UIColor clearColor] forState:(UIControlStateNormal)];
            
            UIButton *btn = [self.titleView viewWithTag:888];
            [btn setTitleColor:UICOLOR_FROM_HEX(ColorFFCAC7) forState:(UIControlStateNormal)];
            [button setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
            
            
            [UIView animateWithDuration:0.3 animations:^{
                self.animaView.frame = CGRectMake(LineW(105),self.titleView.height-LineH(1), LineW(80), LineH(3));
            } completion:nil];
            
            [self replaceController:self.currentVC newController:self.focusVc];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
