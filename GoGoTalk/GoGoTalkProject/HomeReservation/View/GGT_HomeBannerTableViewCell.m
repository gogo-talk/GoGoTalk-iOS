//
//  GGT_HomeBannerTableViewCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeBannerTableViewCell.h"

@implementation GGT_HomeBannerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

        [self initCellView];
    }
    return self;
}

- (void)initCellView {
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH()-20, LineH(100))];
    self.bgView.layer.masksToBounds = YES;
    self.bgView.layer.cornerRadius = LineW(5);
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.bgView];
    

    _adScroll = [[AdCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bgView.width, self.bgView.height)];
    _adScroll.delegate = self;
    _adScroll.pageControlAliment = AdCycleScrollViewPageControlAlimentCenter;
    [self.bgView addSubview:_adScroll];
}


- (void)getAdDataArray:(NSArray *)array {
    
    _adScroll.imagesUrlArray = array;
    [_adScroll refreshPageControlStyle];
}

-(void)cycleScrollView:(AdCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)selectedIndex {
//    NSLog(@"----%ld",(long)selectedIndex);
    
    if (self.adBlockClick) {
        self.adBlockClick(selectedIndex);
    }
    
    
}


@end
