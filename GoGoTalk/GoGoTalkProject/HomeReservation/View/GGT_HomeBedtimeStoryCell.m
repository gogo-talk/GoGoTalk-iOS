//
//  GGT_HomeBedtimeStoryCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeBedtimeStoryCell.h"

@implementation GGT_HomeBedtimeStoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

        [self initCellView];
    }
    return self;
}

- (void)initCellView {
   //作用是为了显示白色背景----没用到
    self.bigView = [[UIView alloc]init];
    self.bigView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bigView];
    
    [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
    
    self.bgView = [[UIView alloc]init];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = LineW(5);
    self.bgView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.contentView addSubview:self.bgView];
    
    
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(20));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(20));
        make.top.equalTo(self.contentView.mas_top).with.offset(LineY(5));
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(-LineY(5));
    }];
    
    
    
}

@end
