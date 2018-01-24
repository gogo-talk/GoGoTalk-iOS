//
//  GGT_MyRreportListCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MyRreportListCell.h"

@interface GGT_MyRreportListCell()
/**左边图片*/
@property (nonatomic, strong) UIImageView *leftImgView;
/**上边文字*/
@property (nonatomic, strong) UILabel *topLabel;
/**下面文字*/
@property (nonatomic, strong) UILabel *bottomLabel;
/**右边文字*/
@property (nonatomic, strong) UILabel *rightLabel;
@end

@implementation GGT_MyRreportListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.backgroundColor= [UIColor clearColor];
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self addSubview:bgView];
    
    [bgView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
    }];
    
    
    self.leftImgView = [UIImageView new];
    self.leftImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [bgView addSubview:self.leftImgView];
    
    [self.leftImgView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(margin10);
        make.centerY.equalTo(bgView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(44, 44));
    }];
    
    
    self.topLabel = [UILabel new];
    self.topLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.topLabel.font = Font(14);
    self.topLabel.text = @"2017年9月份月报";
    [bgView addSubview:self.topLabel];
    
    [self.topLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImgView.mas_right).with.offset(margin10);
        make.top.equalTo(bgView.mas_top).with.offset(13);
        make.height.mas_equalTo(16);
    }];
    
    
    self.bottomLabel = [UILabel new];
    self.bottomLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.bottomLabel.font = Font(14);
    self.bottomLabel.text = @"2017-09-30";
    [bgView addSubview:self.bottomLabel];
    
    [self.bottomLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImgView.mas_right).with.offset(margin10);
        make.top.equalTo(self.topLabel.mas_bottom).with.offset(8);
        make.height.mas_equalTo(16);
    }];
    
    
    self.rightLabel = [UILabel new];
    self.rightLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.rightLabel.font = Font(16);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    self.rightLabel.text = @"下半月";
    [bgView addSubview:self.rightLabel];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(bgView.mas_centerY);
        make.right.equalTo(bgView.mas_right).with.offset(-margin10);
        make.height.mas_equalTo(18);
    }];
}

- (void)drawRect:(CGRect)rect {
    [self.leftImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(5)];

}




@end
