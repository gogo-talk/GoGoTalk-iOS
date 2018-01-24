//
//  GGT_MineHomeCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/12.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MineHomeCell.h"

@implementation GGT_MineHomeCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initUI];
    }
    return self;
}


- (void)initUI {
    self.leftImgView = [[UIImageView alloc] init];
    [self addSubview:self.leftImgView];
    
    [self.leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(17, 17));
    }];
    
    
    
    self.leftLabel = [UILabel new];
    self.leftLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.leftLabel.font = Font(16);
    [self addSubview:self.leftLabel];

    [self.leftLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.leftImgView.mas_right).with.offset(margin15);
        make.height.mas_equalTo(18);
    }];
    
    
    
    UIImageView *enterImgView = [UIImageView new];
    enterImgView.image = UIIMAGE_FROM_NAME(@"icon-liebiaojinru");
    [self addSubview:enterImgView];
    
    [enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-margin20);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(7, 12));
    }];
    
    
    self.rightLabel = [UILabel new];
    self.rightLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    self.rightLabel.font = Font(12);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.rightLabel];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(enterImgView.mas_left).with.offset(-12);
        make.height.mas_equalTo(margin15);
    }];
    
    
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin15);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.mas_equalTo(-0);
        make.height.mas_equalTo(0.5);
    }];
}

@end
