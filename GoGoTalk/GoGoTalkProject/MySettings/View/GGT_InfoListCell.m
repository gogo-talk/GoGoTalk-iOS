//
//  GGT_InfoListCell.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_InfoListCell.h"
@interface GGT_InfoListCell()
@property(nonatomic, strong) NSIndexPath *indexPath;
@end
@implementation GGT_InfoListCell
-(void)setInfoDic:(NSDictionary *)infoDic
{
    [self createCell:infoDic];
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
    }
    return self;
}
-(void)createCell:(NSDictionary *)info
{
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = info[@"title"];
    titleLabel.textColor = UICOLOR_FROM_HEX(0x333333);
    titleLabel.font = Font(16);
    [self.contentView addSubview:titleLabel];
    UILabel *subLabel = [UILabel new];
    subLabel.text = info[@"subtitle"];
    subLabel.textColor = UICOLOR_FROM_HEX(0x999999);
    subLabel.font = Font(16);
    [self.contentView addSubview:subLabel];
    
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(20));
    }];
    [subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        CGFloat right;
        if(self.indexPath.section == 1 && self.indexPath.row == 0){
            right = LineX(-5);
        }else{
            right = LineX(5);
        }
        make.right.equalTo(self.contentView.mas_right).with.offset(right);
    }];
    
}
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    GGT_InfoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    if(cell == nil){
        cell = [[GGT_InfoListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listCell"];
    }
    if(indexPath.section == 2){
        //去掉指定CELL的分割线
        cell.separatorInset = UIEdgeInsetsMake(0, SCREEN_WIDTH(), 0, 0);
    }
    if(indexPath.section == 1 && indexPath.row == 0){
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.indexPath = indexPath;
    return cell;
}
@end
