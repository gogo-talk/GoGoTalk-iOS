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
        make.left.equalTo(self.mas_left).with.offset(margin20);
        make.height.mas_equalTo(18);
    }];

    
    self.enterImgView = [UIImageView new];
    self.enterImgView.image = UIIMAGE_FROM_NAME(@"icon-liebiaojinru");
    [self addSubview:self.enterImgView];
    
    [self.enterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-margin20);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(7, 12));
    }];
    
    
    self.rightLabel = [UILabel new];
    self.rightLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.rightLabel.font = Font(16);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.rightLabel];
    
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.enterImgView.mas_left).with.offset(-12);
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
    
    
    
    self.headerImgButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.headerImgButton setBackgroundImage:UIIMAGE_FROM_NAME(@"mrtx-xueyuan-nan") forState:UIControlStateNormal];
    [self addSubview:self.headerImgButton];
    self.headerImgButton.hidden = YES;
    
    [self.headerImgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.enterImgView.mas_left).with.offset(-margin10);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(60, 60));
    }];
}

-(void)freshCell : (BOOL)isFreshCell {
    if (isFreshCell == YES) {
        self.enterImgView.hidden = YES;
        
        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.mas_right).with.offset(-margin20);
            make.height.mas_equalTo(margin15);
        }];
        
    } else {
        self.enterImgView.hidden = NO;
        
        [self.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.enterImgView.mas_left).with.offset(-12);
            make.height.mas_equalTo(margin15);
        }];
    }
    
}



- (void)drawRect:(CGRect)rect {
    [self.headerImgButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineW(30)];
}


@end
