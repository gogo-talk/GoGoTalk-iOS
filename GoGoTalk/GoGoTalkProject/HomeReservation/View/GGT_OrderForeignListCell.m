//
//  GGT_OrderForeignListCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderForeignListCell.h"

@implementation GGT_OrderForeignListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initCellView];
        
    }
    return self;
}

- (void)initCellView {
    self.iconImageView = [[UIImageView alloc]init];
//    self.iconImageView.image = [UIImage imageNamed:@""];
    self.iconImageView.backgroundColor = UICOLOR_RANDOM_COLOR();
    self.iconImageView.layer.masksToBounds = YES;
    self.iconImageView.layer.cornerRadius = 30;
    [self.contentView addSubview:self.iconImageView];
    
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(15);
        make.size.mas_offset(CGSizeMake(60, 60));
    }];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
