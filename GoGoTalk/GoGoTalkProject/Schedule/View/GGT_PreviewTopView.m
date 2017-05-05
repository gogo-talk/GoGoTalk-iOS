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
        xc_courseNameLabel.font = Font(14);
        xc_courseNameLabel;
    });
    [self addSubview:self.xc_courseNameLabel];
    
    self.xc_teachNameLabel = ({
        UILabel *xc_teachNameLabel = [UILabel new];
        xc_teachNameLabel.text = @"hello world";
        xc_teachNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_teachNameLabel.font = Font(12);
        xc_teachNameLabel;
    });
    [self addSubview:self.xc_teachNameLabel];
    
    self.xc_cancleButton = ({
        UIButton *xc_cancleButton = [UIButton new];
        [xc_cancleButton setTitle:xc_cancleButtonTitle forState:UIControlStateNormal];
        xc_cancleButton.titleLabel.font = Font(10);
        [xc_cancleButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:UIControlStateNormal];
        [xc_cancleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        xc_cancleButton;
    });
    [self addSubview:self.xc_cancleButton];
}

- (void)mas_View
{
    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin15));
        make.width.height.equalTo(@(LineW(60)));
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(LineW(margin15));
        make.top.equalTo(self.xc_headPortraitImgView.mas_top).offset(LineH(margin15/2.0));
    }];
    
    [self.xc_teachNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(-LineH(margin15/2.0));
        make.left.equalTo(self.xc_courseNameLabel.mas_left);
    }];
    
    [self.xc_cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-LineW(margin15));
        make.width.height.equalTo(@(LineW(19)));//38 × 38
        make.centerY.equalTo(self.mas_centerY);
    }];
}
@end
