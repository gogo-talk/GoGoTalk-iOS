//
//  GGT_MineHomeCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/12.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_MineHomeCell : UITableViewCell
/**
 左边图片
 */
@property (nonatomic, strong) UIImageView *leftImgView;
/**
 左边文字
 */
@property (nonatomic, strong) UILabel *leftLabel;
/**
 右边文字
 */
@property (nonatomic, strong) UILabel *rightLabel;

/**
 底部分割线
 */
@property (nonatomic, strong) UIView *lineView;
@end

