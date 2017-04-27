//
//  GGT_NewFeatherViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_NewFeatherViewController.h"
#import "GGT_LoginViewController.h"

#define NEWVIEWCOUNT 3

@interface GGT_NewFeatherViewController () <UIScrollViewDelegate>

@end

@implementation GGT_NewFeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addScrollView];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)addScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width*NEWVIEWCOUNT, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.bounces = NO;
    CGFloat w = self.view.frame.size.width;
    CGFloat h =self.view.frame.size.height;
    
    for (int i = 0; i<NEWVIEWCOUNT; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.userInteractionEnabled = YES;
        CGFloat x = i*w;
        imageView.frame = CGRectMake(x, 0, w, h);
        NSString *imageName = [NSString stringWithFormat:@"引导页%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView];
        if (i == NEWVIEWCOUNT - 1) {
            if (i == 2) {
                //添加button
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                
                [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
                [btn setTitle:@"立即体验" forState:UIControlStateNormal];
                [btn setTitleColor:MainColor forState:UIControlStateNormal];
                btn.layer.masksToBounds = YES;
                btn.layer.cornerRadius = 4;
                btn.layer.borderWidth = 0.5;
                btn.layer.borderColor = MainColor.CGColor;
                [imageView addSubview:btn];
                [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.mas_equalTo(imageView.mas_bottom).with.offset(GGTFrom_X(-50));
                    make.size.mas_equalTo(CGSizeMake(358/2, 40));
                    make.centerX.mas_equalTo(imageView.mas_centerX);
                }];
            }
            [scrollView addSubview:imageView];
        }
    }
    [self.view addSubview:scrollView];
}

- (void)btnAction:(UIButton *)btn {
    
    GGT_LoginViewController *userLoginVc = [[GGT_LoginViewController alloc] init];
    UINavigationController *mainVc = [[UINavigationController alloc]initWithRootViewController:userLoginVc];
    self.view.window.rootViewController = mainVc;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
