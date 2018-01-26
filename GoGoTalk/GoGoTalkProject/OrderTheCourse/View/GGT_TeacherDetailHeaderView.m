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
    self.backgroundColor = [UIColor clearColor];

    
    //头像
    self.iconImgView = [UIImageView new];
    self.iconImgView.image = UIIMAGE_FROM_NAME(@"default-avatar");
    [self addSubview:self.iconImgView];
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.mas_top).with.offset(margin10);
        make.size.mas_equalTo(CGSizeMake(75, 75));
    }];
    
    
    //英文名
    self.enNameLabel = [[UILabel alloc] init];
    self.enNameLabel.text = @"Ruihua";
    self.enNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.enNameLabel.font = Font(16);
    [self addSubview:self.enNameLabel];
    
    [self.enNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.left.equalTo(self.iconImgView.mas_right).with.offset(margin15);
        make.height.mas_equalTo(17);
    }];
    
    
    //性别
    self.genterImgView = [UIImageView new];
    self.genterImgView.image = UIIMAGE_FROM_NAME(@"icon-waijiao-nv");
    [self addSubview:self.genterImgView];
    
    [self.genterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.enNameLabel.mas_bottom);
        make.left.equalTo(self.enNameLabel.mas_right).with.offset(margin5);
        make.size.mas_equalTo(CGSizeMake(19, 14));
    }];
    
    
    self.guanzhuButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.guanzhuButton setBackgroundImage:UIIMAGE_FROM_NAME(@"icon-guanzhu-da") forState:UIControlStateNormal];
    [self.guanzhuButton setBackgroundImage:UIIMAGE_FROM_NAME(@"icon-guanzhu-da") forState:UIControlStateHighlighted];
    [self addSubview:self.guanzhuButton];
    
    [self.guanzhuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.top.equalTo(self.mas_top).with.offset(35);
        make.size.mas_offset(CGSizeMake(55, 25));
    }];
    
    
    
    //线
    UIView *linaView = [[UIView alloc]init];
    linaView.backgroundColor =UICOLOR_FROM_HEX(ColorE6E6E6);
    [self addSubview:linaView];
    
    [linaView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.top.equalTo(self.mas_top).with.offset(95);
        make.height.mas_equalTo(0.5);
    }];
    
    
    self.tagView = [[UIView alloc]init];
    self.tagView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.tagView];
    
    [self.tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).with.offset(margin15);
        make.top.equalTo(self.genterImgView.mas_bottom).with.offset(7);
        make.right.equalTo(self.guanzhuButton.mas_left).with.offset(-margin10);
        make.bottom.equalTo(linaView.mas_bottom).with.offset(-11);
    }];
  
    
    
    //视频
    self.shipinView = [[UIView alloc]init];
    self.shipinView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.shipinView];

    [self.shipinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin15);
        make.right.equalTo(self.mas_right).with.offset(-margin15);
        make.top.equalTo(linaView.mas_bottom).with.offset(margin15);
        make.height.mas_equalTo(193);
    }];



    
    self.infoScrollView = [[UIScrollView alloc] init];
    self.infoScrollView.contentSize = CGSizeMake(SCREEN_WIDTH()-LineW(30), LineH(1200));
    self.infoScrollView.pagingEnabled = YES;
    self.infoScrollView.showsVerticalScrollIndicator = false;
    self.infoScrollView.showsHorizontalScrollIndicator = false;
    [self addSubview:self.infoScrollView];
    
    [self.infoScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shipinView.mas_bottom).with.offset(margin15);
        make.left.equalTo(self.mas_left).with.offset(margin15);
        make.bottom.equalTo(self.mas_bottom).with.offset(-59);
        make.width.mas_equalTo(SCREEN_WIDTH()-30);
    }];
    
    
    self.infoLabel = [[UILabel alloc] init];
    self.infoLabel.text = @"国家之间都有情报活动，这本是心照不宣的事情。但是美国情报机构采用非法情报手段的尺度是全世界最大的，这是国际社会一项基本共识。美国情报人员蛮横、不择手段，甚至受到美国舆论的推崇，这一价值取向在好莱坞的电影作品里可谓一览无余。中国不是鼓励搞情报可以肆无忌惮的国家。搜集情报可以凌驾于外交大局之上，中国没有这样的政治思维。把海外有点本事的华人都发展成情报线人，开展情报的“人民战争”，这也不是现代中国情报工作的逻辑。我们要说，美国很像在发生抓“中国间谍”和“渗透者”的“大规模群众运动”，他们在搞“以反渗透斗争为纲”。美国这样下去是会闹出很多冤案的，并且让整个华人群体面临有形及无形的压力。这样的舆论倾向将对在美华人的人权客观上造成损害。他们在搞“以反渗透斗争为纲”。美国这样下去是会闹出很多冤案的，并且让整个华人群体面临有形及无形的压力。这样的舆论倾向将对在美华人的人权客观上造成损害。他们在搞“以反渗透斗争为纲”。美国这样下去是会闹出很多冤案的，并且让整个华人群体面临有形及无形的压力。这样的舆论倾向将对在美华人的人权客观上造成损害。他们在搞“以反渗透斗争为纲”。美国这样下去是会闹出很多冤案的，并且让整个华人群体面临有形及无形的压力。这样的舆论倾向将对在美华人的人权客观上造成损害。";
    self.infoLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.infoLabel.font = Font(14);
    self.infoLabel.numberOfLines = 0;
    [self.infoScrollView addSubview:self.infoLabel];

    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoScrollView.mas_top).with.offset(0);
        make.left.equalTo(self.infoScrollView.mas_left).with.offset(0);
        make.width.mas_equalTo(SCREEN_WIDTH()-30);
        //如果想要上下滑动,约束如下
        make.bottom.equalTo(self.infoScrollView.mas_bottom).mas_offset(0);
    }];
    
    
    //按钮view的背景 //为透明度设置渐变效果
    UIView *buttonView = [[UIView alloc]init];
    buttonView.backgroundColor = [UIColor blackColor];

//    UIColor *color1 = [UIColor colorWithRed:(254/255.0)  green:(255/255.0)  blue:(255/255.0)  alpha:0.1];
//    UIColor *color2 = [UIColor colorWithRed:(254/255.0)  green:(255/255.0)  blue:(255/255.0)  alpha:0.4];
//    UIColor *color3 = [UIColor colorWithRed:(254/255.0)  green:(255/255.0)  blue:(255/255.0)  alpha:0.9];
//    NSArray *colors = [NSArray arrayWithObjects:(id)color1.CGColor, color2.CGColor,color3.CGColor, nil];
//    CAGradientLayer *gradient = [CAGradientLayer layer];
//    gradient.colors = colors;
//    //设置开始和结束位置(设置渐变的方向)
//    gradient.startPoint = CGPointMake(0, 1);
//    gradient.endPoint = CGPointMake(0, 0);
//    gradient.frame = CGRectMake(0, 0, SCREEN_WIDTH(), 59);
//    [buttonView.layer insertSublayer:gradient atIndex:0];
    [self addSubview:buttonView];

    [buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(59);
    }];
    
    
    
    
}


- (void)drawRect:(CGRect)rect {
    [self.iconImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:37.5];
    [self.iconImgView addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorE6E6E6) CornerRadius:37.5];
    
    [self.shipinView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:margin10];
    [self.shipinView addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:margin10];
}
@end
