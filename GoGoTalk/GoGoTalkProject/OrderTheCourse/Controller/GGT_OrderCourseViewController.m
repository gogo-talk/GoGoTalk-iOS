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

@end

@implementation GGT_OrderCourseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initSegmentedControl];

    [self setUpNewController];

}

- (void)setUpNewController {
    self.allVC = [[GGT_OrderCourseOfAllViewController alloc] init];
    [self.allVC.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-49)];
    [self addChildViewController:self.allVC];
    
    self.focusVc = [[GGT_OrderCourseOfFocusViewController alloc] init];
    [self.focusVc.view setFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-49)];
    
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
    //先生成存放标题的数据
    NSArray *array = [NSArray arrayWithObjects:@"全部",@"关注", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segment.frame = CGRectMake((SCREEN_WIDTH()-100)/2, 10, 100, 30);
    //控件渲染色(也就是外观字体颜色)
    segment.tintColor = [UIColor redColor];
    segment.layer.borderColor = [UIColor whiteColor].CGColor;
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    //添加到视图
    [self.navigationController.navigationBar addSubview:segment];
    
}

//点击不同分段就会有不同的事件进行相应
-(void)change:(UISegmentedControl *)sender{
    if (sender.selectedSegmentIndex == 0) {
        //  点击处于当前页面的按钮,直接跳出
        if (self.currentVC == self.allVC) {
            return;
        } else {
            [self replaceController:self.currentVC newController:self.allVC];
        }
    
    }else if (sender.selectedSegmentIndex == 1){
        if (self.currentVC == self.focusVc) {
            return;
        } else {
            [self replaceController:self.currentVC newController:self.focusVc];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
