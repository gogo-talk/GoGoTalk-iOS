//
//  GGT_UserInfo.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/4.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_UserInfo.h"

@interface GGT_UserInfo()
/**
个人信息
 */
// 头像
@property (nonatomic, strong) UIImageView *iconImgView;
//英文名
@property (nonatomic, strong) UILabel *enNameLabel;
//性别
@property (nonatomic, strong) UIImageView *genterImgView;
//年龄
@property (nonatomic, strong) UILabel *ageNumLabel;
//等级
@property (nonatomic, strong) UILabel *levelLabel;
//奖杯图片
@property (nonatomic, strong) UIImageView *gitImgView;
//奖杯数量
@property (nonatomic, strong) UILabel *gitNumLabel;
//建议提醒
@property (nonatomic, strong) UILabel *suggestLabel;
//退费中
@property (nonatomic, strong) UILabel *refundIngLabel;
//进入图片
@property (nonatomic, strong) UIImageView *enterImgView;


/**
 上课信息
 */
@property (nonatomic, strong) UIView *classInfoView;





@end


@implementation GGT_UserInfo
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}


- (void)initUI {
#pragma mark 1.userInfoView：高度和图片需要改 2.self.iconImgView pic 3.self.genterImgView pic h 4.
    self.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    
    //背景
    UIImageView *userInfoView = [UIImageView new];
    userInfoView.image = UIIMAGE_FROM_NAME(@"beijing_wode_top");
    [self addSubview:userInfoView];
    
    
    [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.height.mas_equalTo(LineH(176));
    }];
    
    
    //头像
    self.iconImgView = [UIImageView new];
    self.iconImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [userInfoView addSubview:self.iconImgView];

    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_top).with.offset(LineY(8.5));
        make.left.equalTo(userInfoView.mas_left).with.offset(LineX(20));
        make.size.mas_equalTo(CGSizeMake(LineH(65), LineH(65)));
    }];


    //英文名
    self.enNameLabel = [[UILabel alloc] init];
    self.enNameLabel.text = @"Ruihuay";
    self.enNameLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.enNameLabel.font = Font(16);
    [userInfoView addSubview:self.enNameLabel];

    [self.enNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView.mas_top).with.offset(LineY(7.5));
        make.left.equalTo(self.iconImgView.mas_right).with.offset(LineX(10));
        make.height.mas_equalTo(LineH(17));
    }];


    //性别
    self.genterImgView = [UIImageView new];
     self.genterImgView.image = UIIMAGE_FROM_NAME(@"vip_wode");
    [userInfoView addSubview:self.genterImgView];

    [self.genterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.enNameLabel.mas_bottom);
        make.left.equalTo(self.enNameLabel.mas_right).with.offset(LineX(10));
        make.size.mas_equalTo(CGSizeMake(LineW(20), LineH(15)));
    }];



    //年龄
    self.ageNumLabel = [[UILabel alloc] init];
    self.ageNumLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.ageNumLabel.text = @"16 岁";
    self.ageNumLabel.font = Font(12);
    [userInfoView addSubview:self.ageNumLabel];

    [self.ageNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.enNameLabel.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(self.enNameLabel.mas_left);
        make.height.mas_equalTo(LineH(15));
    }];


    //等级
    self.levelLabel = [[UILabel alloc] init];
    self.levelLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.levelLabel.text = @"LV 10";
    self.levelLabel.font = Font(12);
    [userInfoView addSubview:self.levelLabel];

    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageNumLabel.mas_top);
        make.left.equalTo(self.ageNumLabel.mas_right).with.offset(LineX(20));
        make.height.mas_equalTo(LineH(15));
    }];


    //奖杯图片
    self.gitImgView = [UIImageView new];
    self.gitImgView.image = UIIMAGE_FROM_NAME(@"vip_wode");
    [userInfoView addSubview:self.gitImgView];

    [self.gitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.levelLabel.mas_right).with.offset(LineX(20));
        make.bottom.equalTo(self.levelLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(LineW(36), LineH(24)));
    }];


    //奖杯数量
    self.gitNumLabel = [[UILabel alloc] init];
    self.gitNumLabel.textColor = UICOLOR_FROM_HEX(0xEFB637);
    self.gitNumLabel.text = @"X230";
    self.gitNumLabel.font = Font(12);
    [userInfoView addSubview:self.gitNumLabel];

    [self.gitNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.gitImgView.mas_centerY);
        make.left.equalTo(self.gitImgView.mas_right).with.offset(LineX(5));
        make.height.mas_equalTo(LineH(15));
    }];


    //建议提醒
    self.suggestLabel = [[UILabel alloc] init];
    self.suggestLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.suggestLabel.text = @"建议至少每周上3次课";
    self.suggestLabel.font = Font(11);
    [userInfoView addSubview:self.suggestLabel];

    [self.suggestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageNumLabel.mas_bottom).with.offset(LineX(10));
        make.left.equalTo(self.ageNumLabel.mas_left);
        make.height.mas_equalTo(LineH(15));
    }];


    //进入图片
    self.enterImgView = [UIImageView new];
    self.enterImgView.image = UIIMAGE_FROM_NAME(@"jinru_wode_liebiao");
    [userInfoView addSubview:self.enterImgView];

    [self.enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(userInfoView.mas_right).with.offset(-LineX(20));
        make.top.equalTo(userInfoView.mas_top).with.offset(LineY(40));
        make.size.mas_equalTo(CGSizeMake(LineW(7), LineH(12)));
    }];

    
    //退费中
    self.refundIngLabel = [[UILabel alloc] init];
    self.refundIngLabel.textColor = UICOLOR_RANDOM_COLOR();
    self.refundIngLabel.text = @"退费中";
    self.refundIngLabel.textAlignment = NSTextAlignmentCenter;
    self.refundIngLabel.font = Font(11);
    self.refundIngLabel.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [userInfoView addSubview:self.refundIngLabel];
    
    [self.refundIngLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_top).with.offset(LineX(35));
        make.right.equalTo(self.enterImgView.mas_left).with.offset(-LineX(30));
        make.size.mas_equalTo(CGSizeMake(LineW(50), LineH(24)));
    }];
   
}



- (void)drawRect:(CGRect)rect {
    [self.iconImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(32.5)];
    [self.iconImgView addBorderForViewWithBorderWidth:LineW(2.5) BorderColor:UICOLOR_FROM_HEX(ColorCF131B) CornerRadius:LineH(32.5)];
    
    [self.refundIngLabel xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(12)];
}

@end
