//
//  GGT_ClassFinishedDetailCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/27.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedDetailCell.h"

@interface GGT_ClassFinishedDetailCell()
@property (nonatomic, strong) UIImageView *leftImgView;
@property (nonatomic, strong) UILabel *leftlabel;
@property (nonatomic, strong) UIImageView *enterImgView;

//奖杯部分
@property (nonatomic, strong) UILabel *giftLabel;
@property (nonatomic, strong) UIImageView *giftImgView;
@property (nonatomic, strong) UILabel *giftNumLabel;

//评分
@property (nonatomic, strong) UIView *starView;

@end


@implementation GGT_ClassFinishedDetailCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {

    //左边图像
    self.leftImgView = [[UIImageView alloc] init];
    [self addSubview:self.leftImgView];
    
    //左边文字
    self.leftlabel = [[UILabel alloc] init];
    self.leftlabel.font = SystemFont(16);
    self.leftlabel.textColor = UICOLOR_FROM_HEX(Color333333);
    [self addSubview:self.leftlabel];
    
    //进入图像
    self.enterImgView = [[UIImageView alloc] init];
    self.enterImgView.image = UIIMAGE_FROM_NAME(@"icon-liebiaojinru");
    [self addSubview:self.enterImgView];
    

    
    //获得奖杯部分
    self.giftNumLabel = [[UILabel alloc] init];
    self.giftNumLabel.font = SystemFont(12);
    self.giftNumLabel.textColor = UICOLOR_FROM_HEX(ColorEFB637);
    self.giftNumLabel.text = @"x230";
    [self addSubview:self.giftNumLabel];
    
    [self.giftNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_offset(13);
    }];
    
    
    self.giftImgView = [[UIImageView alloc] init];
    self.giftImgView.image = UIIMAGE_FROM_NAME(@"icon-jiangbei");
    [self addSubview:self.giftImgView];
    
    [self.giftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.giftNumLabel.mas_left).with.offset(-4);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_offset(CGSizeMake(15, 14));
    }];
    
    
    self.giftLabel = [[UILabel alloc] init];
    self.giftLabel.font = SystemFont(12);
    self.giftLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.giftLabel.text = @"还需要努力哦";
    [self addSubview:self.giftLabel];
    
    [self.giftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.giftImgView.mas_left).with.offset(-5);
        make.centerY.equalTo(self.mas_centerY);
        make.height.mas_offset(13);
    }];

    
    self.giftLabel.hidden = YES;
    self.giftImgView.hidden = YES;
    self.giftNumLabel.hidden = YES;
    
    

    //评分
    self.starView = [[UIView alloc] init];
    self.starView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.starView];
    
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-10);
        make.centerY.equalTo(self.mas_centerY);
        make.size.mas_offset(CGSizeMake(100, 30));
    }];
    self.starView.hidden = YES;
    
    
    
    //底部的分割线
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.contentView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);;
        make.height.mas_offset(0.5);
    }];
}

-(void)freshUICell:(NSInteger)indexPathRow {
    if (indexPathRow == 1) { //回放视频
        self.leftImgView.image = UIIMAGE_FROM_NAME(@"icon-huifang-da");
        self.leftlabel.text = @"回放视频";
        
        [self frameChange:YES];
        
    } else if (indexPathRow == 2) { //复习课件
        self.leftImgView.image = UIIMAGE_FROM_NAME(@"icon-fuxikejian");
        self.leftlabel.text = @"复习课件";

        [self frameChange:YES];

    } else if (indexPathRow == 3) { //获得奖杯
        self.leftImgView.hidden = YES;
        self.leftlabel.text = @"获得奖杯";
        self.enterImgView.hidden = YES;
        self.giftLabel.hidden = NO;
        self.giftImgView.hidden = NO;
        self.giftNumLabel.hidden = NO;

        [self frameChange:NO];

        
    } else if (indexPathRow == 4) { //外教评价
        self.leftImgView.hidden = YES;
        self.leftlabel.text = @"外教评价";
        self.enterImgView.hidden = YES;
        self.starView.hidden = NO;

        [self frameChange:NO];

    }
}


-(void)frameChange:(BOOL)isTop{ //top代表前两个
    if (isTop == YES) {
        [self.leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
        [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImgView.mas_right).with.offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(16);
        }];
        
        [self.enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).with.offset(-10);
            make.centerY.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(7, 12));
        }];
    } else {
        [self.leftlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(16);
        }];
    }
}



@end
