//
//  GGT_MyClassTimeCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_MyClassTimeCell : UITableViewCell
/**
 左边文字
 */
@property (nonatomic, strong) UILabel *leftLabel;
/**
 中间文字
 */
@property (nonatomic, strong) UILabel *centerLabel;
/**
 右边文字
 */
@property (nonatomic, strong) UILabel *rightLabel;
/**
 底部分割线
 */
@property (nonatomic, strong) UIView *lineView;
@end
