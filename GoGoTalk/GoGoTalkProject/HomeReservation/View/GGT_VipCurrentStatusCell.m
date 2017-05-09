//
//  GGT_VipCurrentStatusCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_VipCurrentStatusCell.h"

@implementation GGT_VipCurrentStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
        
        [self initCellView];
    }
    return self;
}

- (void)initCellView {
    self.bgView = [[UIView alloc]init];
    self.bgView.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
    self.bgView.layer.shadowColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    //0 0 代表是4个边都是阴影
    self.bgView.layer.shadowOffset = CGSizeMake(0, 0);
    self.bgView.layer.shadowOpacity = LineW(0.8);
    self.bgView.layer.shadowRadius = LineW(3);
    self.bgView.layer.cornerRadius = LineW(5);
    self.bgView.clipsToBounds = NO;
    [self.contentView addSubview:self.bgView];
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];

    
//    724 × 284 beijing_zuijkecheng
    //待约课
    self.waitingOrderImgView = [[UIImageView alloc]init];
    self.waitingOrderImgView.image = UIIMAGE_FROM_NAME(@"wuyueke_kecheng_kong");
    [self.bgView addSubview:self.waitingOrderImgView];
    
    [self.waitingOrderImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.bgView);
    }];
    
    
 /*
    //课程日期
    self.courseTimeLabel = [[UILabel alloc]init];
    self.courseTimeLabel.font = Font(16);
    self.courseTimeLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.courseTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.courseTimeLabel.text = @"今日（周三）13：00 体验课";
    [self.bgView addSubview:self.courseTimeLabel];
    
    
    //课程状态
    self.statusLabel = [[UILabel alloc]init];
    self.statusLabel.font = Font(11);
    self.statusLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    [self.bgView addSubview:self.statusLabel];
    
    
    //课程状态的img  未开始:weikaishi_kebiao 91 89
    self.statusImgView = [[UIImageView alloc]init];
    [self.bgView addSubview:self.statusImgView];
    

    /******************************正在上课******************************/
    
    /*
        [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).with.offset(LineH(15));
            make.left.equalTo(self.bgView.mas_left).with.offset(LineX(10));
            make.right.equalTo(self.statusLabel.mas_left).with.offset(-LineW(5));
            make.height.mas_offset(LineH(16));
        }];
    
    
        self.statusLabel.text = @"正在上课";
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).with.offset(LineH(15));
            make.left.equalTo(self.courseTimeLabel.mas_right).with.offset(LineW(5));
            make.right.equalTo(self.statusImgView.mas_left).with.offset(-LineW(5));
            make.height.mas_offset(LineH(12));
        }];
    
    
        self.statusImgView.image = UIIMAGE_FROM_NAME(@"daojishi_kechenliebiao_zhuangtai");
        [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgView.mas_top).with.offset(LineH(30));
            make.right.equalTo(self.bgView.mas_right).with.offset(-LineW(15));
            make.size.mas_offset(CGSizeMake(LineW(16), LineH(18)));
        }];
    
    
    
    //头像
    self.teacherIconImgView = [[UIImageView alloc]init];
    self.teacherIconImgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.teacherIconImgView.layer.cornerRadius = LineW(30);
    self.teacherIconImgView.layer.masksToBounds = YES;
    self.teacherIconImgView.layer.borderWidth = LineW(0.5);
    self.teacherIconImgView.layer.borderColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    [self.bgView addSubview:self.teacherIconImgView];
    
    [self.teacherIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgView.mas_left).with.offset(LineX(10));
        make.top.equalTo(self.courseTimeLabel.mas_bottom).with.offset(LineH(25));
        make.size.mas_offset(CGSizeMake(LineW(60), LineW(60)));
    }];
    
    //课程的第几节
    self.lessonsLabel = [[UILabel alloc]init];
    self.lessonsLabel.font = Font(14);
    self.lessonsLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.lessonsLabel.textAlignment = NSTextAlignmentLeft;
    self.lessonsLabel.text = @"Get Ready 2 Get Ready2_01";
    [self.bgView addSubview:self.lessonsLabel];
    
    [self.lessonsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teacherIconImgView.mas_top).with.offset(LineH(10));
        make.left.equalTo(self.teacherIconImgView.mas_right).with.offset(LineX(10));
        make.right.equalTo(self.bgView.mas_right).with.offset(-0);
        make.height.mas_offset(LineH(16));
    }];
    
    
    //教师名字
    self.teacherNameLabel = [[UILabel alloc]init];
    self.teacherNameLabel.font = Font(12);
    self.teacherNameLabel.textColor = UICOLOR_FROM_HEX(kCalendar_PlaceHolderColor);
    self.teacherNameLabel.textAlignment = NSTextAlignmentLeft;
    self.teacherNameLabel.text = @"XieHenry";
    [self.bgView addSubview:self.teacherNameLabel];
    
    [self.teacherNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lessonsLabel.mas_bottom).with.offset(LineH(20));
        make.left.equalTo(self.teacherIconImgView.mas_right).with.offset(LineX(10));
        make.right.equalTo(self.bgView.mas_right).with.offset(-0);
        make.height.mas_offset(LineH(14));
    }];
    
    
    //进入教室
    self.enterRoomButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.enterRoomButton setTitle:@"进入教室" forState:(UIControlStateNormal)];
    [self.enterRoomButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:(UIControlStateNormal)];
    self.enterRoomButton.titleLabel.font = Font(11);
    self.enterRoomButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    //0 0 代表是4个边都是阴影
    self.enterRoomButton.layer.shadowOffset = CGSizeMake(0, 0);
    self.enterRoomButton.layer.shadowOpacity = LineW(0.8);
    self.enterRoomButton.layer.shadowRadius = LineW(1);
    self.enterRoomButton.layer.cornerRadius = LineW(12.5);
    self.enterRoomButton.layer.shadowColor =  UICOLOR_FROM_HEX(kThemeColor).CGColor;
    self.enterRoomButton.clipsToBounds = NO;
    [self.bgView addSubview:self.enterRoomButton];
    
    [self.enterRoomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.teacherIconImgView.mas_bottom).with.offset(-0);
        make.right.equalTo(self.bgView.mas_right).with.offset(-LineW(10));
        make.size.mas_offset(CGSizeMake(LineW(65), LineH(25)));
    }];
    */
    
}

@end
