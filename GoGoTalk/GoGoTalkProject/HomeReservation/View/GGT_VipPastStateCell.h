//
//  GGT_VipPastStateCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_VipPastStateCell : UITableViewCell

@property (nonatomic, strong) UIView *bgView;

//课程日期
@property (nonatomic, strong) UILabel *courseTimeLabel;
//头像
@property (nonatomic, strong) UIImageView *teacherIconImgView;
//课程的第几节
@property (nonatomic, strong) UILabel *lessonsLabel;
//教师名称
@property (nonatomic, strong) UILabel *teacherNameLabel;
//重新预约
@property (nonatomic, strong) UIButton *rescheduleButton;
//状态
@property (nonatomic, strong) UILabel *statusLabel;
//状态
@property (nonatomic, strong) UIImageView *statusImgView;

//重播
@property (nonatomic, strong) UIButton *enterRoomButton;
@end
