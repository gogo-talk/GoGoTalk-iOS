//
//  GGT_PreviewCoursewareVC.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_PreviewCoursewareVC.h"
#import "GGT_PreviewTopView.h"
#import "GGT_PreviewCourseAlertView.h"

#import "GGT_CourseEvaluateVC.h"    // 测试

@interface GGT_PreviewCoursewareVC ()<WKNavigationDelegate>
@property (nonatomic, strong) GGT_PreviewTopView *xc_topView;
@property (nonatomic, strong) WKWebView *xc_webView;
@end

@implementation GGT_PreviewCoursewareVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initAndMASView];
    [self configWebView];
    
    [self initEvent];
    
    
}

- (void)initAndMASView
{
    // 初始化
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
    
    
    // 布局
    [self.xc_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@(LineH(90)));
    }];
    
    [self.xc_webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_topView.mas_bottom).offset(margin10);
        make.left.equalTo(self.view).offset(margin10);
        make.right.equalTo(self.view).offset(-margin10);
        make.bottom.equalTo(self.view);
    }];
    
    [self.view layoutIfNeeded];
}
- (void)configWebView
{
    NSURL *url = [NSURL URLWithString:@"http://baidu.com"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.xc_webView loadRequest:request];
}

- (void)initEvent
{
    @weakify(self);
    [[self.xc_topView.xc_cancleButton rac_signalForControlEvents:UIControlEventTouchUpInside]
     subscribeNext:^(id x) {
         @strongify(self);
//         [self showSystemAlert];
         [self showCustomAlert];
     }];
}

- (void)showSystemAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"title" message:@"message" preferredStyle:UIAlertControllerStyleAlert];
    
    alertController.titleColor = [UIColor orangeColor];
    alertController.messageColor = [UIColor redColor];
    
    UIAlertAction *sureAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    sureAction.textColor = [UIColor orangeColor];
    [alertController addAction:sureAction];

    UIAlertAction *cancleAction = [UIAlertAction actionWithTitle:@"暂不取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    cancleAction.textColor = [UIColor redColor];
    [alertController addAction:cancleAction];
    
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)showCustomAlert
{
    @weakify(self);
    [GGT_PreviewCourseAlertView viewWithTitle:@"即将开课" message:@"时间" cancleBlock:^{
        @strongify(self);
        NSLog(@"---点的是叉号---%@", self);
    } enterBlock:^{
        @strongify(self);
        NSLog(@"---进入教室---消失了---%@", self);
    }];
    
}

- (void)dealloc
{
    NSLog(@"%s", __func__);
}



// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation{
 
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    GGT_CourseEvaluateVC *vc = [GGT_CourseEvaluateVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
