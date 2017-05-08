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


/******普通用户未预约体验课********/
//预约试听icon
@property (nonatomic, strong) UIImageView *yuyueshitingImageView;
//预约试听label
@property (nonatomic, strong) UILabel *yuyueshitingLabel;
//预约试听按钮--立即预约
@property (nonatomic, strong) UIButton *yuyueshitingButton;
//预约成功label
@property (nonatomic, strong) UILabel *yuyueSuccessedLabel;

/******普通用户已预约，等待排课********/
/******上课结束，上课成功（测评报告未生成）********/
/******上课结束，上课成功********/







/******已排课，等待上课（距离开课时间大于10分钟）********/
/******即将开课，距离上课小于等于10分钟********/
/******已开始上课********/
/******上课结束，学生缺席********/


- (void)getStasus:(NSString *)statusStr;


@end
