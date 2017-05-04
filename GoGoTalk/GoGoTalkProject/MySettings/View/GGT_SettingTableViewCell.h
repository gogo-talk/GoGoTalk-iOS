//
//  GGT_SettingTableViewCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/4.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_SettingTableViewCell : UITableViewCell
@property(nonatomic, strong)NSDictionary *infoDic;
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
