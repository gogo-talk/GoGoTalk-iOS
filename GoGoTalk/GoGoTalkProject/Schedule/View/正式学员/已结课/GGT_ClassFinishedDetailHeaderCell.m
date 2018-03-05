//
//  GGT_ClassFinishedDetailHeaderCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/3/2.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedDetailHeaderCell.h"

@interface GGT_ClassFinishedDetailHeaderCell()
//开课时间
@property (nonatomic, strong) UILabel *startTimeLabel;
//开课状态
@property (nonatomic, strong) UILabel *classStatusLabel;
//头像
@property (nonatomic, strong) UIImageView *iconImageView;
//教材名称
@property (nonatomic, strong) UILabel *jiaocaiNameLabel;
//姓名
@property (nonatomic, strong) UILabel *nameLabel;
//关注
@property (nonatomic, strong) UIButton *focusButton;
//待评价
@property (nonatomic, strong) UIButton *pingjiaButton;
@end


@implementation GGT_ClassFinishedDetailHeaderCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    //开课时间
    self.startTimeLabel = [[UILabel alloc]init];
    self.startTimeLabel.text = @"12月08日（周一） 13：00";
    self.startTimeLabel.font = SystemFont(15);
    self.startTimeLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    [self addSubview:self.startTimeLabel];
    
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    //开课状态
    self.classStatusLabel = [[UILabel alloc]init];
    self.classStatusLabel.text = @"迟到";
    self.classStatusLabel.font = SystemFont(12);
    self.classStatusLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self addSubview:self.classStatusLabel];
    
    [self.classStatusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.height.mas_offset(12);
    }];
    
    
    //头像
    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.image = UIIMAGE_FROM_NAME(@"default-avatar");
    [self addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(margin10);
        make.size.mas_offset(CGSizeMake(LineH(60), LineH(60)));
    }];
    
    
    //教材名称
    self.jiaocaiNameLabel = [[UILabel alloc]init];
    self.jiaocaiNameLabel.text = @"Get Ready 5";
    self.jiaocaiNameLabel.font = SystemFont(16);
    self.jiaocaiNameLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:self.jiaocaiNameLabel];
    
    [self.jiaocaiNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(margin5);
        make.top.equalTo(self.startTimeLabel.mas_bottom).with.offset(margin20);
        make.height.mas_offset(16);
    }];
    
    
    //姓名
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"Ruisun";
    self.nameLabel.font = SystemFont(15);
    self.nameLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    [self addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(margin5);
        make.top.equalTo(self.jiaocaiNameLabel.mas_bottom).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    //关注
    self.focusButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.focusButton setBackgroundImage:UIIMAGE_FROM_NAME(@"icon-jiaguanzhu") forState:(UIControlStateNormal)];
    [self.contentView addSubview:self.focusButton];
    
    [self.focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(margin10);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.size.mas_offset(CGSizeMake(55, 23));
    }];
    
    
    //待评价---已评价
    self.pingjiaButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.pingjiaButton setTitle:@"待评价" forState:(UIControlStateNormal)];
    [self.pingjiaButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.pingjiaButton.titleLabel.font = SystemFont(13);
    [self addSubview:self.pingjiaButton];
    
    [self.pingjiaButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.bottom.equalTo(self.mas_bottom).with.offset(-margin10);
        make.size.mas_offset(CGSizeMake(86,32));
    }];
    
    
    
    //底部的分割线
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);;
        make.height.mas_offset(0.5);
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.iconImageView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(30)];
    [self.iconImageView addBorderForViewWithBorderWidth:0.5 BorderColor:UICOLOR_FROM_HEX(ColorF2F2F2) CornerRadius:LineH(30)];
    
    [self.pingjiaButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:16];
    [self.pingjiaButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:16];
}



@end
