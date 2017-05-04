//
//  GGT_UserInfo.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/4.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_UserInfo.h"

@implementation GGT_UserInfo

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self == [super initWithFrame:frame]){
        UIImageView *userInfoView = [UIImageView new];
        userInfoView.image = UIIMAGE_FROM_NAME(@"beijing_wode_top");
        
        [self addSubview:userInfoView];
        //头像
        UIImageView *imageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"wudingdan_wode"]];
        imageView1.layer.masksToBounds =YES;
        imageView1.layer.cornerRadius =32;
        [imageView1.layer setBorderWidth:2.5];
        [imageView1.layer setBorderColor:[[UIColor colorWithRed:207/255.0 green:18/255.0 blue:28/255.0 alpha:1] CGColor]];
        [userInfoView addSubview:imageView1];
        //英文昵称
        UILabel *name_en = [[UILabel alloc] init];
        name_en.text = @"Ruihua";
        name_en.textColor = [UIColor whiteColor];
        name_en.font = Font(16);
        [userInfoView addSubview:name_en];
        //中文昵称
        UILabel *name = [[UILabel alloc] init];
        name.textColor = UICOLOR_FROM_HEX(0xE6E6E6);
        name.text = @"托尼";
        name.font = Font(10);
        [userInfoView addSubview:name];
        //英语等级
        UILabel *level = [UILabel new];
        level.text = [NSString stringWithFormat:@"英语等级：%@",@"Level 3"];
        level.textColor = UICOLOR_FROM_HEX(0xE6E6E6);
        level.font = Font(10);
        [userInfoView addSubview:level];
        //VIP图标
        //if(self.isVIP == true){
            UIImageView *VIPImageView = [UIImageView new];
            VIPImageView.image = UIIMAGE_FROM_NAME(@"vip_wode");
            [userInfoView addSubview:VIPImageView];
            [VIPImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(name_en.mas_centerY);
                make.right.equalTo(userInfoView.mas_right).with.offset(-LineX(20));
            }];
            
        //}
        
        
        [userInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(0);
            make.left.equalTo(self.mas_left).with.offset(0);
            make.right.equalTo(self.mas_right).with.offset(0);
            make.height.mas_equalTo(LineH(168));
        }];
        [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(userInfoView.mas_top).with.offset(LineY(13));
            make.left.equalTo(userInfoView.mas_left).with.offset(LineX(20));
            make.width.mas_equalTo(LineW(65));
            make.height.mas_equalTo(LineH(65));
        }];
        //英文昵称布局
        [name_en mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(userInfoView.mas_top).with.offset(LineY(22));
            make.left.equalTo(imageView1.mas_right).with.offset(LineX(10));
            make.height.mas_equalTo(LineH(12));
        }];
        //中文昵称布局
        [name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(name_en.mas_bottom).with.offset(LineY(6));
            make.left.mas_equalTo(name_en.mas_left);
            make.height.mas_equalTo(LineH(10));
        }];
        //英语等级布局
        [level mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(name.mas_bottom).with.offset(LineY(8));
            make.left.mas_equalTo(name_en.mas_left);
            make.height.mas_equalTo(LineH(10));
        }];
    }
    
    return self;
}

@end
