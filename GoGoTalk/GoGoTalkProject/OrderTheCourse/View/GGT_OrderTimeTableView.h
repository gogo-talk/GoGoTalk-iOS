//
//  GGT_OrderTimeTableView.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GGT_OrderTimeCollectionViewCell.h"
#import "GGT_OrderTimeHeaderCollectionViewCell.h"
#import "TimeCollectionViewCell.h"

@interface GGT_OrderTimeTableView : UIView <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
//年月日
@property (nonatomic, strong) NSMutableArray *yearsArray;
//周几
@property (nonatomic, strong) NSMutableArray *weeksArray;

@property (nonatomic, strong) NSMutableArray *dateArray;




@property (nonatomic, strong) NSArray *alltimeArray;





@end
