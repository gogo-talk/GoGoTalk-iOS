//
//  GGT_CourseEvaluateVC.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_CourseEvaluateVC.h"
#import "GGT_EvaluateView.h"
#import "PlaceholderTextView.h"


@interface GGT_CourseEvaluateVC ()<UITextViewDelegate>
@property (nonatomic, strong) GGT_EvaluateView *xc_evaTeachView;
@property (nonatomic, strong) GGT_EvaluateView *xc_evaStudentView;
@property (nonatomic, strong) PlaceholderTextView *xc_textView;
@end

@implementation GGT_CourseEvaluateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    [self initView];
}

- (void)initView
{
    NSArray *array1 = @[@"1", @"2", @"3"];
    self.xc_evaTeachView = [[GGT_EvaluateView alloc] initWithTitle:@"hello" evaluateArray:array1 selectCount:array1.count];
    [self.view addSubview:self.xc_evaTeachView];
    [self.xc_evaTeachView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        // 内部子控件已经使用过LineH() 则外部就不再需要使用
        make.height.equalTo(@(self.xc_evaTeachView.height));
    }];
    
    
    NSArray *array2 = @[@"4", @"5", @"6"];
    self.xc_evaStudentView = [[GGT_EvaluateView alloc] initWithTitle:@"world" evaluateArray:array2 selectCount:array2.count];
    [self.view addSubview:self.xc_evaStudentView];
    [self.xc_evaStudentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.equalTo(self.xc_evaTeachView);
        make.top.equalTo(self.xc_evaTeachView.mas_bottom);
    }];
    
    // 创建xc_textView的父view
    UIView *xc_contentView = [UIView new];
    xc_contentView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:xc_contentView];
    
    [xc_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(LineH(121)));
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.xc_evaStudentView.mas_bottom).offset(LineH(margin15));
    }];
    
    // xc_textView
    self.xc_textView = ({
        PlaceholderTextView *xc_textView = [PlaceholderTextView new];
        xc_textView.placeholder = @"hello world";
        xc_textView.placeholderColor = [UIColor orangeColor];
        xc_textView.delegate = self;
        xc_textView;
    });
    [xc_contentView addSubview:self.xc_textView];
    
    [self.xc_textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(xc_contentView).offset(margin10);
        make.right.bottom.equalTo(xc_contentView).offset(-margin10);
    }];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location>=200)
    {
        return  NO;
    }
    else
    {
        return YES;
    }
}


@end
