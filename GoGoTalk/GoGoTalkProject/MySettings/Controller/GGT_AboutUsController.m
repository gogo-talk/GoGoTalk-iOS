//
//  GGT_AboutUsController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/9.
//  Copyright © 2017年 XieHenry. All rights reserved.
// H5制作

#import "GGT_AboutUsController.h"

@interface GGT_AboutUsController ()

@end

@implementation GGT_AboutUsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initLogo];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
-(void)initLogo
{
    UIImageView *logoView = [UIImageView new];
    logoView.image = [UIImage imageNamed:@"AboutUs"];
    [self.view addSubview:logoView];
    [logoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view.mas_top).with.offset(LineY(30));
        
    }];
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
