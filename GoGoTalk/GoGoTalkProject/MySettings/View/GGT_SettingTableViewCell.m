//
//  GGT_SettingTableViewCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/4.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_SettingTableViewCell.h"
@interface GGT_SettingTableViewCell()
@property(nonatomic, strong) NSIndexPath *indexPath;
@end
@implementation GGT_SettingTableViewCell
-(void)setInfoDic:(NSDictionary *)infoDic
{
    [self initCell:infoDic];
}
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
        
    }
    return self;
}
-(void)initCell:(NSDictionary *)info{
    UIImageView *leftImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:info[@"icon"]]];
    [self.contentView addSubview:leftImage];
    [leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.width.mas_equalTo(LineW(17));
        make.height.mas_equalTo(LineH(17));
    }];
    UILabel *myLabel = [UILabel new];
    myLabel.text = info[@"title"];
    myLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    myLabel.font = Font(16);
    [self.contentView addSubview:myLabel];
    [myLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.equalTo(leftImage.mas_right).with.offset(LineX(15));
    }];
    UILabel *subLabel = [UILabel new];
    subLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    subLabel.text = info[@"subtitle"];
    subLabel.font = Font(12);
    [self.contentView addSubview:subLabel];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        if(self.indexPath.section == 0 && self.indexPath.row == 0){
            make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        }else{
            make.right.equalTo(self.contentView.mas_right).with.offset(LineX(5));
        }
        
    }];
    
}
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    GGT_SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_SettingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
    }
    cell.indexPath = indexPath;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
@end
