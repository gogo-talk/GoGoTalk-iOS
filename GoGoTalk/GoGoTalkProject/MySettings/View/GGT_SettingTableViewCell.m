//
//  GGT_SettingTableViewCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/4.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_SettingTableViewCell.h"

@implementation GGT_SettingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initCell];
    }
    return self;
}
-(void)initCell{
    UIImageView *leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"keshi_wodeliebiao"]];
    [self.contentView addSubview:leftImage];
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
    }];
    self.contentView.backgroundColor = [UIColor redColor];
    
}
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    GGT_SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
    }
    return cell;
}
@end
