//
//  GGT_EvaluateView.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_EvaluateView.h"
#import "XCStarView.h"

@interface GGT_EvaluateView ()
@property (nonatomic, strong) UILabel *xc_titleLabel;
@property (nonatomic, strong) UIView *xc_contentView;
@property (nonatomic, strong) UILabel *xc_detailLabel;
@property (nonatomic, strong) XCStarView *xc_starView;
@property (nonatomic, strong) NSArray *xc_evaluateArray;
@property (nonatomic, strong) NSString *xc_title;
@end

@implementation GGT_EvaluateView

- (instancetype)initWithTitle:(NSString *)title evaluateArray:(NSArray *)evaluateArray selectCount:(NSInteger)selectCount
{
    if (self = [super init]) {
        self.xc_evaluateArray = evaluateArray;
        self.xc_title = title;
        self.selectCount = selectCount;
        [self initView];
        [self mas_view];
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH(), self.xc_contentView.bottom);
    }
    return self;
}

#pragma mark - 初始化
- (void)initView
{
    self.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
#pragma mark - 初始化
    // 创建xc_titleLabel
    self.xc_titleLabel = ({
        UILabel *xc_titleLabel = [UILabel new];
        xc_titleLabel.text = self.xc_title;
        xc_titleLabel.textColor = UICOLOR_FROM_HEX(Color666666);
        xc_titleLabel;
    });
    [self addSubview:self.xc_titleLabel];
    
    // 创建xc_contentView
    self.xc_contentView = ({
        UIView *xc_contentView = [UIView new];
        xc_contentView.backgroundColor = [UIColor whiteColor];
        xc_contentView;
    });
    [self addSubview:self.xc_contentView];
    
    // 创建xc_detailLabel
    self.xc_detailLabel = ({
        UILabel *xc_detailLabel = [UILabel new];
        xc_detailLabel.font = Font(16);
        xc_detailLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_detailLabel;
    });
    [self.xc_contentView addSubview:self.xc_detailLabel];
    
    // xc_starView
    @weakify(self);
    self.xc_starView = [[XCStarView alloc] initWithEmptyImage:@"dianping_kebiao_da_wei" StarImage:@"dianping_kebiao_da_yi" totalStarCount:self.xc_evaluateArray.count starMargin:LineW(15) starWidth:LineW(16) selectBlock:^(NSInteger count) {
        @strongify(self);
        [self showDetailLabelTextWithCount:count];
    }];
    self.xc_starView.selectedStatCount = self.selectCount;
    [self.xc_contentView addSubview:self.xc_starView];
    
}

#pragma mark - 布局
- (void)mas_view
{
    // xc_titleLabel
    [self.xc_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin15));
        make.top.equalTo(self).offset(LineH(margin15));
    }];
    
    // xc_contentView
    [self.xc_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_titleLabel.mas_bottom).offset(LineH(6));
        make.left.right.equalTo(self);
        make.height.equalTo(@(LineH(margin44)));
    }];
    
    // xc_detailLabel
    [self.xc_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.xc_contentView);
        make.left.equalTo(self.xc_contentView.mas_left).offset(LineW(margin15));
    }];
    
    // xc_starView
    [self.xc_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_contentView.mas_right).offset(-(LineW(margin15)));
        make.width.equalTo(@(self.xc_starView.width));
        make.height.equalTo(@(self.xc_starView.height));
        make.centerY.equalTo(self.xc_contentView.mas_centerY);
    }];
    
    [self layoutIfNeeded];
}

- (void)showDetailLabelTextWithCount:(NSInteger)count
{
    self.xc_detailLabel.text = self.xc_evaluateArray[count-1];
    self.selectCount = count;
}


- (void)dealloc
{
    NSLog(@"%s", __func__);
}


@end
