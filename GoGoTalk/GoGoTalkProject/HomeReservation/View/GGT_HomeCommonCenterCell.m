//
//  GGT_HomeCommonCenterCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeCommonCenterCell.h"

@implementation GGT_HomeCommonCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

        [self initCellView];

    }
    return self;
}

- (void)initCellView {
    self.backgroundImageView = [[UIImageView alloc]init];
    self.backgroundImageView.image = UIIMAGE_FROM_NAME(@"yuyuekecheng");
    [self.contentView addSubview:self.backgroundImageView];
    
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
    
    //icon
    self.yuyueshitingImageView = [[UIImageView alloc]init];
    self.yuyueshitingImageView.image = UIIMAGE_FROM_NAME(@"yuyueshiting_tiyan");
    [self.backgroundImageView addSubview:self.yuyueshitingImageView];
    
    [self.yuyueshitingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backgroundImageView.mas_top).with.offset(LineY(85));
        make.centerX.mas_offset(self.backgroundImageView.centerX);
        make.size.mas_offset(CGSizeMake(LineW(54), LineH(43)));
    }];
    

    //预约试听
    self.yuyueshitingLabel = [[UILabel alloc]init];
    self.yuyueshitingLabel.text = @"预约试听";
    self.yuyueshitingLabel.textColor = UICOLOR_FROM_HEX(0x4D4D4D);
    self.yuyueshitingLabel.font = Font(31);
    [self.backgroundImageView addSubview:self.yuyueshitingLabel];
    
    [self.yuyueshitingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingImageView.mas_bottom).with.offset(LineY(20));
        make.centerX.mas_offset(self.backgroundImageView.centerX);
        make.height.mas_offset(LineH(31));
    }];
    
    
    //立即预约按钮
//    self.yuyueshitingButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
//    [self.yuyueshitingButton setTitle:@"立即预约" forState:(UIControlStateNormal)];
//    [self.yuyueshitingButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
//    self.yuyueshitingButton.titleLabel.font = Font(16);
//    self.yuyueshitingButton.backgroundColor = MainColor;
//    self.yuyueshitingButton.layer.cornerRadius = LineW(20);
//    self.yuyueshitingButton.layer.shadowOffset =  CGSizeMake(LineX(1), LineY(1));
//    self.yuyueshitingButton.layer.shadowOpacity = LineW(0.8);
//    self.yuyueshitingButton.layer.shadowColor =  MainColor.CGColor;
//    [self.backgroundImageView addSubview:self.yuyueshitingButton];
//    
//    [self.yuyueshitingButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.yuyueshitingLabel.mas_bottom).with.offset(LineH(20));
//        make.bottom.equalTo(self.backgroundImageView.mas_bottom).with.offset(-LineH(20));
//        make.centerX.mas_equalTo(self.backgroundImageView.mas_centerX);
//        make.width.mas_offset(LineW(150));
//    }];

    
    //预约试听
    self.yuyueSuccessedLabel = [[UILabel alloc]init];
    self.yuyueSuccessedLabel.text = @"马上会有老师联系您，请保持电话畅通\n或拨打 400-8787-286";
    self.yuyueSuccessedLabel.numberOfLines = 0;
    self.yuyueSuccessedLabel.font = Font(16);
    [self.backgroundImageView addSubview:self.yuyueSuccessedLabel];
    
    [self.yuyueSuccessedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingLabel.mas_bottom).with.offset(LineY(20));
        make.bottom.equalTo(self.backgroundImageView.mas_bottom).with.offset(-LineY(20));
        make.left.equalTo(self.backgroundImageView.mas_left).with.offset(LineX(37));
        make.right.equalTo(self.backgroundImageView.mas_right).with.offset(-LineX(37));

    }];
    
}

- (void)getStasus:(NSString *)statusStr {
    
}

@end
