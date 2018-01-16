//
//  GGT_ChoiceTimeOfDateCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GetDateBlock)(NSString *dateTime);
@interface GGT_ChoiceTimeOfDateCell : UITableViewCell
@property (nonatomic, copy) GetDateBlock getDateBlock;

@end
