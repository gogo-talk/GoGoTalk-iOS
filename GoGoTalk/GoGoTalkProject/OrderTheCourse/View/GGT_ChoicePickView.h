//
//  GGT_ChoicePickView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/6/22.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_ChoicePickView : UIView
@property (nonatomic, copy) void(^DateBlock) (UIButton *button,NSString *dayStr,NSString *timeStr);
@property (nonatomic, copy) NSString *choiceDayStr;
@property (nonatomic, copy) NSString *choiceTimeStr;


@end
