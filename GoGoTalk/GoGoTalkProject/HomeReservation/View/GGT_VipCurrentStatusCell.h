//
//  GGT_VipCurrentStatusCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_VipCurrentStatusCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;

//课程日期
@property (nonatomic, strong) UILabel *courseTimeLabel;
//头像
@property (nonatomic, strong) UIImageView *teacherIconImgView;
//课程的第几节
@property (nonatomic, strong) UILabel *lessonsLabel;
//教师名称
@property (nonatomic, strong) UILabel *teacherNameLabel;
//进入教室
@property (nonatomic, strong) UIButton *enterRoomButton;
//状态
@property (nonatomic, strong) UILabel *statusLabel;
//状态
@property (nonatomic, strong) UIImageView *statusImgView;
//等待约课的img
@property (nonatomic, strong) UIImageView *waitingOrderImgView;



@end
