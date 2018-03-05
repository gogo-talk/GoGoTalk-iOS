//
//  GGT_ClassFinishedListCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/1.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedListCell.h"

@interface GGT_ClassFinishedListCell()
//内容
@property (nonatomic, strong) UIView *bgcontentView;
//开课时间
@property (nonatomic, strong) UILabel *startTimeLabel;
//开课状态
@property (nonatomic, strong) UILabel *classStatusLabel;
//头像
@property (nonatomic, strong) UIImageView *iconImageView;
//教材名称
@property (nonatomic, strong) UILabel *jiaocaiNameLabel;
//重上
@property (nonatomic, strong) UILabel *chongshangLabel;
//姓名
@property (nonatomic, strong) UILabel *nameLabel;
//奖杯图片
@property (nonatomic, strong) UIImageView *giftImageView;
//奖杯数量
@property (nonatomic, strong) UILabel *giftNumLabel;

//老师缺席，课时已返还
@property (nonatomic, strong) UILabel *fanhuanAlertLabel;
@end

@implementation GGT_ClassFinishedListCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellView];
    }
    return self;
}

- (void)initCellView {
    self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    self.bgcontentView = [[UIView alloc] init];
    self.bgcontentView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self addSubview:self.bgcontentView];
    
    [self.bgcontentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-margin10);
    }];
    
    
    //开课时间
    self.startTimeLabel = [[UILabel alloc]init];
    self.startTimeLabel.text = @"今日（周一） 13：00";
    self.startTimeLabel.font = SystemFont(15);
    self.startTimeLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    [self.bgcontentView addSubview:self.startTimeLabel];
    
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgcontentView.mas_left).with.offset(margin10);
        make.top.equalTo(self.bgcontentView.mas_top).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    //开课状态
    self.classStatusLabel = [[UILabel alloc]init];
    self.classStatusLabel.text = @"迟到";
    self.classStatusLabel.font = SystemFont(12);
    self.classStatusLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self.bgcontentView addSubview:self.classStatusLabel];
    
    [self.classStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgcontentView.mas_right).with.offset(-margin15);
        make.top.equalTo(self.bgcontentView.mas_top).with.offset(margin15);
        make.height.mas_offset(12);
    }];
    
    
    //头像
    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.image = UIIMAGE_FROM_NAME(@"default-avatar");
    [self.bgcontentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgcontentView.mas_left).with.offset(margin10);
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(13);
        make.size.mas_offset(CGSizeMake(LineH(60), LineH(60)));
    }];
    
    
    //教材名称
    self.jiaocaiNameLabel = [[UILabel alloc]init];
    self.jiaocaiNameLabel.text = @"Get Ready 5";
    self.jiaocaiNameLabel.font = SystemFont(16);
    self.jiaocaiNameLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self.bgcontentView addSubview:self.jiaocaiNameLabel];
    
    [self.jiaocaiNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(margin5);
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(margin20);
        make.height.mas_offset(16);
    }];
    
    
    //重上
    self.chongshangLabel = [[UILabel alloc]init];
    self.chongshangLabel.text = @"[重上]";
    self.chongshangLabel.font = SystemFont(15);
    self.chongshangLabel.textColor = UICOLOR_FROM_HEX(0xFFBA00);
    [self.bgcontentView addSubview:self.chongshangLabel];
    
    [self.chongshangLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.jiaocaiNameLabel.mas_right).with.offset(margin10);
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(margin20);
        make.height.mas_offset(15);
    }];
    
    
    //姓名
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"Ruisun";
    self.nameLabel.font = SystemFont(15);
    self.nameLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    [self.bgcontentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(margin5);
        make.top.equalTo(self.jiaocaiNameLabel.mas_bottom).with.offset(margin10);
        make.height.mas_offset(15);
    }];
    
    
    //奖杯图片
    self.giftImageView = [[UIImageView alloc]init];
    self.giftImageView.image = UIIMAGE_FROM_NAME(@"icon-jiangbei");
    [self.bgcontentView addSubview:self.giftImageView];
    
    [self.giftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).with.offset(margin10);
        make.top.equalTo(self.jiaocaiNameLabel.mas_bottom).with.offset(margin10);
        make.size.mas_offset(CGSizeMake(15, 14));
    }];

    
    //奖杯数量
    self.giftNumLabel = [[UILabel alloc]init];
    self.giftNumLabel.text = @"x230";
    self.giftNumLabel.font = SystemFont(12);
    self.giftNumLabel.textColor = UICOLOR_FROM_HEX(ColorEFB637);
    [self.bgcontentView addSubview:self.giftNumLabel];
    
    [self.giftNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.giftImageView.mas_right).with.offset(4);
        make.centerY.equalTo(self.giftImageView.mas_centerY);
        make.height.mas_offset(15);
    }];

    
    //老师缺席，课时已返还
    self.fanhuanAlertLabel = [[UILabel alloc]init];
    self.fanhuanAlertLabel.text = @"老师缺席，课时已返还";
    self.fanhuanAlertLabel.font = SystemFont(12);
    self.fanhuanAlertLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self.bgcontentView addSubview:self.fanhuanAlertLabel];
    
    [self.fanhuanAlertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgcontentView.mas_left).with.offset(margin10);
        make.bottom.equalTo(self.bgcontentView.mas_bottom).with.offset(-margin10);
        make.height.mas_offset(14);
    }];
    
    
    
    //待评价---已评价
    self.pingjiaButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.pingjiaButton setTitle:@"已评价" forState:(UIControlStateNormal)];
    [self.pingjiaButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.pingjiaButton.titleLabel.font = SystemFont(13);
    [self.bgcontentView addSubview:self.pingjiaButton];
    
    [self.pingjiaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgcontentView.mas_right).with.offset(-margin15);
        make.bottom.equalTo(self.bgcontentView.mas_bottom).with.offset(-margin10);
        make.size.mas_offset(CGSizeMake(86,32));
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.iconImageView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(30)];
    [self.iconImageView addBorderForViewWithBorderWidth:0.5 BorderColor:UICOLOR_FROM_HEX(ColorF2F2F2) CornerRadius:LineH(30)];
    
    [self.pingjiaButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:16];
    [self.pingjiaButton addBorderForViewWithBorderWidth:0.5 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:16];
}


@end
