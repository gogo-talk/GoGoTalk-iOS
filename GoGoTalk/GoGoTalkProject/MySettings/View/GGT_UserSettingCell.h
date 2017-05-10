//
//  GGT_UserSettingCell.h
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_UserSettingCell : UITableViewCell
@property(nonatomic, strong) NSDictionary *dic;
+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
