//
//  GGT_MyClassTimeHeaderCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MyClassTimeHeaderCell.h"


@implementation GGT_MyClassTimeHeaderCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    GGT_Pieview *view = [[GGT_Pieview alloc] initWithFrame:CGRectMake((SCREEN_WIDTH() - LineH(60)) /2, LineY(10), LineH(60), LineH(60)) dataItems:@[@40, @60] colorItems:@[UICOLOR_FROM_HEX(ColorEA5851),UICOLOR_FROM_HEX(ColorF2F2F2)]];
    [self addSubview:view];
    [view stroke];
    
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    titleLabel.font = Font(14);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"剩余23课时";
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.height.mas_equalTo(margin15);
        make.bottom.mas_equalTo(-margin20);
    }];
    
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-0);
        make.bottom.mas_equalTo(-0);
        make.height.mas_equalTo(0.5);
    }];
}


@end
