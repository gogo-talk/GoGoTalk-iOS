//
//  GGT_ScheduleStudyingCell.h
//  GoGoTalk
//
//  Created by 辰 on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ScheduleStudyingCell : UITableViewCell

@property (nonatomic, strong) NSString *xc_timeCount;
/// 倒计时到0时回调
@property (nonatomic, copy) void(^countDownZero)();

+ (instancetype)cellWithTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
