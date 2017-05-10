//
//  GGT_UserSettingCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_UserSettingCell.h"
@interface GGT_UserSettingCell()
@property(nonatomic, strong) NSIndexPath *indexPath;
@end
@implementation GGT_UserSettingCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        
    }
    
    return self;
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    [self initCell];
}
-(void)initCell
{
    if(self.indexPath.section == 0 && self.indexPath.row==0){
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = self.dic[@"title"];
        titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(LineX(20));
            make.top.mas_equalTo(self.mas_top);
            make.bottom.mas_equalTo(self.mas_bottom);
            make.width.mas_equalTo(LineW(120));
        }];
        UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(10, 10, 10, 10)];
        sw.onTintColor = [UIColor redColor];
        sw.on = YES;
        //sw.transform = CGAffineTransformMakeScale(1.20, 1.20);
        [self addSubview:sw];
        [sw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).with.offset(-15);
            
        }];
        
    }else{
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = self.dic[@"title"];
        titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
        //titleLabel.sizeToFit;
        [self addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(LineX(20));
            make.top.mas_equalTo(self.mas_top);
            make.bottom.mas_equalTo(self.mas_bottom);
            //make.width.mas_equalTo(LineW(120));
        }];
        UILabel *subLabel = [UILabel new];
        NSString *str = @"";
        if(self.indexPath.section == 0 && self.indexPath.row == 1){
            NSString *subStr = [NSString stringWithFormat:@"%@MB",self.dic[@"subtitle"]];
            str = subStr;
        }else{
            NSString *subStr = [NSString stringWithFormat:@"%@",self.dic[@"subtitle"]];
            str = subStr;
        }
        //NSString *subStr = [NSString stringWithFormat:@"%@",self.dic[@"subtitle"]];
        subLabel.text = str;
        subLabel.textColor = UICOLOR_FROM_HEX(0x666666);
        [self addSubview:subLabel];
        [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if(self.indexPath.section == 0 && self.indexPath.row == 1){
                make.right.mas_equalTo(self.mas_right).with.offset(-30);
            }else{
                make.right.mas_equalTo(self.mas_right).with.offset(-15);
            }
            
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    GGT_UserSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserSettingCell" forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_UserSettingCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UserSettingCell"];
    }
    if(indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 2)){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.indexPath = indexPath;
    return cell;
}
@end
