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
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(LineY(10));
        make.height.mas_offset(LineH(44));
    }];
    
    
    //请输入孩子姓名---输入框
    self.nameField = [[UITextField alloc]init];
    self.nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"请输入孩子姓名"] attributes:@{NSForegroundColorAttributeName: UICOLOR_FROM_HEX(ColorCCCCCC)}];
    self.nameField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.nameField.font = Font(16);
    self.nameField.delegate = self;
    [self.nameField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
    [bgView addSubview:self.nameField];
    
    [self.nameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
        make.right.equalTo(bgView.mas_right).with.offset(-LineX(20));
        make.top.equalTo(bgView.mas_top).with.offset(0);
        make.height.mas_offset(LineH(44));
    }];
    
    
    self.confirmButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.confirmButton setTitle:@"确认预约" forState:(UIControlStateNormal)];
    [self.confirmButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.confirmButton.titleLabel.font = Font(18);
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = LineH(22);
    self.confirmButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    [self addSubview:self.confirmButton];
    
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(30));
        make.right.equalTo(self.mas_right).with.offset(-LineX(30));
        make.top.equalTo(self.nameField.mas_bottom).with.offset(LineY(30));
        make.height.mas_offset(LineH(44));
    }];
    

}

- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.text.length > 0) {
        
        self.confirmButton.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
        self.nameField.tintColor = UICOLOR_FROM_HEX(kThemeColor);

    } else {
        
        self.confirmButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
        self.nameField.tintColor = UICOLOR_FROM_HEX(ColorCCCCCC);

    }
}







@end
