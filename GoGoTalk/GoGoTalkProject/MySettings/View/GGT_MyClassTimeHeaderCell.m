//
//  GGT_MyClassTimeHeaderCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MyClassTimeHeaderCell.h"

@implementation GGT_MyClassTimeHeaderCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    KNCirclePercentView *circleView = [[KNCirclePercentView alloc]init];
    circleView.frame = CGRectMake((SCREEN_WIDTH()-LineW(60))/2, LineY(10), LineH(60), LineH(60));
    [self addSubview:circleView];
    
    [circleView drawPieChartWithPercent:30
                                    duration:2
                                   clockwise:YES
                                   fillColor:[UIColor clearColor]
                                 strokeColor:[UIColor redColor]
                              animatedColors:@[UICOLOR_FROM_HEX(ColorEB5B54)]];
    [circleView startAnimation];
}



@end
