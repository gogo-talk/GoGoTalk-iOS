//
//  GGT_ConfirmBookingAlertView.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/10.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_ConfirmBookingAlertView.h"

@implementation GGT_ConfirmBookingAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpContentView];
    }
    return self;
}


- (void)setUpContentView {
    //宽度为277 ，高度为327，view向内压缩7，
    UIView *bgView = [[UIView alloc]init];
    bgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    bgView.layer.masksToBounds = YES;
    bgView.layer.cornerRadius = LineW(13);
    [self addSubview:bgView];
    
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(0);
        make.right.equalTo(self.mas_right).with.offset(-LineW(7));
        make.top.equalTo(self.mas_top).with.offset(LineH(7));
        make.bottom.equalTo(self.mas_bottom).with.offset(-0);
    }];
    
    
    
    //头部的背景
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = UICOLOR_FROM_HEX(0xFEF2F1);
    [bgView addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(0);
        make.right.equalTo(bgView.mas_right).with.offset(-0);
        make.top.equalTo(bgView.mas_top).with.offset(0);
        make.height.mas_equalTo(LineH(60));
    }];
    
    //左边的图片  110 114
    UIImageView *headerImgView = [[UIImageView alloc]init];
    headerImgView.image = UIIMAGE_FROM_NAME(@"beijinghuawen_yuyue_tanchuang");
    [headerView addSubview:headerImgView];
    
    [headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).with.offset(0);
        make.top.equalTo(headerView.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(LineW(55), LineH(57)));
    }];
    
    
    //标题
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"确认预约课程";
    titleLabel.font = Font(18);
    titleLabel.textColor = UICOLOR_FROM_HEX(kThemeColor);
    [headerView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(headerView.mas_centerX);
        make.centerY.equalTo(headerView.mas_centerY);
    }];
    
    
    //关闭按钮 25 25
    UIButton *closeButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [closeButton setImage:UIIMAGE_FROM_NAME(@"guanbi_yuyue_tanchuang") forState:(UIControlStateNormal)];
    [self addSubview:closeButton];
    
    [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).with.offset(0);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.size.mas_equalTo(CGSizeMake(LineW(25), LineH(25)));
    }];
    
    
    //分割线
    UIView *headerlineView = [[UIView alloc]init];
    headerlineView.backgroundColor = UICOLOR_FROM_HEX(0xFEF2F1);
    [bgView addSubview:headerlineView];
    
    [headerlineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView.mas_left).with.offset(0);
        make.right.equalTo(bgView.mas_right).with.offset(-0);
        make.top.equalTo(bgView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    

    NSArray *iconArray = @[@"mingcheng_yuyue_tanchuang",@"kejian_yuyue_tanchuang",@"shijian_yuyue_tanchuang"];
    for (int i = 0; i<iconArray.count; i++) {
        //左边的3个icon
        UIImageView *iconImgView = [[UIImageView alloc]init];
        iconImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",iconArray[i]]];
        [bgView addSubview:iconImgView];
        
        [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
            make.top.equalTo(bgView.mas_top).with.offset(LineY(80)+LineH(40)*i);
            make.size.mas_equalTo(CGSizeMake(LineW(19), LineW(19)));
        }];
        
        
        //3个输入框
//        UITextField *textField = [[UITextField alloc]init];
//        textField.font = Font(16);
//        [bgView addSubview:textField];
//        
//        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(iconImgView.mas_right).with.offset(LineX(15));
//            make.right.equalTo(self.mas_right).with.offset(-LineW(27));
//            make.top.equalTo(headerView.mas_bottom).with.offset(LineH(20));
//            make.height.mas_equalTo(LineH(20));
//        }];
//        
//        
//        if (i == 1) {
//            
//        }
        
        
    }
    
    
    
    for (int i=0; i<2;i++) {
        //分割线
        UIView *headerlineView = [[UIView alloc]init];
        headerlineView.backgroundColor = UICOLOR_FROM_HEX(0xCDCED2);
        [bgView addSubview:headerlineView];
        
        [headerlineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(bgView.mas_left).with.offset(LineX(20));
            make.right.equalTo(bgView.mas_right).with.offset(-LineW(27));
            make.top.equalTo(headerView.mas_bottom).with.offset(LineY(60)+LineH(60)*i);
            make.height.mas_equalTo(LineH(0.5));
        }];
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

@end