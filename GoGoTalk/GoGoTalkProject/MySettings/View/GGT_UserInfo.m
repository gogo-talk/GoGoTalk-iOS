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
@property (nonatomic, strong) UIImageView *tuifeiImgView;
//进入图片
@property (nonatomic, strong) UIImageView *enterImgView;


/**
 上课信息
 */
@property (nonatomic, strong) UIImageView *classInfoView;
//累计上课
@property (nonatomic, strong) UILabel *shangkeLabel;
//迟到
@property (nonatomic, strong) UILabel *laterLabel;
//缺席
@property (nonatomic, strong) UILabel *quexiLabel;
@end


@implementation GGT_UserInfo
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}

- (void)initUI {
    self.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

    //背景
    UIImageView *userInfoView = [UIImageView new];
    userInfoView.image = UIIMAGE_FROM_NAME(@"beijing-biaoqianlan");
    [self addSubview:userInfoView];
    
    
    [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.height.mas_equalTo(171);
    }];
    
    
    /*************个人信息****************/
    //头像
    self.iconImgView = [UIImageView new];
    self.iconImgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [userInfoView addSubview:self.iconImgView];

    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfoView.mas_top).with.offset(8.5);
        make.left.equalTo(userInfoView.mas_left).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(65, 65));
    }];


    //英文名
    self.enNameLabel = [[UILabel alloc] init];
    self.enNameLabel.text = @"Ruihua";
    self.enNameLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.enNameLabel.font = Font(16);
    [userInfoView addSubview:self.enNameLabel];

    [self.enNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImgView.mas_top).with.offset(7.5);
        make.left.equalTo(self.iconImgView.mas_right).with.offset(10);
        make.height.mas_equalTo(17);
    }];


    //性别 xingbie-xueyuan-nan  xingbie-xueyuan-nv
    self.genterImgView = [UIImageView new];
     self.genterImgView.image = UIIMAGE_FROM_NAME(@"xingbie-xueyuan-nan");
    [userInfoView addSubview:self.genterImgView];

    [self.genterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.enNameLabel.mas_bottom);
        make.left.equalTo(self.enNameLabel.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(19,14));
    }];



    //年龄
    self.ageNumLabel = [[UILabel alloc] init];
    self.ageNumLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.ageNumLabel.text = @"16岁";
    self.ageNumLabel.font = Font(12);
    [userInfoView addSubview:self.ageNumLabel];

    [self.ageNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.enNameLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.enNameLabel.mas_left);
        make.height.mas_equalTo(15);
    }];


    //等级
    self.levelLabel = [[UILabel alloc] init];
    self.levelLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.levelLabel.text = @"LV 10";
    self.levelLabel.font = Font(12);
    [userInfoView addSubview:self.levelLabel];

    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageNumLabel.mas_top);
        make.left.equalTo(self.ageNumLabel.mas_right).with.offset(20);
        make.height.mas_equalTo(15);
    }];


    //奖杯图片
    self.gitImgView = [UIImageView new];
    self.gitImgView.image = UIIMAGE_FROM_NAME(@"icon-jiangbei");
    [userInfoView addSubview:self.gitImgView];

    [self.gitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.levelLabel.mas_right).with.offset(20);
        make.bottom.equalTo(self.levelLabel.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(15, 14));
    }];


    //奖杯数量
    self.gitNumLabel = [[UILabel alloc] init];
    self.gitNumLabel.textColor = UICOLOR_FROM_HEX(0xEFB637);
    self.gitNumLabel.text = @"x230";
    self.gitNumLabel.font = Font(12);
    [userInfoView addSubview:self.gitNumLabel];

    [self.gitNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageNumLabel.mas_top);
        make.left.equalTo(self.gitImgView.mas_right).with.offset(3);
        make.height.mas_equalTo(14);
    }];


    //建议提醒
    self.suggestLabel = [[UILabel alloc] init];
    self.suggestLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.suggestLabel.text = @"建议至少每周上3次课";
    self.suggestLabel.font = Font(11);
    [userInfoView addSubview:self.suggestLabel];

    [self.suggestLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ageNumLabel.mas_bottom).with.offset(9);
        make.left.equalTo(self.ageNumLabel.mas_left);
        make.height.mas_equalTo(15);
    }];


    //进入图片
    self.enterImgView = [UIImageView new];
    self.enterImgView.image = UIIMAGE_FROM_NAME(@"icon-gerenxinxijinru");
    [userInfoView addSubview:self.enterImgView];

    [self.enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(userInfoView.mas_right).with.offset(-20);
        make.top.equalTo(userInfoView.mas_top).with.offset(40);
        make.size.mas_equalTo(CGSizeMake(9, 16));
    }];

    
    //退费中
    self.tuifeiImgView = [[UIImageView alloc] init];
    self.tuifeiImgView.image = UIIMAGE_FROM_NAME(@"icon-tuifeizhong");
    [userInfoView addSubview:self.tuifeiImgView];
    
    [self.tuifeiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.enterImgView.mas_centerY);
        make.right.equalTo(self.enterImgView.mas_left).with.offset(-10);
        make.size.mas_equalTo(CGSizeMake(61, 35));
    }];
   
    
    
    /*************上课信息****************/
    self.classInfoView = [[UIImageView alloc]init];
    self.classInfoView.image = UIIMAGE_FROM_NAME(@"beijing-shuju");
    [self addSubview:self.classInfoView];
    
    [self.classInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(userInfoView.mas_left).with.offset(9);
        make.right.equalTo(userInfoView.mas_right).with.offset(-9);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(80);
    }];


    //累计上课
    UIView *shangkeView = [[UIView alloc]init];
    [self.classInfoView addSubview:shangkeView];

    [shangkeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.classInfoView.mas_left).with.offset(0);
        make.top.equalTo(self.classInfoView.mas_top).with.offset(0);
        make.bottom.equalTo(self.classInfoView.mas_bottom).with.offset(-0);
        make.width.mas_equalTo((SCREEN_WIDTH()-20)/3);
    }];



    self.shangkeLabel = [[UILabel alloc] init];
    self.shangkeLabel.textColor = UICOLOR_FROM_HEX(ColorEB5B54);
    self.shangkeLabel.text = @"23";
    self.shangkeLabel.textAlignment = NSTextAlignmentCenter;
    self.shangkeLabel.font = Font(16);
    [shangkeView addSubview:self.shangkeLabel];

    [self.shangkeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(shangkeView.mas_top).with.offset(18);
        make.centerX.equalTo(shangkeView.mas_centerX);
        make.height.mas_equalTo(16);
    }];


    UILabel *shangkeAlertLabel = [[UILabel alloc] init];
    shangkeAlertLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    shangkeAlertLabel.text = @"累计上课(次)";
    shangkeAlertLabel.textAlignment = NSTextAlignmentCenter;
    shangkeAlertLabel.font = Font(11);
    [shangkeView addSubview:shangkeAlertLabel];

    [shangkeAlertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shangkeLabel.mas_bottom).with.offset(10);
        make.centerX.equalTo(shangkeView.mas_centerX);
        make.height.mas_equalTo(11);
    }];




    //两条线
    UIView *linaView1 = [[UIView alloc]init];
    linaView1.backgroundColor =UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.classInfoView addSubview:linaView1];

    [linaView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(shangkeView.mas_right).with.offset(0);
        make.centerY.equalTo(self.classInfoView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(0.5, 40));
    }];


    //迟到
    UIView *laterView = [[UIView alloc]init];
    [self.classInfoView addSubview:laterView];

    [laterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linaView1.mas_right).with.offset(0);
        make.top.equalTo(self.classInfoView.mas_top).with.offset(0);
        make.bottom.equalTo(self.classInfoView.mas_bottom).with.offset(-0);
        make.width.mas_equalTo((SCREEN_WIDTH()-20)/3);
    }];


    UIView *linaView2 = [[UIView alloc]init];
    linaView2.backgroundColor =UICOLOR_FROM_HEX(ColorCCCCCC);
    [self.classInfoView addSubview:linaView2];

    [linaView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(laterView.mas_right).with.offset(0.5);
        make.centerY.equalTo(self.classInfoView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(0.5, 40));
    }];


    self.laterLabel = [[UILabel alloc] init];
    self.laterLabel.textColor = UICOLOR_FROM_HEX(ColorEB5B54);
    self.laterLabel.text = @"5";
    self.laterLabel.textAlignment = NSTextAlignmentCenter;
    self.laterLabel.font = Font(16);
    [laterView addSubview:self.laterLabel];

    [self.laterLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(laterView.mas_top).with.offset(18);
        make.centerX.equalTo(laterView.mas_centerX);
        make.height.mas_equalTo(16);
    }];


    UILabel *laterAlertLabel = [[UILabel alloc] init];
    laterAlertLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    laterAlertLabel.text = @"迟到(次)";
    laterAlertLabel.textAlignment = NSTextAlignmentCenter;
    laterAlertLabel.font = Font(11);
    [laterView addSubview:laterAlertLabel];

    [laterAlertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.laterLabel.mas_bottom).with.offset(10);
        make.centerX.equalTo(laterView.mas_centerX);
        make.height.mas_equalTo(11);
    }];


    //缺席
    UIView *quexiView = [[UIView alloc]init];
    [self.classInfoView addSubview:quexiView];

    [quexiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(linaView2.mas_right).with.offset(0);
        make.top.equalTo(self.classInfoView.mas_top).with.offset(0);
        make.right.equalTo(self.classInfoView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.classInfoView.mas_bottom).with.offset(-0);
    }];



    self.quexiLabel = [[UILabel alloc] init];
    self.quexiLabel.textColor = UICOLOR_FROM_HEX(ColorEB5B54);
    self.quexiLabel.text = @"10";
    self.quexiLabel.textAlignment = NSTextAlignmentCenter;
    self.quexiLabel.font = Font(16);
    [quexiView addSubview:self.quexiLabel];

    [self.quexiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(quexiView.mas_top).with.offset(18);
        make.centerX.equalTo(quexiView.mas_centerX);
        make.height.mas_equalTo(16);
    }];


    UILabel *quexiAlertLabel = [[UILabel alloc] init];
    quexiAlertLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    quexiAlertLabel.text = @"缺席(次)";
    quexiAlertLabel.textAlignment = NSTextAlignmentCenter;
    quexiAlertLabel.font = Font(11);
    [quexiView addSubview:quexiAlertLabel];

    [quexiAlertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.quexiLabel.mas_bottom).with.offset(10);
        make.centerX.equalTo(quexiView.mas_centerX);
        make.height.mas_equalTo(11);
    }];



    self.headerControl = [[UIControl alloc]init];
    [self addSubview:self.headerControl];

    [self.headerControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.height.mas_equalTo(100);
    }];

}


- (void)drawRect:(CGRect)rect {
    [self.iconImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:32.5];
    [self.iconImgView addBorderForViewWithBorderWidth:2.5 BorderColor:UICOLOR_FROM_HEX(ColorCF131B) CornerRadius:32.5];
    
//    [self.refundIngLabel xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(11)];
    
//    self.classInfoView.layer.shadowColor = UICOLOR_FROM_HEX(ColorEB5B54).CGColor;//shadowColor阴影颜色
//    self.classInfoView.layer.shadowOffset = CGSizeMake(0,LineY(2));//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
//    self.classInfoView.layer.shadowOpacity = 0.8;//阴影透明度，默认0
//    self.classInfoView.layer.shadowRadius = LineH(5);//阴影半径，默认3
//    self.classInfoView.layer.cornerRadius = LineH(5);
}

@end
