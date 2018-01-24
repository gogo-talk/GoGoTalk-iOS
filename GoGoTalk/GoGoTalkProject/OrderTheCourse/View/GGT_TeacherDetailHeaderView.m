//
//  GGT_TeacherDetailHeaderView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/17.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_TeacherDetailHeaderView.h"


@interface GGT_TeacherDetailHeaderView()
// 头像
@property (nonatomic, strong) UIImageView *iconImgView;
//英文名
@property (nonatomic, strong) UILabel *enNameLabel;
//性别
@property (nonatomic, strong) UIImageView *genterImgView;
//标签
@property (nonatomic, strong) UIView *tagView;

//视频
@property (nonatomic, strong) UIView *shipinView;
//文字
@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, strong) UIScrollView *infoScrollView;
@end


@implementation GGT_TeacherDetailHeaderView
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self initUI];
    }
    return self;
}


- (void)initUI {
    self.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

    
    //头像
    self.iconImgView = [UIImageView new];
    self.iconImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.iconImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(10));
        make.size.mas_equalTo(CGSizeMake(LineH(75), LineH(75)));
    }];
    
    
    //英文名
    self.enNameLabel = [[UILabel alloc] init];
    self.enNameLabel.text = @"Ruihua";
    self.enNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.enNameLabel.font = Font(16);
    [self addSubview:self.enNameLabel];
    
    [self.enNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(LineY(15));
        make.left.equalTo(self.iconImgView.mas_right).with.offset(LineX(15));
        make.height.mas_equalTo(LineH(17));
    }];
    
    
    //性别
    self.genterImgView = [UIImageView new];
    self.genterImgView.image = UIIMAGE_FROM_NAME(@"vip_wode");
    [self addSubview:self.genterImgView];
    
    [self.genterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.enNameLabel.mas_bottom);
        make.left.equalTo(self.enNameLabel.mas_right).with.offset(LineX(5));
        make.size.mas_equalTo(CGSizeMake(LineW(20), LineH(15)));
    }];
    
    
    self.guanzhuButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    //   [self.focusButton setImage:UIIMAGE_FROM_NAME(@"jiaguanzhu_yueke") forState:(UIControlStateNormal)];
    self.guanzhuButton.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.guanzhuButton];
    
    [self.guanzhuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(35));
        make.size.mas_offset(CGSizeMake(LineW(55), LineW(25)));
    }];
    
    
    
    //线
    UIView *linaView = [[UIView alloc]init];
    linaView.backgroundColor =UICOLOR_FROM_HEX(ColorE6E6E6);
    [self addSubview:linaView];
    
    [linaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(self.mas_top).with.offset(LineY(95));
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    
    self.tagView = [[UIView alloc]init];
    self.tagView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.tagView];
    
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).with.offset(LineX(15));
        make.top.equalTo(self.genterImgView.mas_bottom).with.offset(LineX(7));
        make.right.equalTo(self.guanzhuButton.mas_left).with.offset(-LineX(10));
        make.bottom.equalTo(linaView.mas_bottom).with.offset(-LineY(11));
    }];
  
    
    
    //视频
    self.shipinView = [[UIView alloc]init];
    self.shipinView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.shipinView];

    [self.shipinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
        make.right.equalTo(self.mas_right).with.offset(-LineX(15));
        make.top.equalTo(linaView.mas_bottom).with.offset(LineY(15));
        make.height.mas_equalTo(LineH(193));
    }];



    
    self.infoScrollView = [[UIScrollView alloc] init];
    self.infoScrollView.contentSize = CGSizeMake(SCREEN_WIDTH()-LineW(30), LineH(1200));
//    self.infoScrollView.backgroundColor = UICOLOR_RANDOM_COLOR();
    self.infoScrollView.pagingEnabled = YES;
    self.infoScrollView.showsVerticalScrollIndicator = false;
    self.infoScrollView.showsHorizontalScrollIndicator = false;
    [self addSubview:self.infoScrollView];
    
    [self.infoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shipinView.mas_bottom).with.offset(LineY(15));
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.width.mas_equalTo(SCREEN_WIDTH()-LineW(30));
    }];
    
    
    self.infoLabel = [[UILabel alloc] init];
    self.infoLabel.text = @"国家之间都有情报活动，这本是心照不宣的事情。但是美国情报机构采用非法情报手段的尺度是全世界最大的，这是国际社会一项基本共识。美国情报人员蛮横、不择手段，甚至受到美国舆论的推崇，这一价值取向在好莱坞的电影作品里可谓一览无余。中国不是鼓励搞情报可以肆无忌惮的国家。搜集情报可以凌驾于外交大局之上，中国没有这样的政治思维。把海外有点本事的华人都发展成情报线人，开展情报的“人民战争”，这也不是现代中国情报工作的逻辑。我们要说，美国很像在发生抓“中国间谍”和“渗透者”的“大规模群众运动”，他们在搞“以反渗透斗争为纲”。美国这样下去是会闹出很多冤案的，并且让整个华人群体面临有形及无形的压力。这样的舆论倾向将对在美华人的人权客观上造成损害。";
    self.infoLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.infoLabel.font = Font(14);
    self.infoLabel.numberOfLines = 0;
    [self.infoScrollView addSubview:self.infoLabel];

    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoScrollView.mas_top).with.offset(0);
        make.left.equalTo(self.infoScrollView.mas_left).with.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH()-LineW(30));
        //如果想要上下滑动,约束如下
        make.bottom.equalTo(self.infoScrollView.mas_bottom).mas_offset(0);
    }];
    
    
    //按钮view的背景
    UIView *buttonView = [[UIView alloc]init];
    buttonView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
//    buttonView.alpha =
    [self addSubview:buttonView];
    
    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(59));
    }];
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = buttonView.bounds;
    //设置渐变颜色数组,可以加透明度的渐变
    gradientLayer.colors = @[(__bridge id)[UIColor colorWithWhite:0 alpha:0.5].CGColor,(__bridge id)[UIColor colorWithWhite:0 alpha:1].CGColor];
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    //gradientLayer.locations = @[@(0.8f)];//设置渐变位置数组
    //注意：这里不用下边的这句话
    //[gradientView.layer addSublayer:gradientLayer];//将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    //设置蒙版，用来改变layer的透明度
    [buttonView.layer setMask:gradientLayer];
    
    
    
}


- (void)drawRect:(CGRect)rect {
    [self.iconImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(37.5)];
    [self.iconImgView addBorderForViewWithBorderWidth:LineW(1) BorderColor:UICOLOR_FROM_HEX(ColorE6E6E6) CornerRadius:LineH(37.5)];
    
    [self.shipinView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(10)];
    [self.shipinView addBorderForViewWithBorderWidth:LineW(1) BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:LineH(10)];
}
@end
