//
//  GGT_ScheduleFinishedCanPlayCell.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleFinishedCanPlayCell.h"
#import "XCStarView.h"

@interface GGT_ScheduleFinishedCanPlayCell ()
@property (nonatomic, strong) UIView *xc_contentView;
@property (nonatomic, strong) UIView *xc_topView;
@property (nonatomic, strong) UIView *xc_bodyView;
@property (nonatomic, strong) UIView *xc_bottomView;

@property (nonatomic, strong) UILabel *xc_classTimeLabel;
@property (nonatomic, strong) UILabel *xc_countDownLabel;
@property (nonatomic, strong) UIImageView *xc_markImageView;
@property (nonatomic, strong) UIImageView *xc_headPortraitImgView;
@property (nonatomic, strong) UILabel *xc_courseNameLabel;
@property (nonatomic, strong) UILabel *xc_teachNameLabel;
@property (nonatomic, strong) UIButton *xc_playButton;
@property (nonatomic, strong) UILabel *xc_starNameLabel;
@property (nonatomic, strong) XCStarView *xc_starView;
@end

@implementation GGT_ScheduleFinishedCanPlayCell

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
#pragma mark - 整体
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
    
    self.xc_bottomView = ({
        UIView *xc_bottomView = [UIView new];
        xc_bottomView;
    });
    [self.xc_contentView addSubview:self.xc_bottomView];
    
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
        xc_timelabel.textColor = [UIColor blackColor];
        xc_timelabel;
    });
    [self.xc_topView addSubview:self.xc_countDownLabel];
    
    self.xc_markImageView = ({
        UIImageView *xc_markImageView = [UIImageView new];
        xc_markImageView.image = UIIMAGE_FROM_NAME(@"yiwancheng_kecheng_zhuangtai");
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
    
    self.xc_playButton = ({
        UIButton *xc_playButton = [UIButton new];
        [xc_playButton setBackgroundImage:UIIMAGE_FROM_NAME(@"huifang_kecheng") forState:UIControlStateNormal];
        [xc_playButton setBackgroundImage:UIIMAGE_FROM_NAME(@"huifang_kecheng") forState:UIControlStateHighlighted];
        xc_playButton;
    });
    [self.xc_bodyView addSubview:self.xc_playButton];
    
#pragma mark - xc_bottomView
    self.xc_starNameLabel = ({
        UILabel *xc_starNameLabel = [UILabel new];
        xc_starNameLabel.text = @"外教点评";
        xc_starNameLabel.textColor = UICOLOR_FROM_HEX(Color666666);
        xc_starNameLabel.font = Font(11);
        xc_starNameLabel;
    });
    [self.xc_bottomView addSubview:self.xc_starNameLabel];
    
    self.xc_starView = ({
        XCStarView *xc_starView = [[XCStarView alloc] initWithEmptyImage:@"dianping_kebiao_da_wei" StarImage:@"dianping_kebiao_da_yi" totalStarCount:3 selectedStatCount:2 starMargin:10 starWidth:11];
        xc_starView;
    });
    [self.xc_bottomView addSubview:self.xc_starView];
}

- (void)mas_View
{
#pragma mark - 整体
    [self.xc_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(LineW(margin15));
        make.right.equalTo(self).offset(-LineW(margin15));
        make.top.equalTo(self).offset(LineH(margin15/2.0));
        make.bottom.equalTo(self).offset(-LineH(margin15/2.0));
    }];
    
    [self.xc_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.xc_contentView);
        make.height.equalTo(@(LineH(44)));
    }];
    
    [self.xc_bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.xc_contentView);
        make.top.equalTo(self.xc_topView.mas_bottom);
        make.height.equalTo(@(LineH(91)));
    }];
    
    [self.xc_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.xc_bodyView.mas_bottom);
        make.left.right.bottom.equalTo(self.xc_contentView);
    }];
    
    
#pragma mark - xc_topView
    [self.xc_classTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_topView).offset(LineW(margin15));
        make.centerY.equalTo(self.xc_topView.mas_centerY);
    }];
    
    [self.xc_markImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_topView);
        make.centerY.equalTo(self.xc_topView.mas_centerY);
        make.width.height.equalTo(self.xc_topView.mas_height);
    }];
    
    
#pragma mark - xc_bodyView
    [self.xc_headPortraitImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_bodyView).offset(LineW(margin15));
        make.width.height.equalTo(@(LineW(60)));
        make.centerY.equalTo(self.xc_bodyView.mas_centerY);
    }];
    
    [self.xc_courseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_headPortraitImgView.mas_right).offset(LineW(margin15));
        make.top.equalTo(self.xc_headPortraitImgView.mas_top).offset(LineH(margin15/2.0));
    }];
    
    [self.xc_teachNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.xc_headPortraitImgView.mas_bottom).offset(-LineH(margin15/2.0));
        make.left.equalTo(self.xc_courseNameLabel.mas_left);
    }];
    
    
    [self.xc_playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.xc_bodyView).offset(-LineW(margin15));
        make.width.height.equalTo(@(LineW(19)));//38 × 38
        make.centerY.equalTo(self.xc_bodyView.mas_centerY);
    }];
    
#pragma mark - xc_bottomView
    
    [self.xc_starNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_bottomView).offset(LineW(margin15));
        make.centerY.equalTo(self.xc_bottomView);
    }];
    
    [self.xc_starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.xc_starNameLabel.mas_right).offset(LineW(margin15));
        make.centerY.equalTo(self.xc_bottomView);
        make.height.equalTo(@(self.xc_starView.height));
        make.width.equalTo(@(self.xc_starView.width));
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
    NSString *GGT_ScheduleFinishedCanPlayCellID = NSStringFromClass([self class]);
    GGT_ScheduleFinishedCanPlayCell *cell = [tableView dequeueReusableCellWithIdentifier:GGT_ScheduleFinishedCanPlayCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_ScheduleFinishedCanPlayCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GGT_ScheduleFinishedCanPlayCellID];
    }
    return cell;
}


@end
