//
//  GGT_HomeBannerTableViewCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AdCycleScrollView.h"


typedef void(^AdBlockClick)(NSInteger selectedIndex);

@interface GGT_HomeBannerTableViewCell : UITableViewCell <AdCycleScrollViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) AdCycleScrollView *adScroll;


- (void)getAdDataArray:(NSArray *)array;

@property (nonatomic, copy) AdBlockClick adBlockClick;
@end
