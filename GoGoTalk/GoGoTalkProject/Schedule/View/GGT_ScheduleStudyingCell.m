//
//  GGT_ScheduleStudyingCell.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleStudyingCell.h"

static CGFloat const margin = 15.0f;

@interface GGT_ScheduleStudyingCell ()
@property (nonatomic, strong) UIView *xc_contentView;
@property (nonatomic, strong) UIView *xc_topView;
@property (nonatomic, strong) UIView *xc_bodyView;

@property (nonatomic, strong) UILabel *xc_classTimeLabel;
@property (nonatomic, strong) UILabel *xc_countDownLabel;
@property (nonatomic, strong) UIImageView *xc_markImageView;
@property (nonatomic, strong) UIImageView *xc_headPortraitImgView;
@property (nonatomic, strong) UILabel *xc_courseNameLabel;
@property (nonatomic, strong) UILabel *xc_teachNameLabel;
@property (nonatomic, strong) UIButton *xc_enterRoomButton;
@end

@implementation GGT_ScheduleStudyingCell

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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self configView];
    }
    return self;
}

// 自定义cell
- (void)configView
{
    [self initView];
    [self mas_View];
}

// 初始化view
- (void)initView
{
    // 整体
    self.xc_contentView = ({
        UIView *xc_contentView = [UIView new];
        xc_contentView.backgroundColor = [UIColor whiteColor];
        xc_contentView;
    });
    [self addSubview:self.xc_contentView];
    
    self.xc_topView = ({
        UIView *xc_topView = [UIView new];
        xc_topView;
    });
    [self.xc_contentView addSubview:self.xc_topView];
    
    self.xc_bodyView = ({
        UIView *xc_bodyView = [UIView new];
        xc_bodyView;
    });
    [self.xc_contentView addSubview:self.xc_bodyView];
    
    
#pragma mark - xc_topView
    self.xc_classTimeLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_timelabel.font = Font(16);
        xc_timelabel;
    });
    [self.xc_topView addSubview:self.xc_classTimeLabel];
    
    self.xc_countDownLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = UICOLOR_FROM_HEX(kThemeColor);
        xc_timelabel.font = Font(11);
        xc_timelabel;
    });
    [self.xc_topView addSubview:self.xc_countDownLabel];
    
    self.xc_markImageView = ({
        UIImageView *xc_markImageView = [UIImageView new];
        xc_markImageView.image = UIIMAGE_FROM_NAME(@"daojishi_kechenliebiao_zhuangtai");
        xc_markImageView.contentMode = UIViewContentModeCenter;
        xc_markImageView;
    });
    [self.xc_topView addSubview:self.xc_markImageView];
    
#pragma mark - xc_bodyView
    self.xc_headPortraitImgView = ({
        UIImageView *xc_headPortraitImgView = [UIImageView new];
        xc_headPortraitImgView.image = UIIMAGE_FROM_NAME(@"huabi_zhibo_wei");
        xc_headPortraitImgView;
    });
    [self.xc_bodyView addSubview:self.xc_headPortraitImgView];
    
    self.xc_courseNameLabel = ({
        UILabel *xc_courseNameLabel = [UILabel new];
        xc_courseNameLabel.text = @"hello world";
        xc_courseNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_courseNameLabel.font = Font(14);
        xc_courseNameLabel;
    });
    [self.xc_bodyView addSubview:self.xc_courseNameLabel];
    
    self.xc_teachNameLabel = ({
        UILabel *xc_teachNameLabel = [UILabel new];
        xc_teachNameLabel.text = @"hello world";
        xc_teachNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
        xc_teachNameLabel.font = Font(12);
        xc_teachNameLabel;
    });
    [self.xc_bodyView addSubview:self.xc_teachNameLabel];
    
    self.xc_enterRoomButton = ({
        UIButton *xc_enterRoomButton = [UIButton new];
        [xc_enterRoomButton setTitle:@"进入教室" forState:UIControlStateNormal];
        [xc_enterRoomButton setBackgroundImage:UIIMAGE_FROM_NAME(@"圆角矩形-2") forState:UIControlStateNormal];
        [xc_enterRoomButton setBackgroundImage:UIIMAGE_FROM_NAME(@"圆角矩形-2") forState:UIControlStateHighlighted];
        xc_enterRoomButton.titleLabel.font = Font(10);
        [xc_enterRoomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        xc_enterRoomButton;
    });
    [self.xc_bodyView addSubview:self.xc_enterRoomButton];
    
}

- (void)mas_View
{
    [self.xc_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin));
        make.right.equalTo(self).offset(-LineW(margin));
        make.top.equalTo(self).offset(LineH(margin/2.0));
        make.bottom.equalTo(self).offset(-LineH(margin/2.0));
    }];
    
    [self.xc_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.xc_contentView);
        make.height.equalTo(@(LineH(44)));
    }];
    
    [self.xc_bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.xc_contentView);
        make.top.equalTo(self.xc_topView.mas_bottom);
    }];
    
    
    // xc_topView
    [self.xc_classTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_topView).offset(LineW(margin));
        make.centerY.equalTo(self.xc_topView.mas_centerY);
    }];
    
    [self.xc_markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_topView).offset(-LineW(margin));
        make.centerY.equalTo(self.xc_topView.mas_centerY);
        make.width.height.equalTo(@(LineW(18)));
    }];
    
    [self.xc_countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_markImageView.mas_left).offset(-LineW(margin));
        make.centerY.equalTo(self.xc_topView.mas_centerY);
    }];
    
    
    // xc_bodyView
    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_bodyView).offset(LineW(margin));
        make.width.height.equalTo(@(LineW(60)));
        make.centerY.equalTo(self.xc_bodyView.mas_centerY);
    }];
    
    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(LineW(margin));
        make.top.equalTo(self.xc_headPortraitImgView.mas_top).offset(LineH(margin/2.0));
    }];
    
    [self.xc_teachNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(-LineH(margin/2.0));
        make.left.equalTo(self.xc_courseNameLabel.mas_left);
    }];
    

    [self.xc_enterRoomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_bodyView).offset(-LineW(margin));
        make.bottom.equalTo(self.xc_headPortraitImgView);
        make.width.equalTo(@(LineW(71)));//142 × 62
        make.height.equalTo(@(31));
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.xc_contentView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineW(5.0f)];
    
    [self.xc_headPortraitImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:self.xc_headPortraitImgView.width];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    NSString *GGT_ScheduleCellID = NSStringFromClass([self class]);
    GGT_ScheduleStudyingCell *cell = [tableView dequeueReusableCellWithIdentifier:GGT_ScheduleCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_ScheduleStudyingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GGT_ScheduleCellID];
    }
    return cell;
}



@end
