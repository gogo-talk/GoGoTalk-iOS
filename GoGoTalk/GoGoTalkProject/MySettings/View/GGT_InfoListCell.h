//
//  GGT_InfoListCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_InfoListCell : UITableViewCell
/**
 左边文字
 */
@property (nonatomic, strong) UILabel *leftLabel;
/**
 进入的图片
 */
@property (nonatomic, strong) UIImageView *enterImgView;
/**
 右边文字
 */
@property (nonatomic, strong) UILabel *rightLabel;
/**
 底部分割线
 */
@property (nonatomic, strong) UIView *lineView;
/**
 头像按钮
 */
@property(nonatomic, strong) UIButton *headerImgButton;
/**
 手机号部分，刷新坐标
 */
-(void)freshCell : (BOOL)isFreshCell;


@end
