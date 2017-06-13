//
//  BaseViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "BaseViewController.h"
#import "GGT_MineViewController.h"


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航颜色
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_HEX(kThemeColor);
    //设置导航不透明
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:Font(19),NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
}



#pragma mark 左侧返回按钮
- (void)setLeftBackButton{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanhui_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = - LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
    //解决手势问题
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
}

#pragma mark 左侧返回按钮---带图片
- (void)setLeftItem:(NSString *)imageName
{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = - LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
}

#pragma mark 右侧按钮---文字
- (void)setRightBarButtonItemTitle:(NSString *)title{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:title forState:UIControlStateNormal];
    [rightBtn setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, LineW(44), LineH(44));
    rightBtn.titleLabel.font = Font(16);
    rightBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    [rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = - LineX(5);
    self.navigationItem.rightBarButtonItems = @[spacer,rightItem];
}

#pragma mark 右侧按钮---图片
- (void)setRightButtonWithImg:(NSString *)imageName{
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    UIBarButtonItem *navSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    navSpace.width = - LineX(5);
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:navSpace,imageItem, nil];
    
}

- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightAction{
}



#pragma mark 进入到个人中心
- (void)initMineController {
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"wode_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(mineClick)];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -LineX(5);
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
    
}


- (void)mineClick {
    GGT_MineViewController *mineVc = [[GGT_MineViewController alloc]init];
    mineVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:mineVc animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
