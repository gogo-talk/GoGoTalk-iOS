//
//  GGT_BookExperienceClassView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_BookExperienceClassView.h"

@implementation GGT_BookExperienceClassView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initContentView];
        
    }
    return self;
}

- (void)initContentView {
    self.nameField = [[UITextField alloc]init];
    self.nameField.placeholder = @"请输入孩子姓名";
    [self addSubview:self.nameField];
    
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(10);
        make.height.mas_offset(44);
    }];
    
    
    self.confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.confirmButton setTitle:@"确认预约" forState:(UIControlStateNormal)];
    [self.confirmButton setTitleColor:UICOLOR_RANDOM_COLOR() forState:(UIControlStateNormal)];
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = 10;
    [self addSubview:self.confirmButton];
    
    
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(-25);
        make.right.equalTo(self.mas_right).with.offset(-25);
        make.top.equalTo(self.nameField.mas_bottom).with.offset(30);
        make.height.mas_offset(44);
    }];
    
    
    
    
}

@end
