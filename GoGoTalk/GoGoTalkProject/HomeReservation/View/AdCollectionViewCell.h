//
//  GGT_HomeBannerTableViewCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AdCollectionViewCell : UICollectionViewCell{
    UILabel *_titleLabel;
}

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) UIView *bgView;

//@property (nonatomic, strong) UILabel *titleLabel;

@end
