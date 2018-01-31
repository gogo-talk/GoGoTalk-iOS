//
//  GGT_LessonDaishangView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/26.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_LessonDaishangView.h"

@interface GGT_LessonDaishangView ()
//开课时间
@property (nonatomic, strong) UILabel *startTimeLabel;
//头像
@property (nonatomic, strong) UIImageView *touxiangImgView;
//老师姓名
@property (nonatomic, strong) UILabel *teacherNameLabel;
//课程名称[体验课]
@property (nonatomic, strong) UILabel *kechengNameLabel;
@end

@implementation GGT_LessonDaishangView
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
    bgImgView.image = UIIMAGE_FROM_NAME(@"kb-tiyanke-daishang-bj");
    [self addSubview:bgImgView];
    
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(1);
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.height.mas_equalTo(507);
    }];
    
    
    UIImageView *topImgView = [[UIImageView alloc] init];
    topImgView.image = UIIMAGE_FROM_NAME(@"kb-tiyankedaishang-bj");
    [bgImgView addSubview:topImgView];
    
    [topImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_top).with.offset(0);
        make.left.equalTo(bgImgView.mas_left).with.offset(0);
        make.right.equalTo(bgImgView.mas_right).with.offset(-0);
        make.height.mas_equalTo(95);
    }];
    
    
    
    //开课时间
    self.startTimeLabel = [[UILabel alloc] init];
    self.startTimeLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.startTimeLabel.text = @"04月17日（周三）13：00 开课";
    [self.startTimeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    self.startTimeLabel.textAlignment = NSTextAlignmentCenter;
    [bgImgView addSubview:self.startTimeLabel];
    
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_top).with.offset(23);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(15);
    }];
    
    
    
    //头像
    self.touxiangImgView = [[UIImageView alloc] init];
    self.touxiangImgView.image = UIIMAGE_FROM_NAME(@"default-avatar");
    [bgImgView addSubview:self.touxiangImgView];
    
    [self.touxiangImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(margin15);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(74, 74));
    }];
    
    
    
    //老师姓名
    self.teacherNameLabel = [[UILabel alloc] init];
    self.teacherNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.teacherNameLabel.text = @"Ruisun";
    self.teacherNameLabel.textAlignment = NSTextAlignmentCenter;
    self.teacherNameLabel.font = SystemFont(16);
    [bgImgView addSubview:self.teacherNameLabel];
    
    [self.teacherNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.touxiangImgView.mas_bottom).with.offset(margin10);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    
    //课程名称[体验课]
    self.kechengNameLabel = [[UILabel alloc] init];
    self.kechengNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.kechengNameLabel.text = @"Lesson1-1 [体验课]";
    self.kechengNameLabel.textAlignment = NSTextAlignmentCenter;
    self.kechengNameLabel.font = SystemFont(16);
    
    NSMutableAttributedString * mutableAttriStr = [[NSMutableAttributedString alloc] initWithString:@"Lesson1-1 [体验课]"];
    if ([@"Lesson1-1 [体验课]" containsString:@"[体验课]"]) {
        NSRange rang = [@"Lesson1-1 [体验课]" rangeOfString:@"[体验课]"];
        [mutableAttriStr addAttribute:NSForegroundColorAttributeName value:UICOLOR_FROM_HEX(0xFFBA00) range:NSMakeRange(rang.location,rang.length)];
    }
    self.kechengNameLabel.attributedText = mutableAttriStr;
    
    [bgImgView addSubview:self.kechengNameLabel];
    
    [self.kechengNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teacherNameLabel.mas_bottom).with.offset(11);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    
    
    /*----------------这部分需要隐藏或者展示-----------*/
    /*----------------1.体验课待上-------------------*/
    
    //进入教室
    self.enterClassButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.enterClassButton setTitle:@"进入教室" forState:(UIControlStateNormal)];
    [self.enterClassButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.enterClassButton.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.enterClassButton.titleLabel.font = SystemFont(17);
    [bgImgView addSubview:self.enterClassButton];
    
    
    [self.enterClassButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kechengNameLabel.mas_bottom).with.offset(21);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 39));
    }];
    
    
    //课前预习
    self.keqianyuxiButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.keqianyuxiButton setTitle:@"课前预习" forState:(UIControlStateNormal)];
    [self.keqianyuxiButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.keqianyuxiButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.keqianyuxiButton.titleLabel.font = SystemFont(17);
    [bgImgView addSubview:self.keqianyuxiButton];
    
    
    [self.keqianyuxiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.enterClassButton.mas_bottom).with.offset(margin20);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 39));
    }];
    
    
    //上课须知
    self.classxuzhiButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.classxuzhiButton setTitle:@"上课须知" forState:(UIControlStateNormal)];
    [self.classxuzhiButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.classxuzhiButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.classxuzhiButton.titleLabel.font = SystemFont(17);
    [bgImgView addSubview:self.classxuzhiButton];
    
    
    [self.classxuzhiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.keqianyuxiButton.mas_bottom).with.offset(margin20);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 39));
    }];
    
    self.enterClassButton.hidden = YES;
    self.keqianyuxiButton.hidden = YES;
    self.classxuzhiButton.hidden = YES;
    /*----------------2.体验课缺席-------------------*/
    //提醒文字
    self.alertLabel = [[UILabel alloc] init];
    self.alertLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.alertLabel.text = [@"您没有出席本次预约课，如果需要重新预约\n请联系我们！" stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    [self.alertLabel changeLineSpaceWithSpace:5];
    self.alertLabel.textAlignment = NSTextAlignmentCenter;
    self.alertLabel.numberOfLines = 0;
    self.alertLabel.font = SystemFont(14);
    [bgImgView addSubview:self.alertLabel];
    
    [self.alertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kechengNameLabel.mas_bottom).with.offset(21);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    
    //电话文字
    self.phoneNumLabel = [[UILabel alloc] init];
    self.phoneNumLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.phoneNumLabel.text = @"客服电话：400-8787-276";
    self.phoneNumLabel.textAlignment = NSTextAlignmentCenter;
    self.phoneNumLabel.font = SystemFont(14);
    [bgImgView addSubview:self.phoneNumLabel];
    
    [self.phoneNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.alertLabel.mas_bottom).with.offset(35);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(14);
    }];
    
    
    //拨打电话
    self.bodadianhuaButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.bodadianhuaButton setTitle:@"拨打电话" forState:(UIControlStateNormal)];
    [self.bodadianhuaButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.bodadianhuaButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.bodadianhuaButton.titleLabel.font = SystemFont(17);
    [bgImgView addSubview:self.bodadianhuaButton];
    
    
    [self.bodadianhuaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneNumLabel.mas_bottom).with.offset(margin15);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 39));
    }];
    /*----------------以上部分需要隐藏或者展示----------------*/
    
    
    
    
    
    /*----------------底部信息----------------*/
    UIImageView *footerImgView1 = [UIImageView new];
    footerImgView1.image = UIIMAGE_FROM_NAME(@"kb-icon-diannao");
    [bgImgView addSubview:footerImgView1];
    
    [footerImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_bottom).with.offset(-70);
        make.left.equalTo(bgImgView.mas_left).with.offset(25);
        make.size.mas_equalTo(CGSizeMake(14, 14));
    }];
    
    
    UILabel *footerLabel1 = [[UILabel alloc] init];
    footerLabel1.textColor = UICOLOR_FROM_HEX(Color666666);
    footerLabel1.text = @"电脑上课，请登录官网 \"www.gogo-talk.com\"";
    footerLabel1.textAlignment = NSTextAlignmentCenter;
    footerLabel1.font = SystemFont(13);
    [bgImgView addSubview:footerLabel1];
    
    [footerLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerImgView1.mas_centerY);
        make.left.equalTo(footerImgView1.mas_right).with.offset(10);
        make.height.mas_equalTo(13);
    }];
    
    
    UIImageView *footerImgView2 = [UIImageView new];
    footerImgView2.image = UIIMAGE_FROM_NAME(@"kb-icon-iPad");
    [bgImgView addSubview:footerImgView2];
    
    [footerImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(footerImgView1.mas_bottom).with.offset(11);
        make.left.equalTo(bgImgView.mas_left).with.offset(25);
        make.size.mas_equalTo(CGSizeMake(13, 15.5));
    }];
    
    
    UILabel *footerLabel2 = [[UILabel alloc] init];
    footerLabel2.textColor = UICOLOR_FROM_HEX(Color666666);
    footerLabel2.text = @"iPad上课，请在App Store 下载 \"GoGo英语HD\"";
    footerLabel2.textAlignment = NSTextAlignmentCenter;
    footerLabel2.font = SystemFont(13);
    [bgImgView addSubview:footerLabel2];
    
    [footerLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(footerImgView2.mas_centerY);
        make.left.equalTo(footerImgView2.mas_right).with.offset(10);
        make.height.mas_equalTo(13);
    }];
}


-(void)drawRect:(CGRect)rect {
    [self.touxiangImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:37];
    [self.touxiangImgView addBorderForViewWithBorderWidth:2 BorderColor:UICOLOR_FROM_HEX(0xFFBA00) CornerRadius:37];
    
    [self.enterClassButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:19.5];
    
    [self.keqianyuxiButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:19.5];
    [self.keqianyuxiButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:19.5];
    
    [self.classxuzhiButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:19.5];
    [self.classxuzhiButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:19.5];
    
    [self.bodadianhuaButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:19.5];
    [self.bodadianhuaButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:19.5];
}

@end
