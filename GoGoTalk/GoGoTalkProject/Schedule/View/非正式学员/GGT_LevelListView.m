//
//  GGT_LevelListView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/29.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_LevelListView.h"


@implementation GGT_LevelListView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    NSArray *placeImgArray = @[@"kb-L1-wei",@"kb-L4-wei",@"kb-L7-wei",@"kb-L10-wei",@"kb-L13-wei",@"kb-L16-wei"];
    NSArray *LevelArray = @[@"L1~L3",@"L4~L6",@"L7~L9",@"L10~L12",@"L13~L15",@"L16~L18"];
    NSArray *titleArray = @[@"入门",@"基础",@"进阶",@"高阶",@"流利",@"精通"];

    for (NSInteger i=0; i<placeImgArray.count; i++) {
        //柱状图图片
        UIImageView *imgView = [[UIImageView alloc] init];
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%@",placeImgArray[i]]];
        imgView.image = img;
        CGFloat imgW = img.size.width;
        CGFloat imgH = img.size.height;
        imgView.tag = 100 +i;
        [self addSubview:imgView];
        
        //18*6+31*5 = 108 + 155 = 263
        [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(10+49*i);
            make.bottom.equalTo(self.mas_bottom).with.offset(-37);
            make.width.mas_equalTo(imgW);
            make.height.mas_equalTo(imgH);
        }];
        
        //等级提醒图片
        UIImageView *levelImgView = [[UIImageView alloc] init];
        levelImgView.image = UIIMAGE_FROM_NAME(@"kb-cpbg-dangqianjibie");
        levelImgView.tag = 200 +i;
        [self addSubview:levelImgView];
        levelImgView.hidden = YES;
        
        [levelImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(imgView.mas_centerX);
            make.bottom.equalTo(imgView.mas_top).with.offset(-6);
            make.size.mas_equalTo(CGSizeMake(23, 28));
        }];
        
        //等级提醒文字
        UILabel *levelAlertLabel = [[UILabel alloc] init];
        levelAlertLabel.textColor = UICOLOR_FROM_HEX(ColorEA5851);
        levelAlertLabel.textAlignment = NSTextAlignmentCenter;
        levelAlertLabel.font = [UIFont systemFontOfSize:11];
        levelAlertLabel.tag = 300 +i;
        [levelImgView addSubview:levelAlertLabel];
        levelAlertLabel.hidden = YES;
        
        [levelAlertLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(levelImgView.mas_top).with.offset(5);
            make.centerX.equalTo(levelImgView.mas_centerX);
            make.height.mas_equalTo(11);
        }];
        
        //底部等级分段
        UILabel *levelLabel = [[UILabel alloc] init];
        levelLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        levelLabel.text = LevelArray[i];
        levelLabel.textAlignment = NSTextAlignmentCenter;
        levelLabel.font = [UIFont systemFontOfSize:10];
        [self addSubview:levelLabel];

        [levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imgView.mas_bottom).with.offset(11);
            make.centerX.equalTo(imgView.mas_centerX);
            make.height.mas_equalTo(10);
        }];

        
        //底部精通程度
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = UICOLOR_FROM_HEX(Color999999);
        titleLabel.text = titleArray[i];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(levelLabel.mas_bottom).with.offset(5);
            make.centerX.equalTo(imgView.mas_centerX);
            make.height.mas_equalTo(11);
        }];
    }
}

-(void)upDateLevelUI:(NSString *)lavel {
    NSArray *placeImgArray = @[@"kb-L1-yi",@"kb-L4-yi",@"kb-L7-yi",@"kb-L10-yi",@"kb-L13-yi",@"kb-L16-yi"];

    
    //柱状图的图片
    UIImageView *imgView = [self viewWithTag:103];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[placeImgArray safe_objectAtIndex:3]]];
    
    //等级提醒的图片
    UIImageView *levelImgView = [self viewWithTag:203];
    levelImgView.hidden = NO;
    
    //等级文字
    UILabel *levelAlertLabel = [self viewWithTag:303];
    levelAlertLabel.hidden = NO;
    levelAlertLabel.text = lavel;

}

@end
