//
//  GGT_ChoiceTimeOfDateView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/17.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfDateView.h"


@interface GGT_ChoiceTimeOfDateView ()
@property (nonatomic, strong) UIView *xc_contentView;
@property (nonatomic, strong) UILabel *xc_weekDayLabel;
@property (nonatomic, strong) UILabel *xc_timeLabel;
@end


@implementation GGT_ChoiceTimeOfDateView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
//    self.backgroundColor = [UIColor clearColor];
    
    for (NSInteger i = 0; i < 7; i++) {
        UIButton *bgviewButton = [UIButton new];
        bgviewButton.tag = i;
        if (i == 0) {
            bgviewButton.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
        } else {
            bgviewButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
        }
        [self addSubview:bgviewButton];
        
        [bgviewButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(self.mas_left).with.offset(LineX(51)*i);
            make.size.mas_equalTo(CGSizeMake(LineW(51), LineH(50)));
        }];
        
        
        
        UILabel *weekDayLabel = [UILabel new];
        weekDayLabel.font = Font(13);
        weekDayLabel.textAlignment = NSTextAlignmentCenter;
        weekDayLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
//        weekDayLabel.text = array[i];
//        weekDayLabel.text = @"今日";
        weekDayLabel.tag = 100 + i;
        [bgviewButton addSubview:weekDayLabel];
        
        [weekDayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(bgviewButton.mas_top).offset(LineY(8));
            make.left.right.equalTo(bgviewButton);
            make.height.mas_equalTo(LineH(13));
        }];
        
        
        UILabel *timeLabel = [UILabel new];
        timeLabel.font = Font(13);
        timeLabel.textAlignment = NSTextAlignmentCenter;
        timeLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
//        timeLabel.text = array[i];
//        timeLabel.text = @"12-18";
        timeLabel.tag = 200 + i;
        [bgviewButton addSubview:timeLabel];
        
        [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(weekDayLabel.mas_bottom).offset(LineY(7));
            make.left.right.equalTo(bgviewButton);
            make.height.mas_equalTo(LineH(13));
        }];
        
        
        UIView *lineView = [UIView new];
        lineView.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
        [bgviewButton addSubview:lineView];
        
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top);
            make.left.equalTo(bgviewButton.mas_left).with.offset(LineX(51)+LineX(51)*i);
            make.size.mas_equalTo(CGSizeMake(LineW(1), LineH(50)));
        }];
        

//        UIControl *control = [[UIControl alloc] init];
//        [control addTarget:self action:@selector(controlClick:) forControlEvents:(UIControlEventTouchUpInside)];
//        control.tag = 300 + i;
//        [bgview addSubview:control];
//
//        [control mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.top.bottom.equalTo(bgview);
//        }];
    }
}

- (void)controlClick:(UIControl *)button {
    if ([self.subviews containsObject:button]) {
        for (UIView *view in self.subviews) {
            if ([view isKindOfClass:[UIButton class]]) {
                UIButton *btn = (UIButton *)view;
                btn.selected = NO;
                btn.backgroundColor = [UIColor clearColor];
                [btn setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
            }
        }
    }
    button.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    
    
}

- (void)getCellArray : (NSArray *)array {
    for (NSInteger i = 0; i< array.count; i++) {
        UIButton *bgview = [self viewWithTag:i];
        
        UILabel *weekDayLabel = [bgview viewWithTag:100+i];
        weekDayLabel.text = array[i];
        
        UILabel *timeLabel = [bgview viewWithTag:200+i];
        timeLabel.text = array[i];
        
    }
}


@end
