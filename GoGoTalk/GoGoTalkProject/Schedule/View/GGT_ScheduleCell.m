//
//  GGT_ScheduleCell.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleCell.h"

static CGFloat const margin = 10.0f;

@interface GGT_ScheduleCell ()
@property (nonatomic, strong) UILabel *xc_timeLabel;
@property (nonatomic, strong) UILabel *xc_countDownLabel;
@property (nonatomic, strong) UIImageView *xc_logoImageView;
@property (nonatomic, strong) UIImageView *xc_headPortraitImgView;
@property (nonatomic, strong) UILabel *xc_courseNameLabel;
@property (nonatomic, strong) UILabel *xc_teachNameLabel;
@property (nonatomic, strong) UIButton *xc_enterRoomButton;
@end

@implementation GGT_ScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configView];
    }
    return self;
}

// 自定义cell
- (void)configView
{
    [self initView];
//    [self mas_View];
}

// 初始化view
- (void)initView
{
    self.xc_timeLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = [UIColor blackColor];
        xc_timelabel;
    });
    [self addSubview:self.xc_timeLabel];
    
    self.xc_countDownLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = [UIColor blackColor];
        xc_timelabel;
    });
    [self addSubview:self.xc_countDownLabel];
    
    self.xc_logoImageView = ({
        UIImageView *xc_logoImageView = [UIImageView new];
        xc_logoImageView;
    });
    [self addSubview:self.xc_logoImageView];
    
    self.xc_headPortraitImgView = ({
        UIImageView *xc_headPortraitImgView = [UIImageView new];
        xc_headPortraitImgView;
    });
    [self addSubview:self.xc_headPortraitImgView];
    
    self.xc_countDownLabel = ({
        UILabel *xc_countDownLabel = [UILabel new];
        xc_countDownLabel;
    });
    [self addSubview:self.xc_countDownLabel];
    
    
    self.xc_teachNameLabel = ({
        UILabel *xc_teachNameLabel = [UILabel new];
        xc_teachNameLabel;
    });
    [self addSubview:self.xc_teachNameLabel];
    
    self.xc_enterRoomButton = ({
        UIButton *xc_enterRoomButton = [UIButton new];
        xc_enterRoomButton;
    });
    [self addSubview:self.xc_enterRoomButton];
}

//- (void)mas_View
//{
//    [self.xc_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.equalTo(self).offset(margin);
//    }];
//    
//    [self.xc_logoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.top.equalTo(self).offset(margin);
//        make.height.with.equalTo(@(2*margin)).multipliedBy(2*margin/375*SCREEN_WIDTH());
//    }];
//    
//    [self.xc_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.xc_logoImageView).offset(margin);
//        make.centerY.equalTo(self.xc_logoImageView);
//    }];
//    
//    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.xc_timeLabel.mas_bottom).offset(2*margin);
//    }];
//    
//    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(margin);
//        
//    }];
//}

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    NSString *GGT_ScheduleCellID = NSStringFromClass([self class]);
    GGT_ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:GGT_ScheduleCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GGT_ScheduleCellID];
    }
    return cell;
}



@end
