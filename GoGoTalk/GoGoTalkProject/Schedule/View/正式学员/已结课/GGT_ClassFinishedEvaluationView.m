//
//  GGT_ClassFinishedEvaluationView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/3/2.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedEvaluationView.h"

@implementation GGT_ClassFinishedEvaluationView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

-(void)initUI {
    //教师满意度
    UILabel *titleLabel1 = [[UILabel alloc]init];
    titleLabel1.text = @"教师满意度";
    titleLabel1.font = SystemFont(12);
    titleLabel1.textColor = UICOLOR_FROM_HEX(Color999999);
    [self addSubview:titleLabel1];
    
    [titleLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    
    
    
    
    
    
    
}

@end
