//
//  GGT_LessonDaishangView.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/26.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_LessonDaishangView : UIView
/**体验课待上**/
/**
进入教室
 */
@property (nonatomic, strong) UIButton *enterClassButton;
/**
课前预习
 */
@property (nonatomic, strong) UIButton *keqianyuxiButton;
/**
上课须知
 */
@property (nonatomic, strong) UIButton *classxuzhiButton;






/**体验课缺席**/
/**
提醒文字
 */
@property (nonatomic, strong) UILabel *alertLabel;
/**
电话号码
 */
@property (nonatomic, strong) UILabel *phoneNumLabel;
/**
 拨打电话
 */
@property (nonatomic, strong) UIButton *bodadianhuaButton;

@end
