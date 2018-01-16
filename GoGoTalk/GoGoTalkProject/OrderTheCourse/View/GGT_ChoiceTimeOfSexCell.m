//
//  GGT_ChoiceTimeOfSexCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ChoiceTimeOfSexCell.h"

@interface GGT_ChoiceTimeOfSexCell()
@end

@implementation GGT_ChoiceTimeOfSexCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI {
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [self addSubview:imgView];
    
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(10));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.size.mas_equalTo(CGSizeMake(LineW(15), LineW(15)));
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"外教性别";
    titleLabel.font = Font(14);
    titleLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [self addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(LineX(5));
        make.top.equalTo(self.mas_top).with.offset(LineY(margin15));
        make.height.mas_equalTo(LineW(15));
    }];
    
    
    NSArray *titleArray = @[@"不限",@"男",@"女"];
    for (NSInteger i = 0; i<titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [button setTitle:titleArray[i] forState:(UIControlStateNormal)];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = LineH(5);
        button.layer.borderColor = UICOLOR_FROM_HEX(ColorEA5851).CGColor;
        button.layer.borderWidth = LineW(1);
        button.tag = 100 + i;
        button.titleLabel.font = Font(14);
        if (button.tag == 100) {
            button.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
            [button setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
        } else {
            [button setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
        }
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(LineX(11) + LineX(70)*i);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(LineY(margin15));
            make.size.mas_equalTo(CGSizeMake(LineW(54), LineW(29)));
        }];
    }
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(LineX(3));
        make.right.equalTo(self.mas_right).offset(-LineX(3));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
}


- (void)buttonClick : (UIButton *)button {
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
    [button setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    
    
    NSLog(@"点击了 %@ 按钮",button.titleLabel.text);
}









@end
