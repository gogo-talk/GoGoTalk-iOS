//
//  GGT_ScheduleCell.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleCell.h"
#import "XCStarView.h"

static CGFloat const margin = 15.0f;

@interface GGT_ScheduleCell ()
@property (nonatomic, strong) UIView *xc_contentView;
@property (nonatomic, strong) UILabel *xc_timeLabel;
@property (nonatomic, strong) UILabel *xc_countDownLabel;
@property (nonatomic, strong) UIImageView *xc_markImageView;
@property (nonatomic, strong) UIImageView *xc_headPortraitImgView;
@property (nonatomic, strong) UILabel *xc_courseNameLabel;
@property (nonatomic, strong) UILabel *xc_teachNameLabel;
@property (nonatomic, strong) UIButton *xc_enterRoomButton;
@property (nonatomic, strong) UIView *xc_starParentView;
@property (nonatomic, strong) UILabel *xc_starNameLabel;
@property (nonatomic, strong) XCStarView *xc_starView;
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
        self.selectionStyle = UITableViewCellSelectionStyleNone;
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
    
    self.xc_contentView = ({
        UIView *xc_contentView = [UIView new];
        xc_contentView.backgroundColor = [UIColor orangeColor];
        xc_contentView;
    });
    [self addSubview:self.xc_contentView];
    
    self.xc_timeLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = [UIColor blackColor];
        xc_timelabel;
    });
    [self.xc_contentView addSubview:self.xc_timeLabel];
    
    self.xc_countDownLabel = ({
        UILabel *xc_timelabel = [UILabel new];
        xc_timelabel.text = @"hello world";
        xc_timelabel.textColor = [UIColor blackColor];
        xc_timelabel;
    });
    [self.xc_contentView addSubview:self.xc_countDownLabel];
    
    self.xc_markImageView = ({
        UIImageView *xc_markImageView = [UIImageView new];
        xc_markImageView.image = UIIMAGE_FROM_NAME(@"daojishi_kechenliebiao_zhuangtai");
        xc_markImageView.contentMode = UIViewContentModeCenter;
        xc_markImageView;
    });
    [self.xc_contentView addSubview:self.xc_markImageView];
    
    self.xc_headPortraitImgView = ({
        UIImageView *xc_headPortraitImgView = [UIImageView new];
        xc_headPortraitImgView.image = UIIMAGE_FROM_NAME(@"huabi_zhibo_wei");
        xc_headPortraitImgView;
    });
    [self.xc_contentView addSubview:self.xc_headPortraitImgView];
    
    self.xc_courseNameLabel = ({
        UILabel *xc_courseNameLabel = [UILabel new];
        xc_courseNameLabel.text = @"hello world";
        xc_courseNameLabel;
    });
    [self.xc_contentView addSubview:self.xc_courseNameLabel];
    
    self.xc_teachNameLabel = ({
        UILabel *xc_teachNameLabel = [UILabel new];
        xc_teachNameLabel.text = @"hello world";
        xc_teachNameLabel;
    });
    [self.xc_contentView addSubview:self.xc_teachNameLabel];
    
    self.xc_enterRoomButton = ({
        UIButton *xc_enterRoomButton = [UIButton new];
        [xc_enterRoomButton setTitle:@"进入教室" forState:UIControlStateNormal];
        [xc_enterRoomButton setBackgroundImage:UIIMAGE_FROM_NAME(@"圆角矩形-2") forState:UIControlStateNormal];
        [xc_enterRoomButton setBackgroundImage:UIIMAGE_FROM_NAME(@"圆角矩形-2") forState:UIControlStateHighlighted];
        xc_enterRoomButton.titleLabel.font = Font(10);
        [xc_enterRoomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        xc_enterRoomButton;
    });
    [self.xc_contentView addSubview:self.xc_enterRoomButton];
    
    self.xc_starParentView = ({
        UIView *xc_starParentView = [UIView new];
//        xc_starParentView.backgroundColor = [UIColor redColor];
        xc_starParentView;
    });
    [self.xc_contentView addSubview:self.xc_starParentView];
    
    self.xc_starNameLabel = ({
        UILabel *xc_starNameLabel = [UILabel new];
        xc_starNameLabel.text = @"外教点评";
        xc_starNameLabel;
    });
    [self.xc_starParentView addSubview:self.xc_starNameLabel];
    
    self.xc_starView = ({
        XCStarView *xc_starView = [[XCStarView alloc] initWithEmptyImage:@"dianping_kebiao_da_wei" StarImage:@"dianping_kebiao_da_yi" totalStarCount:3 selectedStatCount:2 starMargin:5 starWidth:15];
        xc_starView;
    });
    [self.xc_starParentView addSubview:self.xc_starView];
    
    
}

- (void)mas_View
{
    [self.xc_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin));
        make.right.equalTo(self).offset(-LineW(margin));
        make.top.equalTo(self).offset(LineH(margin/2.0));
        make.bottom.equalTo(self).offset(-LineH(margin/2.0));
    }];
    
    [self.xc_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_contentView).offset(LineH(margin));
        make.left.equalTo(self.xc_contentView).offset(LineW(margin));
    }];
    
    [self.xc_markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_contentView.mas_top).offset(LineH(margin));
        make.right.equalTo(self.xc_contentView).offset(-LineW(margin));
        make.width.height.equalTo(@(LineW(18)));
    }];
    
    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_timeLabel.mas_bottom).offset(LineH(margin));
        make.left.equalTo(self.xc_contentView).offset(LineW(margin));
        make.width.height.equalTo(@(LineW(60)));
    }];
    
    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(LineW(margin));
        make.top.equalTo(self.xc_headPortraitImgView.mas_top).offset(LineH(margin/2.0));
    }];
    
    [self.xc_teachNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(-LineH(margin/2.0));
        make.left.equalTo(self.xc_courseNameLabel.mas_left);
    }];
    
    [self.xc_countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_markImageView.mas_left).offset(-LineW(margin));
        make.centerY.equalTo(self.xc_markImageView);
    }];
    
    [self.xc_enterRoomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_contentView).offset(-LineW(margin));
        make.bottom.equalTo(self.xc_contentView).offset(-LineW(margin));//142 × 62
        make.width.equalTo(@(LineW(71)));
        make.height.equalTo(@(31));
    }];
    
    [self.xc_starParentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(LineH(margin));
        make.left.equalTo(self.xc_headPortraitImgView);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];
    
    [self.xc_starNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.centerY.equalTo(self.xc_starParentView);
    }];
    
    [self.xc_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_starNameLabel.mas_right).offset(LineW(margin));
        make.top.equalTo(self.xc_starNameLabel).offset(2);
        make.height.equalTo(self.xc_starView.mas_height);
        make.width.equalTo(@(200));
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
    GGT_ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:GGT_ScheduleCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GGT_ScheduleCellID];
    }
    return cell;
}



@end
