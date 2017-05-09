//
//  GGT_HomeCommonCenterCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_HomeCommonCenterCell : UITableViewCell

@property (nonatomic, strong) UIImageView *backgroundImageView;


/******未预约成功的view********/
@property (nonatomic, strong) UIView *notOrderView;

/******普通用户未预约体验课********/
//预约试听-----预约成功---icon
@property (nonatomic, strong) UIImageView *yuyueshitingImageView;
//预约试听-----预约成功---label
@property (nonatomic, strong) UILabel *yuyueshitingLabel;
//立即预约
@property (nonatomic, strong) UIButton *yuyueshitingButton;
//预约成功后的电话提醒
@property (nonatomic, strong) UILabel *contactTeacherCallsLabel;
//测评报告---label
@property (nonatomic, strong) UILabel *testReportLabel;
//测评报告
@property (nonatomic, strong) UIButton *testReportButton;
//咨询客服
@property (nonatomic, strong) UIButton *consultingServiceButton;
//当前英语水平----view
@property (nonatomic, strong) UIView *leverView;
//当前英语水平----label
@property (nonatomic, strong) UILabel *leverLabel;




/******已预约之后的view********/
@property (nonatomic, strong) UIView *orderView;
//课程日期
@property (nonatomic, strong) UILabel *courseTimeLabel;
//头像
@property (nonatomic, strong) UIImageView *teacherIconImgView;
//课程的第几节
@property (nonatomic, strong) UILabel *lessonsLabel;
//教师名称
@property (nonatomic, strong) UILabel *teacherNameLabel;
//官网地址
@property (nonatomic, strong) UILabel *webAddressLabel;
//进入教室
@property (nonatomic, strong) UIButton *enterRoomButton;
//重新预约
@property (nonatomic, strong) UIButton *rescheduleButton;
//状态
@property (nonatomic, strong) UILabel *statusLabel;
//状态
@property (nonatomic, strong) UIImageView *statusImgView;







- (void)getStasus:(NSString *)statusStr;


@end
