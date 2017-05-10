//
//  GGT_FeedbackController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/9.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_FeedbackController.h"

@interface GGT_FeedbackController ()

@end

@implementation GGT_FeedbackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationItems];
}
-(void)setNavigationItems
{
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [rightBtn setTintColor:[UIColor whiteColor]];
    rightBtn.frame = CGRectMake(0, 0, 0, 0);
    [rightBtn sizeToFit];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[spacer,rightItem];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
