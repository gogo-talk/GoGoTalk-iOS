//
//  GGT_EvaluationReportView.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/26.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_EvaluationReportView.h"

@interface GGT_EvaluationReportView ()
/**测试报告待生成**/
//等待中图片
@property (nonatomic, strong) UIImageView *dengdaiImgView;
//等待
@property (nonatomic, strong) UILabel *dengdaiLabel;



/**测试报告已生成**/
//当前英语等级
@property (nonatomic, strong) UILabel *levelLabel;
//等级图示
@property (nonatomic, strong) GGT_LevelListView *levelListView;

@end

@implementation GGT_EvaluationReportView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

- (void)buildUI {
    self.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    
    //头部红色背景
    UIView *headRedView = [[UIView alloc]init];
    headRedView.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    [self addSubview:headRedView];
    
    [headRedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.mas_top).with.offset(0);
        make.height.mas_equalTo(60);
    }];
    
    
    //大背景图片
    UIImageView *bgImgView = [[UIImageView alloc] init];
    bgImgView.image = UIIMAGE_FROM_NAME(@"kb-tiyanke-daishang-bj");
    [self addSubview:bgImgView];
    
    [bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(1);
        make.left.equalTo(self.mas_left).with.offset(margin10);
        make.right.equalTo(self.mas_right).with.offset(-margin10);
        make.height.mas_equalTo(507);
    }];
    
    
    /*----------------1.测试报告待生成-------------------*/
    //等待图片
    self.dengdaiImgView = [[UIImageView alloc] init];
    self.dengdaiImgView.image = UIIMAGE_FROM_NAME(@"kb-icon-dengdaizhong");
    [self addSubview:self.dengdaiImgView];
    
    [self.dengdaiImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_top).with.offset(95);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(106, 127));
    }];
    
    //等待文字
    self.dengdaiLabel = [[UILabel alloc] init];
    self.dengdaiLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.dengdaiLabel.text = [@"外教老师正在完成测评报告\n请等待..." stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    [self.dengdaiLabel changeLineSpaceWithSpace:5];
    self.dengdaiLabel.textAlignment = NSTextAlignmentCenter;
    self.dengdaiLabel.numberOfLines = 0;
    self.dengdaiLabel.font = Font(18);
    [bgImgView addSubview:self.dengdaiLabel];
    
    [self.dengdaiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.dengdaiImgView.mas_bottom).with.offset(30);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(50);
    }];
    
    
    self.dengdaiImgView.hidden = YES;
    self.dengdaiLabel.hidden = YES;
    
    
    /*----------------2.测试报告已生成-------------------*/
    //定级
    self.levelLabel = [[UILabel alloc] init];
    self.levelLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.levelLabel.textAlignment = NSTextAlignmentCenter;
    self.levelLabel.font = Font(14);
    
    NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:@"您当前英语水平 Level 1"];
    [AttributedStr addAttribute:NSFontAttributeName value:Font(18) range:NSMakeRange(8, 7)];
    [AttributedStr addAttribute:NSForegroundColorAttributeName value:UICOLOR_FROM_HEX(ColorEA5851) range:NSMakeRange(8, 7)];
    self.levelLabel.attributedText = AttributedStr;
    
    [bgImgView addSubview:self.levelLabel];
    
    [self.levelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgImgView.mas_top).with.offset(24);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.height.mas_equalTo(20);
    }];
    
    
    //等级图示
    self.levelListView = [[GGT_LevelListView alloc]init];
    [self.levelListView upDateLevelUI:@"L10"];
    [self addSubview:self.levelListView];
    
    [self.levelListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.top.equalTo(self.levelLabel.mas_bottom).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(283, 210)); //263 + 20
    }];
    
    
    //查看测评报告
    self.chakanbaogaoButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.chakanbaogaoButton setTitle:@"查看测评报告" forState:(UIControlStateNormal)];
    [self.chakanbaogaoButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.chakanbaogaoButton.backgroundColor = UICOLOR_FROM_HEX(ColorEA5851);
    self.chakanbaogaoButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.chakanbaogaoButton];
    
    
    [self.chakanbaogaoButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.levelListView.mas_bottom).with.offset(20);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 34));
    }];
    
    
    //购买课程套餐
    self.buyClassButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.buyClassButton setTitle:@"购买课程套餐" forState:(UIControlStateNormal)];
    [self.buyClassButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
    self.buyClassButton.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.buyClassButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.buyClassButton];
    
    
    [self.buyClassButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chakanbaogaoButton.mas_bottom).with.offset(20);
        make.centerX.equalTo(bgImgView.mas_centerX);
        make.size.mas_equalTo(CGSizeMake(180, 34));
    }];
    
    
    
    
    
    
    /*----------------底部信息----------------*/
    self.kechengtixiButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.kechengtixiButton setTitle:@"课程体系" forState:(UIControlStateNormal)];
    [self.kechengtixiButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.kechengtixiButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.kechengtixiButton];
    
    
    [self.kechengtixiButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgImgView.mas_bottom).with.offset(-40);
        make.right.equalTo(bgImgView.mas_centerX).with.offset(-30);
        make.size.mas_equalTo(CGSizeMake(89, 34));
    }];
    
    
    self.shizifuwuButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.shizifuwuButton setTitle:@"师资服务" forState:(UIControlStateNormal)];
    [self.shizifuwuButton setTitleColor:UICOLOR_FROM_HEX(Color666666) forState:(UIControlStateNormal)];
    self.shizifuwuButton.titleLabel.font = Font(14);
    [bgImgView addSubview:self.shizifuwuButton];
    
    
    [self.shizifuwuButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgImgView.mas_bottom).with.offset(-40);
        make.left.equalTo(bgImgView.mas_centerX).with.offset(30);
        make.size.mas_equalTo(CGSizeMake(89, 34));
    }];
}


-(void)drawRect:(CGRect)rect {
    [self.chakanbaogaoButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    
    [self.buyClassButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    [self.buyClassButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:17];
    
    
    [self.kechengtixiButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    [self.kechengtixiButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:17];
    
    [self.shizifuwuButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:17];
    [self.shizifuwuButton addBorderForViewWithBorderWidth:1 BorderColor:UICOLOR_FROM_HEX(Color666666) CornerRadius:17];
    
}
@end
