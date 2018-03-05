//
//  GGT_ClassFinishedDetailFooterCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/3/2.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedDetailFooterCell.h"

@interface GGT_ClassFinishedDetailFooterCell()
//评价内容
@property (nonatomic, strong) UILabel *contentLabel;
@end



@implementation GGT_ClassFinishedDetailFooterCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    //评价内容
    self.contentLabel = [[UILabel alloc]init];
    self.contentLabel.text = @"《本草纲目》早有记载，糯米粘滞、难化。《本草逢原》也说，糯米若做粘饼，性难运化，病人莫食。汤圆的外皮部分均以糯米粉为食材，黏性高，不易消化。对于肠胃功能不佳者、老年人、儿童，在食用汤圆的时候就应特别留意，以免造成消化不良或吞咽阻碍；汤圆馅种类繁多，其中油脂含量均较高，会影响慢性病患者病情；另外，甜馅常会使糖尿病患者血糖升高；花生、芝麻、豆沙馅等会加重肾脏病患者病情，应特别注意；对于体重超重或高血脂症、高血压、糖尿病的患者，都不宜过量摄取含大量油脂及糖分的汤圆；对于痛风病患者，高油脂的食物会影响尿酸的排泄，增加痛风病复发的可能[5]  。";
    self.contentLabel.font = SystemFont(14);
    self.contentLabel.numberOfLines = 0;
    self.contentLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    [self addSubview:self.contentLabel];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.top.equalTo(self.mas_top).with.offset(margin20);
        make.bottom.equalTo(self.mas_bottom).with.offset(-margin20);
    }];
    
}

@end
