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
  
    
    
    UILabel *titleLabel2 = [[UILabel alloc]init];
    titleLabel2.text = @"本节课学习效果";
    titleLabel2.font = SystemFont(12);
    titleLabel2.textColor = UICOLOR_FROM_HEX(Color999999);
    [self addSubview:titleLabel2];
    
    [titleLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    UILabel *titleLabel3 = [[UILabel alloc]init];
    titleLabel3.text = @"学员评语";
    titleLabel3.font = SystemFont(12);
    titleLabel3.textColor = UICOLOR_FROM_HEX(Color999999);
    [self addSubview:titleLabel3];
    
    [titleLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.top.equalTo(self.mas_top).with.offset(margin15);
        make.height.mas_offset(15);
    }];
    
    
    
}

@end
