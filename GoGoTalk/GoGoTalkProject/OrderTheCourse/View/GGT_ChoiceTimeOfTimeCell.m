//
//  GGT_ChoiceTimeOfTimeCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfTimeCell.h"

@implementation GGT_ChoiceTimeOfTimeCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:imgView];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.size.mas_equalTo(CGSizeMake(LineW(15), LineW(15)));
    }];
    
    
    UILabel *leftLabel = [[UILabel alloc] init];
    leftLabel.text = @"选择时间";
    leftLabel.font = Font(14);
    leftLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:leftLabel];
    
    [leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(LineX(5));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.height.mas_equalTo(LineW(15));
    }];
    
    UILabel *rightLabel = [[UILabel alloc] init];
    rightLabel.text = @"（注:● 表示该时间点您已经约过课了哦）";
    rightLabel.font = Font(14);
    rightLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:rightLabel];
    
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.height.mas_equalTo(LineW(15));
    }];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(3));
        make.right.equalTo(self.mas_right).offset(-LineX(3));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
@end
