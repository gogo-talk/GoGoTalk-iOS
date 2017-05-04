//
//  GGT_ScheduleCell.m
//  GoGoTalk
//
//  Created by 辰 on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ScheduleCell.h"

@implementation GGT_ScheduleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initView];
    }
    return self;
}

// 自定义cell
- (void)initView
{
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath
{
    NSString *GGT_ScheduleCellID = NSStringFromClass([self class]);
    GGT_ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:GGT_ScheduleCellID forIndexPath:indexPath];
    if (cell==nil) {
        cell=[[GGT_ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:GGT_ScheduleCellID];
    }
    return cell;
}



@end
