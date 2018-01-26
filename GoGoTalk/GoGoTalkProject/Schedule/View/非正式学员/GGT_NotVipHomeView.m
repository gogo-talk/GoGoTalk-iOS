//
//  GGT_NotVipHomeView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/26.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_NotVipHomeView.h"

@implementation GGT_NotVipHomeView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

    
    //头部红色背景
    UIView *headRedView = [[UIView alloc]init];
    headRedView.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self addSubview:headRedView];
    
    [headRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.height.mas_equalTo(60);
    }];
    
    
    //大背景图片
    UIImageView *bgImgView = [[UIImageView alloc] init];
    bgImgView.image = UIIMAGE_FROM_NAME(@"kb_feixhengshi_beijing");
    [self addSubview:bgImgView];
    
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(1);
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.height.mas_equalTo(487);
    }];
    
    
    UILabel *titleLabel1 = [[UILabel alloc] init];
    titleLabel1.textColor = UICOLOR_FROM_HEX(Color333333);
    titleLabel1.text = @"青少英语在线外教1对1体验课";
    titleLabel1.textAlignment = NSTextAlignmentCenter;
    titleLabel1.font = Font(16);
    [bgImgView addSubview:titleLabel1];
    
    [titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_top).with.offset(150);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    
    UILabel *titleLabel2 = [[UILabel alloc] init];
    titleLabel2.textColor = UICOLOR_FROM_HEX(Color333333);
    titleLabel2.text = @"及专业英语水平测试报告";
    titleLabel2.textAlignment = NSTextAlignmentCenter;
    titleLabel2.font = Font(14);
    [bgImgView addSubview:titleLabel2];
    
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel1.mas_bottom).with.offset(margin15);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    
    
    //图片
    UIImageView *shalouImgView = [UIImageView new];
    shalouImgView.image = UIIMAGE_FROM_NAME(@"kb_feixhengshi_dengdaizhong");
    [bgImgView addSubview:shalouImgView];
    
    [shalouImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.top.equalTo(titleLabel2.mas_bottom).with.offset(85);
        make.size.mas_equalTo(CGSizeMake(35, 42));
    }];
    
    
    UILabel *titleLabel3 = [[UILabel alloc] init];
    titleLabel3.textColor = UICOLOR_FROM_HEX(0x4D4D4D);
    titleLabel3.text = @"课程顾问会及时联系您安排体验课";
    titleLabel3.textAlignment = NSTextAlignmentCenter;
    titleLabel3.font = Font(14);
    [bgImgView addSubview:titleLabel3];
    
    [titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shalouImgView.mas_bottom).with.offset(19);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(14);
    }];


    
    UIImageView *wenhaoImgView = [UIImageView new];
    wenhaoImgView.image = UIIMAGE_FROM_NAME(@"kb_feixhengshi_yiwen");
    [bgImgView addSubview:wenhaoImgView];

    [wenhaoImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel3.mas_bottom).with.offset(19);
        make.left.equalTo(bgImgView.mas_left).with.offset(55);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    
    UILabel *titleLabel4 = [[UILabel alloc] init];
    titleLabel4.textColor = UICOLOR_FROM_HEX(Color999999);
    titleLabel4.text = @"如有疑问，请拨打电话：400-8787-276";
    titleLabel4.textAlignment = NSTextAlignmentCenter;
    titleLabel4.font = Font(12);
    [bgImgView addSubview:titleLabel4];
    
    [titleLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel3.mas_bottom).with.offset(19);
        make.left.equalTo(wenhaoImgView.mas_right).with.offset(6);
        make.height.mas_equalTo(12);
    }];
    
    
    self.kechengtixiButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.kechengtixiButton setTitle:@"课程体系" forState:(UIControlStateNormal)];
    [self.kechengtixiButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.kechengtixiButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.kechengtixiButton];
    
    
    [self.kechengtixiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel4.mas_bottom).with.offset(24);
        make.right.equalTo(bgImgView.mas_centerX).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(89, 34));
    }];
    
    
    self.shizifuwuButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.shizifuwuButton setTitle:@"师资服务" forState:(UIControlStateNormal)];
    [self.shizifuwuButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.shizifuwuButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.shizifuwuButton];
    
    
    [self.shizifuwuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel4.mas_bottom).with.offset(24);
        make.left.equalTo(bgImgView.mas_centerX).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(89, 34));
    }];
    
}


-(void)drawRect:(CGRect)rect {
    [self.kechengtixiButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    [self.kechengtixiButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:17];
    
    [self.shizifuwuButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    [self.shizifuwuButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:17];
}
@end
