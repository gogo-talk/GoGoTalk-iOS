//
//  GGT_OrderForeignListCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderForeignListCell.h"

@implementation GGT_OrderForeignListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
        [self initCellView];
    }
    return self;
}

- (void)initCellView {
    //头像
    self.iconImageView = [[UIImageView alloc]init];
    self.iconImageView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self.contentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(margin15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
    
    
    //姓名
    self.nameLabel = [[UILabel alloc]init];
    self.nameLabel.text = @"Ruisun";
    self.nameLabel.font = Font(16);
    self.nameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).with.offset(margin15);
        make.top.equalTo(self.contentView.mas_top).with.offset(margin20);
        make.height.mas_offset(18);
    }];
    
    
    //关注
    self.focusButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [self.focusButton setImage:UIIMAGE_FROM_NAME(@"jiaguanzhu_yueke") forState:(UIControlStateNormal)];
    self.focusButton.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self.contentView addSubview:self.focusButton];

    [self.focusButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.nameLabel.mas_bottom).with.offset(margin10);
        make.size.mas_offset(CGSizeMake(55, 23));
    }];
    

  
   //预约按钮
    self.orderButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.orderButton setTitle:@"预约" forState:(UIControlStateNormal)];
    [self.orderButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.orderButton.titleLabel.font = Font(13);
    [self.contentView addSubview:self.orderButton];
    
    
    [self.orderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).with.offset(-margin15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.size.mas_offset(CGSizeMake(66,30));
    }];
    
    
    //底部的分割线
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(margin10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-0);;
        make.height.mas_offset(0.5);
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.iconImageView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(30)];
    [self.iconImageView addBorderForViewWithBorderWidth:LineW(0.5) BorderColor:UICOLOR_FROM_HEX(ColorF2F2F2) CornerRadius:LineH(30)];
   
    [self.orderButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(15)];
    [self.orderButton addBorderForViewWithBorderWidth:LineH(1) BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:LineH(15)];
}



@end
