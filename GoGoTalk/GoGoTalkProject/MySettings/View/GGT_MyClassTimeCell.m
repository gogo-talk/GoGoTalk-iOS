//
//  GGT_MyClassTimeCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MyClassTimeCell.h"

@implementation GGT_MyClassTimeCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.leftLabel = [UILabel new];
    self.leftLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.leftLabel.font = Font(14);
    [self addSubview:self.leftLabel];
    
    [self.leftLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(margin15);
        make.height.mas_equalTo(16);
    }];
    
    
    self.centerLabel = [UILabel new];
    self.centerLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.centerLabel.font = Font(14);
    [self addSubview:self.centerLabel];
    
    [self.centerLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(16);
    }];
    
    
    
    self.rightLabel = [UILabel new];
    self.rightLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    self.rightLabel.font = Font(11);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.rightLabel];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_right).with.offset(-margin15);
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
