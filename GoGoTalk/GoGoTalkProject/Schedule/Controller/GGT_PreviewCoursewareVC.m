//
//  GGT_PreviewCoursewareVC.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_PreviewCoursewareVC.h"
#import "GGT_PreviewTopView.h"

@interface GGT_PreviewCoursewareVC ()
@property (nonatomic, strong) GGT_PreviewTopView *xc_topView;
@property (nonatomic, strong) WKWebView *xc_webView;
@end

@implementation GGT_PreviewCoursewareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    
    [self initEvent];
}

- (void)initView
{
    self.title = @"时间";
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    self.xc_topView = ({
        GGT_PreviewTopView *xc_topView = [GGT_PreviewTopView new];
        xc_topView.backgroundColor = [UIColor whiteColor];
        xc_topView;
    });
    [self.view addSubview:self.xc_topView];
    
    self.xc_webView = ({
        WKWebView *xc_webView = [[WKWebView alloc] init];
        xc_webView;
    });
    [self.view addSubview:self.xc_webView];
    
    [self.xc_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@90);
    }];
    
    [self.xc_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_topView.mas_bottom).offset(margin10);
        make.left.equalTo(self.view).offset(margin10);
        make.right.equalTo(self.view).offset(-margin10);
        make.bottom.equalTo(self.view);
    }];
}

- (void)initEvent
{
    @weakify(self);
    [[self.xc_topView.xc_cancleButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
//         [self showAlter];
     }];
}

- (void)showAlter
{
    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:@"提示"];
    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 2)];
    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, 2)];
    
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:[alertControllerStr string] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertController addAction:sureAction];

    
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"暂不取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
