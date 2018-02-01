//
//  GGT_ClassUnFinishedListCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/1.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ClassUnFinishedListCell : UITableViewCell
//进入教室（正在上课，即将上课） ----------   预习课件
@property (nonatomic, strong) UIButton *enterClassOrLookButton;
//取消预约按钮
@property (nonatomic, strong) UIButton *cancleButton;
@end
