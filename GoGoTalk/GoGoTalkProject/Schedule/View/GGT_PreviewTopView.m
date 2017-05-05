//
//  GGT_PreviewTopView.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_PreviewTopView.h"

static NSString * const xc_cancleButtonTitle = @"取消预约";

@interface GGT_PreviewTopView ()
@property (nonatomic, strong) UILabel *xc_courseNameLabel;
@property (nonatomic, strong) UILabel *xc_teachNameLabel;
@property (nonatomic, strong) UILabel *xc_teachAgeLabel;
@end

@implementation GGT_PreviewTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self == [super initWithFrame:frame]) {
        [self initView];
        [self mas_View];
    }
    return self;
}

- (void)initView
{
    self.xc_headPortraitImgView = ({
        UIImageView *xc_headPortraitImgView = [UIImageView new];
        xc_headPortraitImgView.image = UIIMAGE_FROM_NAME(@"huabi_zhibo_wei");
        xc_headPortraitImgView;
    });
    [self addSubview:self.xc_headPortraitImgView];
    
    self.xc_courseNameLabel = ({
        UILabel *xc_courseNameLabel = [UILabel new];
        xc_courseNameLabel.text = @"hello world";
        xc_courseNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_courseNameLabel.font = Font(12);
        xc_courseNameLabel;
    });
    [self addSubview:self.xc_courseNameLabel];
    
    self.xc_teachNameLabel = ({
        UILabel *xc_teachNameLabel = [UILabel new];
        xc_teachNameLabel.text = @"hello world";
        xc_teachNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_teachNameLabel.font = Font(11);
        xc_teachNameLabel;
    });
    [self addSubview:self.xc_teachNameLabel];
    
    self.xc_teachAgeLabel = ({
        UILabel *xc_teachAgeLabel = [UILabel new];
        xc_teachAgeLabel.text = @"hello world";
        xc_teachAgeLabel.textColor = UICOLOR_FROM_RGB_ALPHA(0, 0, 0, 0.7);
        xc_teachAgeLabel.font = Font(10);
        xc_teachAgeLabel;
    });
    [self addSubview:self.xc_teachAgeLabel];
    
    self.xc_cancleButton = ({
        UIButton *xc_cancleButton = [UIButton new];
        [xc_cancleButton setTitle:xc_cancleButtonTitle forState:UIControlStateNormal];
        xc_cancleButton.titleLabel.font = Font(10);
        [xc_cancleButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:UIControlStateNormal];
        xc_cancleButton;
    });
    [self addSubview:self.xc_cancleButton];
}

- (void)mas_View
{
    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin10));
        make.width.height.equalTo(@(LineW(50)));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(LineW(margin10));
        make.top.equalTo(self.xc_headPortraitImgView.mas_top).offset(LineH(margin5));
    }];
    
    [self.xc_teachNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(-LineH(margin5));
        make.left.equalTo(self.xc_courseNameLabel.mas_left);
    }];
    
    [self.xc_teachAgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_teachNameLabel.mas_right).offset(margin15);
        make.centerY.equalTo(self.xc_teachNameLabel);
    }];
    
    [self.xc_cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-LineW(margin10));
        make.height.equalTo(@(LineH(24)));//48 × 108
        make.width.equalTo(@(LineW(54)));
        make.centerY.equalTo(self.mas_centerY);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.xc_cancleButton addBorderForViewWithBorderWidth:1.0f BorderColor:UICOLOR_FROM_HEX(kThemeColor) CornerRadius:self.xc_cancleButton.height/2.0];
    
}

@end
