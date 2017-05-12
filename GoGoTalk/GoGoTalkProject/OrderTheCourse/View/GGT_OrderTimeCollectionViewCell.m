//
//  GGT_OrderTimeCollectionViewCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/3.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderTimeCollectionViewCell.h"

@implementation GGT_OrderTimeCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);

        self.timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.timeLabel.textAlignment = NSTextAlignmentCenter;
        self.timeLabel.font = Font(12);
        self.timeLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        [self addSubview:self.timeLabel];
    }
    
    return self;
}



@end
