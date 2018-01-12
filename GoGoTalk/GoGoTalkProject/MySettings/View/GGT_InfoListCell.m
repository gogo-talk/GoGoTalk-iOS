//
//  GGT_InfoListCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_InfoListCell.h"


@interface GGT_InfoListCell()
@end

@implementation GGT_InfoListCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.leftLabel = [UILabel new];
    self.leftLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.leftLabel.font = Font(16);
    [self addSubview:self.leftLabel];
    
    [self.leftLabel  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(LineX(20));
        make.height.mas_equalTo(LineH(18));
    }];

    
    self.enterImgView = [UIImageView new];
    self.enterImgView.image = UIIMAGE_FROM_NAME(@"jinru_wode_liebiao");
    [self addSubview:self.enterImgView];
    
    [self.enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-LineX(20));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(LineW(7), LineH(12)));
    }];
    
    
    self.rightLabel = [UILabel new];
    self.rightLabel.textColor = UICOLOR_FROM_HEX(Color999999);
    self.rightLabel.font = Font(12);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.rightLabel];
    
    if (self.isRefreshView == YES) {
        self.enterImgView.hidden = YES;
        
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.mas_right).with.offset(-LineX(20));
            make.height.mas_equalTo(LineH(15));
        }];
        
    } else {
        self.enterImgView.hidden = NO;

        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.enterImgView.mas_left).with.offset(-LineX(12));
            make.height.mas_equalTo(LineH(15));
        }];
    }
    
   
    
   
    
    
    
    self.lineView = [UIView new];
    self.lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:self.lineView];
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(15));
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.mas_equalTo(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    
    
    self.iconImgView = [UIImageView new];
//    self.iconImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:self.iconImgView];
    self.iconImgView.hidden = YES;
    
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.enterImgView.mas_left).with.offset(-LineX(10));
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(LineW(60), LineW(60)));
    }];
}


- (void)drawRect:(CGRect)rect {
    [self.iconImgView xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineW(30)];
}


@end
