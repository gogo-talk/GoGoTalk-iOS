//
//  GGT_OrderTimeCollectionViewCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGT_OrderTimeCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *nameLabel;

@property float cellWidth;

-(void)getCellStr:(NSString *)str;
@end
