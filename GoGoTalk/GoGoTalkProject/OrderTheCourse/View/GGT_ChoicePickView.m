//
//  GGT_ChoicePickView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/6/22.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ChoicePickView.h"

@implementation GGT_ChoicePickView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initDayView];
    }
    return self;
}


- (void)initDayView {

    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"请选择上课时间";
    titleLabel.font = Font(14);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    titleLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    titleLabel.userInteractionEnabled = YES;
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH(), LineH(30)));
        make.top.equalTo(self.mas_top).with.offset(LineY(0));
    }];
    
    
    
    UIButton *cancleButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [cancleButton setTitle:@"取消" forState:(UIControlStateNormal)];
    cancleButton.titleLabel.font = Font(16);
    [cancleButton setTitleColor:UICOLOR_FROM_HEX(ColorF2F2F2) forState:(UIControlStateNormal)];
    [cancleButton addTarget:self action:@selector(finishButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    cancleButton.tag = 111;
    [self addSubview:cancleButton];
    
    [cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(LineX(10));
        make.height.mas_equalTo(LineH(30));
        make.top.equalTo(self.mas_top).with.offset(LineY(0));
    }];
    
    
    UIButton *finishButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [finishButton setTitle:@"完成" forState:(UIControlStateNormal)];
    finishButton.titleLabel.font = Font(16);
    [finishButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:(UIControlStateNormal)];
    [finishButton addTarget:self action:@selector(finishButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
    finishButton.tag = 222;
    [self addSubview:finishButton];

    [finishButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(-LineX(10));
        make.height.mas_equalTo(LineH(30));
        make.top.equalTo(self.mas_top).with.offset(LineY(0));
    }];
    
    
    UIDatePicker  *picker = [[UIDatePicker alloc] init];
    picker.locale = [[NSLocale alloc]initWithLocaleIdentifier:@"zh_ch"];
    // 设置时区
    [picker setTimeZone:[NSTimeZone localTimeZone]];
    picker.datePickerMode = UIDatePickerModeDateAndTime;
    // 设置当前显示时间
    [picker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
//    [picker setMaximumDate:[NSDate date]];
    [picker addTarget:self action:@selector(seletedBirthyDate:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:picker];
    
    [picker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.height.mas_equalTo(LineH(200));
        make.top.equalTo(self.mas_top).with.offset(LineY(30));
    }];
    
}

- (void)seletedBirthyDate:(UIDatePicker *)pickView {
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [pickView date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    
    
    NSDateFormatter *pickerFormatter1 = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter1 setDateFormat:@"HH:mm"];
    NSString *dateString1 = [pickerFormatter1 stringFromDate:pickerDate];
    
//    NSLog(@"选择时间-%@--%@",dateString,dateString1);
    self.choiceDayStr = dateString;
    self.choiceTimeStr = dateString1;
    
}

- (void)finishButtonClick:(UIButton *)button {
    if (button.tag == 111) {
        if (self.DateBlock) {
                self.DateBlock(button,@"",@"");
        }
    } else if (button.tag == 222) {
        if (self.DateBlock) {
            self.DateBlock(button,self.choiceDayStr,self.choiceTimeStr);
        }
    }
}
@end
