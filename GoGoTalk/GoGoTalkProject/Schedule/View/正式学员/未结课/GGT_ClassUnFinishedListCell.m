//
//  GGT_ClassUnFinishedListCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/1.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassUnFinishedListCell.h"

@interface GGT_ClassUnFinishedListCell()
//内容
@property (nonatomic, strong) UIView *bgcontentView;
//开课时间
@property (nonatomic, strong) UILabel *startTimeLabel;
//开课状态
@property (nonatomic, strong) UILabel *classStatusLabel;
//开课状态图片
@property (nonatomic, strong) UIImageView *classStatusImageView;
//头像
@property (nonatomic, strong) UIImageView *iconImageView;
//教材名称
@property (nonatomic, strong) UILabel *jiaocaiNameLabel;
//重上
@property (nonatomic, strong) UILabel *chongshangLabel;
//姓名
@property (nonatomic, strong) UILabel *nameLabel;

@end



@implementation GGT_ClassUnFinishedListCell
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
    
    
    //开课状态图片
    self.classStatusImageView = [[UIImageView alloc]init];
    self.classStatusImageView.image = UIIMAGE_FROM_NAME(@"kb-icon-zzsk");
    [self.bgcontentView addSubview:self.classStatusImageView];
    
    [self.classStatusImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgcontentView.mas_right).with.offset(-margin10);
        make.top.equalTo(self.bgcontentView.mas_top).with.offset(margin10);
        make.size.mas_offset(CGSizeMake(19, 18));
    }];
    
    
    //开课状态
    self.classStatusLabel = [[UILabel alloc]init];
    self.classStatusLabel.text = @"正在上课";
    self.classStatusLabel.font = SystemFont(12);
    self.classStatusLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self.bgcontentView addSubview:self.classStatusLabel];
    
    [self.classStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.classStatusImageView.mas_left).with.offset(-margin5);
        make.bottom.equalTo(self.classStatusImageView.mas_bottom);
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
    
    
    
    //进入教室（正在上课，即将上课） ----------   预习课件
    self.enterClassOrLookButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    self.enterClassOrLookButton.titleLabel.font = SystemFont(13);
    
//    [self.enterClassOrLookButton setTitle:@"进入教室" forState:(UIControlStateNormal)];
//    [self.enterClassOrLookButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
//    self.enterClassOrLookButton.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    
    
    [self.enterClassOrLookButton setTitle:@"预习课件" forState:(UIControlStateNormal)];
    [self.enterClassOrLookButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.enterClassOrLookButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    
    [self.bgcontentView addSubview:self.enterClassOrLookButton];
    
    
    [self.enterClassOrLookButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgcontentView.mas_right).with.offset(-margin15);
        make.bottom.equalTo(self.bgcontentView.mas_bottom).with.offset(-margin10);
        make.size.mas_offset(CGSizeMake(86,32));
    }];

    
    //取消预约按钮
    self.cancleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.cancleButton setTitle:@"取消预约" forState:(UIControlStateNormal)];
    [self.cancleButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.cancleButton.titleLabel.font = SystemFont(13);
    [self.bgcontentView addSubview:self.cancleButton];
    
    
    [self.cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.enterClassOrLookButton.mas_left).with.offset(-margin15);
        make.bottom.equalTo(self.bgcontentView.mas_bottom).with.offset(-margin10);
        make.size.mas_offset(CGSizeMake(86,32));
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.iconImageView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(30)];
    [self.iconImageView addBorderForViewWithBorderWidth:0.5 BorderColor:UICOLOR_FROM_HEX(ColorF2F2F2) CornerRadius:LineH(30)];
    
    [self.enterClassOrLookButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:16];
    [self.enterClassOrLookButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:16];
    
    [self.cancleButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:16];
    [self.cancleButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:16];
}


@end
