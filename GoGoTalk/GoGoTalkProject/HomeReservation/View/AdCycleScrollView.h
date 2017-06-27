//
//  GGT_HomeBannerTableViewCell.h
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PageStyle){
    AdCycleScrollViewPageControlNone = 0,
    AdCycleScrollViewPageControlAlimentLeft,
    AdCycleScrollViewPageControlAlimentCenter,
    AdCycleScrollViewPageControlAlimentRight
};

@class AdCycleScrollView;

@protocol AdCycleScrollViewDelegate <NSObject>

-(void)cycleScrollView:(AdCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)selectedIndex;

@end

@interface AdCycleScrollView : UIView

@property (nonatomic, strong) NSArray *imagesUrlArray;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, assign) CGFloat autoScrollTimeInterval;
@property (nonatomic, assign) PageStyle pageControlAliment;

@property (nonatomic, weak) id<AdCycleScrollViewDelegate> delegate;

+(instancetype)cycleScrollViewWithFrame:(CGRect)frame imagesArray:(NSArray *)imagesArray;

- (void)refreshPageControlStyle;

@end
