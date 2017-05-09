//
//  GGT_HomeCommonCenterCell.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeCommonCenterCell.h"

@implementation GGT_HomeCommonCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

        [self initCellView];

    }
    return self;
}

- (void)initCellView {
    self.backgroundImageView = [[UIImageView alloc]init];
    self.backgroundImageView.image = UIIMAGE_FROM_NAME(@"yuyuekecheng");
    [self.contentView addSubview:self.backgroundImageView];
    
    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.contentView.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.contentView.mas_top).with.offset(0);
        make.bottom.equalTo(self.contentView.mas_bottom).with.offset(0);
    }];
    
    
    //未预约的view
    /*
    self.notOrderView = [[UIView alloc]init];
    [self.backgroundImageView addSubview:self.notOrderView];
    
    [self.notOrderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundImageView.mas_left).with.offset(0);
        make.right.equalTo(self.backgroundImageView.mas_right).with.offset(-0);
        make.top.equalTo(self.backgroundImageView.mas_top).with.offset(LineY(70));
        make.bottom.equalTo(self.backgroundImageView.mas_bottom).with.offset(0);
    }];
    
    
    //icon  正在完成评测报告的大小为46  46 pingcebaogao_kecheng，预约试听和预约成功的icon的大小都是54 43 yuyueshiting_tiyan yuyuechenggong_kecheng
    self.yuyueshitingImageView = [[UIImageView alloc]init];
    self.yuyueshitingImageView.image = UIIMAGE_FROM_NAME(@"yuyueshiting_tiyan");
    [self.notOrderView addSubview:self.yuyueshitingImageView];
    
    [self.yuyueshitingImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.notOrderView.mas_top).with.offset(LineY(15));
        make.centerX.mas_offset(self.notOrderView.centerX);
        make.size.mas_offset(CGSizeMake(LineW(54), LineH(43)));
    }];

    //预约试听
   
    self.yuyueshitingLabel = [[UILabel alloc]init];
//    self.yuyueshitingLabel.text = @"预约试听";
    self.yuyueshitingLabel.text = @"预约成功 !";
    self.yuyueshitingLabel.textColor = UICOLOR_FROM_HEX(0x4D4D4D);
    self.yuyueshitingLabel.font = Font(31);
    [self.notOrderView addSubview:self.yuyueshitingLabel];
    
    [self.yuyueshitingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingImageView.mas_bottom).with.offset(LineY(20));
        make.centerX.mas_offset(self.notOrderView.centerX);
        make.height.mas_offset(LineH(31));
    }];
    
    
    //立即预约按钮
    
    self.yuyueshitingButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.yuyueshitingButton setTitle:@"立即预约" forState:(UIControlStateNormal)];
    [self.yuyueshitingButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.yuyueshitingButton.titleLabel.font = Font(16);
    self.yuyueshitingButton.backgroundColor = MainColor;
    
    //0 0 代表是4个边都是阴影
    self.yuyueshitingButton.layer.shadowOffset = CGSizeMake(0, 0);
    self.yuyueshitingButton.layer.shadowOpacity = LineW(0.8);
    self.yuyueshitingButton.layer.shadowRadius = LineW(3);
    self.yuyueshitingButton.layer.cornerRadius = LineW(20);
    self.yuyueshitingButton.layer.shadowColor =  MainColor.CGColor;
    self.yuyueshitingButton.clipsToBounds = NO;
    [self.notOrderView addSubview:self.yuyueshitingButton];
    
    
    
    [self.yuyueshitingButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingLabel.mas_bottom).with.offset(LineH(20));
        make.bottom.equalTo(self.notOrderView.mas_bottom).with.offset(-LineH(20));
        make.centerX.mas_equalTo(self.notOrderView.mas_centerX);
        make.width.mas_offset(LineW(150));
    }];
   */
    
    //预约试听
    /*
    self.contactTeacherCallsLabel = [[UILabel alloc]init];
    self.contactTeacherCallsLabel.numberOfLines = 0;
    
    NSString *string = @"马上会有老师联系您，请保持电话畅通\n或拨打 400-8787-286";
    //富文本对象
    NSMutableAttributedString *succeedString = [[NSMutableAttributedString alloc]initWithString:string];
    [succeedString addAttribute:NSForegroundColorAttributeName
                             value:MainColor
                             range:NSMakeRange(22, 12)];
    self.contactTeacherCallsLabel.font = Font(16);
    self.contactTeacherCallsLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    //设置行间距
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:LineH(0.5)];
    [succeedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    self.contactTeacherCallsLabel.attributedText = succeedString;
    self.contactTeacherCallsLabel.textAlignment = NSTextAlignmentCenter;
    [self.notOrderView addSubview:self.contactTeacherCallsLabel];
    
    [self.contactTeacherCallsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingLabel.mas_bottom).with.offset(LineY(20));
        make.bottom.equalTo(self.notOrderView.mas_bottom).with.offset(-LineY(20));
        make.left.equalTo(self.notOrderView.mas_left).with.offset(LineX(37));
        make.right.equalTo(self.notOrderView.mas_right).with.offset(-LineX(37));
    }];
   */
    
    /*
    //测评报告
    self.testReportLabel = [[UILabel alloc]init];
    self.testReportLabel.text = @"外教老师正在完成测评报告，请等待...";
    self.testReportLabel.font = Font(16);
    self.testReportLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    self.testReportLabel.textAlignment = NSTextAlignmentCenter;
    [self.notOrderView addSubview:self.testReportLabel];
    
    [self.testReportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yuyueshitingImageView.mas_bottom).with.offset(LineY(30));
        make.left.equalTo(self.notOrderView.mas_left).with.offset(0);
        make.right.equalTo(self.notOrderView.mas_right).with.offset(-0);
        make.height.mas_offset(LineH(16));
    }];

    
    //测评报告按钮
    self.testReportButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.testReportButton setTitle:@"测评报告" forState:(UIControlStateNormal)];
    [self.testReportButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.testReportButton.titleLabel.font = Font(16);
    self.testReportButton.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
//    self.testReportButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    
    self.testReportButton.layer.cornerRadius = LineW(17);
    self.testReportButton.layer.masksToBounds = YES;
//    self.testReportButton.layer.borderWidth = LineW(0.5);
//    self.testReportButton.layer.borderColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    [self.notOrderView addSubview:self.testReportButton];
    
    
    //咨询客服
    self.consultingServiceButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.consultingServiceButton setTitle:@"咨询客服" forState:(UIControlStateNormal)];
    [self.consultingServiceButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:(UIControlStateNormal)];
    self.consultingServiceButton.titleLabel.font = Font(16);
    self.consultingServiceButton.backgroundColor = [UIColor whiteColor];
    
    self.consultingServiceButton.layer.cornerRadius = LineW(17);
    self.consultingServiceButton.layer.masksToBounds = YES;
    self.consultingServiceButton.layer.borderWidth = LineW(0.5);
    self.consultingServiceButton.layer.borderColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    [self.notOrderView addSubview:self.consultingServiceButton];
    
    CGFloat lW = (SCREEN_WIDTH() - LineW(314))/2;
    [self.testReportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testReportLabel.mas_bottom).with.offset(LineH(30));
        make.right.equalTo(self.consultingServiceButton.mas_left).with.offset(-LineW(32));
        make.left.equalTo(self.notOrderView.mas_left).with.offset(lW);
        make.size.mas_offset(CGSizeMake(LineW(131), LineH(34)));
    }];
    
    
    
    [self.consultingServiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.testReportLabel.mas_bottom).with.offset(LineH(30));
        make.left.equalTo(self.testReportButton.mas_right).with.offset(LineW(32));
        make.right.equalTo(self.notOrderView.mas_right).with.offset(-lW);
        make.size.mas_offset(CGSizeMake(LineW(131), LineH(34)));
    }];
    */
    
    
    
    /*
    self.leverView = [[UIView alloc]init];
//    self.leverView.layer.masksToBounds = YES;
    self.leverView.layer.cornerRadius = LineW(52.5);
    self.leverView.layer.shadowOffset =  CGSizeMake(LineX(1), LineY(1));
    self.leverView.layer.shadowOpacity = LineW(0.8);
    self.leverView.layer.shadowColor =  UICOLOR_FROM_HEX(kThemeColor).CGColor;
    self.leverView.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
    [self.notOrderView addSubview:self.leverView];
    
    [self.leverView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.notOrderView.mas_centerX);
        make.top.equalTo(self.notOrderView.mas_top).with.offset(LineY(18));
        make.size.mas_equalTo(CGSizeMake(LineW(105), LineW(105)));
    }];
    
    
    
    self.leverLabel = [[UILabel alloc]init];
    self.leverLabel.font = Font(16);
    self.leverLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.leverLabel.textAlignment = NSTextAlignmentCenter;
    self.leverLabel.text = @"Level 1";
    [self.notOrderView addSubview:self.leverLabel];
    
    [self.leverLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.leverView.mas_centerY).with.offset(-0);
        make.left.equalTo(self.leverView.mas_left).with.offset(0);
        make.right.equalTo(self.leverView.mas_right).with.offset(-0);
        make.size.mas_offset(CGSizeMake(LineW(105), LineH(17)));
    }];
    
    UILabel *currentLabel = [[UILabel alloc]init];
    currentLabel.numberOfLines = 0;
    currentLabel.font = Font(10);
    currentLabel.textColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    currentLabel.textAlignment = NSTextAlignmentCenter;
    currentLabel.text = @"当前英语水平";
    [self.notOrderView addSubview:currentLabel];
    
    [currentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leverView.mas_centerY).with.offset(0);
        make.left.equalTo(self.leverView.mas_left).with.offset(0);
        make.right.equalTo(self.leverView.mas_right).with.offset(-0);
        make.size.mas_offset(CGSizeMake(LineW(105), LineH(11)));
        
    }];
    
    
    //测评报告按钮
    self.testReportButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.testReportButton setTitle:@"测评报告" forState:(UIControlStateNormal)];
    [self.testReportButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.testReportButton.titleLabel.font = Font(16);
    self.testReportButton.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
    //    self.testReportButton.backgroundColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    
    self.testReportButton.layer.cornerRadius = LineW(17);
    self.testReportButton.layer.masksToBounds = YES;
    //    self.testReportButton.layer.borderWidth = LineW(0.5);
    //    self.testReportButton.layer.borderColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    [self.notOrderView addSubview:self.testReportButton];
    
    
    //咨询客服
    self.consultingServiceButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.consultingServiceButton setTitle:@"咨询客服" forState:(UIControlStateNormal)];
    [self.consultingServiceButton setTitleColor:UICOLOR_FROM_HEX(kThemeColor) forState:(UIControlStateNormal)];
    self.consultingServiceButton.titleLabel.font = Font(16);
    self.consultingServiceButton.backgroundColor = [UIColor whiteColor];
    
    self.consultingServiceButton.layer.cornerRadius = LineW(17);
    self.consultingServiceButton.layer.masksToBounds = YES;
    self.consultingServiceButton.layer.borderWidth = LineW(0.5);
    self.consultingServiceButton.layer.borderColor = UICOLOR_FROM_HEX(kThemeColor).CGColor;
    [self.notOrderView addSubview:self.consultingServiceButton];
    
    CGFloat lW = (SCREEN_WIDTH() - LineW(314))/2;
    [self.testReportButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leverView.mas_bottom).with.offset(LineH(18));
        make.right.equalTo(self.consultingServiceButton.mas_left).with.offset(-LineW(32));
        make.left.equalTo(self.notOrderView.mas_left).with.offset(lW);
        make.size.mas_offset(CGSizeMake(LineW(131), LineH(34)));
    }];
    
    
    
    [self.consultingServiceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.leverView.mas_bottom).with.offset(LineH(18));
        make.left.equalTo(self.testReportButton.mas_right).with.offset(LineW(32));
        make.right.equalTo(self.notOrderView.mas_right).with.offset(-lW);
        make.size.mas_offset(CGSizeMake(LineW(131), LineH(34)));
    }];
*/
    
    /***************************已预约view***************************************************/
    self.orderView = [[UIView alloc]init];
    [self.backgroundImageView addSubview:self.orderView];
    
    [self.orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.backgroundImageView.mas_left).with.offset(0);
        make.right.equalTo(self.backgroundImageView.mas_right).with.offset(-0);
        make.top.equalTo(self.backgroundImageView.mas_top).with.offset(LineY(70));
        make.bottom.equalTo(self.backgroundImageView.mas_bottom).with.offset(0);
    }];
    
    
    //课程日期
    self.courseTimeLabel = [[UILabel alloc]init];
    self.courseTimeLabel.font = Font(16);
    self.courseTimeLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.courseTimeLabel.textAlignment = NSTextAlignmentLeft;
    self.courseTimeLabel.text = @"今日（周三）13：00 体验课";
    [self.orderView addSubview:self.courseTimeLabel];
    
   
    
    
    //课程状态
    self.statusLabel = [[UILabel alloc]init];
    self.statusLabel.font = Font(11);
    self.statusLabel.textColor = UICOLOR_FROM_HEX(kThemeColor);
    self.statusLabel.textAlignment = NSTextAlignmentCenter;
    [self.orderView addSubview:self.statusLabel];

    
    //课程状态的img  未开始:weikaishi_kebiao 91 89
    self.statusImgView = [[UIImageView alloc]init];
    [self.orderView addSubview:self.statusImgView];

    
    /******************************未开始******************************/
//    [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
//        make.left.equalTo(self.orderView.mas_left).with.offset(LineX(15));
//        make.right.equalTo(self.statusLabel.mas_left).with.offset(-0);
//        make.height.mas_offset(LineH(16));
//    }];
//    
//    
//    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(32));
//        make.left.equalTo(self.courseTimeLabel.mas_right).with.offset(0);
//        make.right.equalTo(self.statusImgView.mas_left).with.offset(-0);
//        make.size.mas_offset(CGSizeMake(0, 0));
//    }];
//    
//
//    self.statusImgView.image = UIIMAGE_FROM_NAME(@"weikaishi_kebiao");
//    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(15));
//        make.right.equalTo(self.orderView.mas_right).with.offset(-LineW(15));
//        make.size.mas_offset(CGSizeMake(LineW(45.5), LineH(44.5)));
//    }];
    /******************************倒计时******************************/
//    [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
//        make.left.equalTo(self.orderView.mas_left).with.offset(LineX(15));
//        make.right.equalTo(self.statusLabel.mas_left).with.offset(-LineW(5));
//        make.height.mas_offset(LineH(16));
//    }];
//    
//    self.statusLabel.text = @"09分56秒";
//    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(33));
//        make.left.equalTo(self.courseTimeLabel.mas_right).with.offset(LineW(5));
//        make.right.equalTo(self.statusImgView.mas_left).with.offset(-LineW(5));
//        make.height.mas_offset(LineH(12));
//    }];
//    
//    
//    self.statusImgView.image = UIIMAGE_FROM_NAME(@"daojishi_kechenliebiao_zhuangtai");
//    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
//        make.right.equalTo(self.orderView.mas_right).with.offset(-LineW(15));
//        make.size.mas_offset(CGSizeMake(LineW(16), LineH(18)));
//    }];
//    
    /******************************正在上课******************************/
//    [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
//        make.left.equalTo(self.orderView.mas_left).with.offset(LineX(15));
//        make.right.equalTo(self.statusLabel.mas_left).with.offset(-LineW(5));
//        make.height.mas_offset(LineH(16));
//    }];
//    
//    
//    self.statusLabel.text = @"正在上课";
//    [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(33));
//        make.left.equalTo(self.courseTimeLabel.mas_right).with.offset(LineW(5));
//        make.right.equalTo(self.statusImgView.mas_left).with.offset(-LineW(5));
//        make.height.mas_offset(LineH(12));
//    }];
//    
//    
//    self.statusImgView.image = UIIMAGE_FROM_NAME(@"daojishi_kechenliebiao_zhuangtai");
//    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
//        make.right.equalTo(self.orderView.mas_right).with.offset(-LineW(15));
//        make.size.mas_offset(CGSizeMake(LineW(16), LineH(18)));
//    }];
//    
    
    
    /******************************未出席******************************/
  
        [self.courseTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.orderView.mas_top).with.offset(LineH(30));
            make.left.equalTo(self.orderView.mas_left).with.offset(LineX(15));
            make.right.equalTo(self.statusLabel.mas_left).with.offset(-0);
            make.height.mas_offset(LineH(16));
        }];
    
    
        self.statusLabel.text = @"未出席";
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.orderView.mas_top).with.offset(LineH(32));
            make.left.equalTo(self.courseTimeLabel.mas_right).with.offset(0);
            make.right.equalTo(self.statusImgView.mas_left).with.offset(-0);
            make.height.mas_offset(LineH(12));
        }];
    
    
        self.statusImgView.image = UIIMAGE_FROM_NAME(@"yiwancheng_kecheng_zhuangtai");
        [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.orderView.mas_top).with.offset(LineH(15));
            make.right.equalTo(self.orderView.mas_right).with.offset(-LineW(15));
            make.size.mas_offset(CGSizeMake(LineW(45.5), LineH(44.5)));
        }];
    
    
    
    //头像
    self.teacherIconImgView = [[UIImageView alloc]init];
    self.teacherIconImgView.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
    self.teacherIconImgView.layer.cornerRadius = LineW(30);
    self.teacherIconImgView.layer.masksToBounds = YES;
    self.teacherIconImgView.layer.borderWidth = LineW(0.5);
    self.teacherIconImgView.layer.borderColor = UICOLOR_FROM_HEX(ColorF2F2F2).CGColor;
    [self.orderView addSubview:self.teacherIconImgView];
    
    [self.teacherIconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderView.mas_left).with.offset(LineX(15));
        make.top.equalTo(self.orderView.mas_top).with.offset(LineH(75));
        make.size.mas_offset(CGSizeMake(LineW(60), LineW(60)));
    }];
    
    //课程的第几节
    self.lessonsLabel = [[UILabel alloc]init];
    self.lessonsLabel.font = Font(14);
    self.lessonsLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.lessonsLabel.textAlignment = NSTextAlignmentLeft;
    self.lessonsLabel.text = @"Get Ready 2 Get Ready2_01";
    [self.orderView addSubview:self.lessonsLabel];
    
    [self.lessonsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teacherIconImgView.mas_top).with.offset(LineH(10));
        make.left.equalTo(self.teacherIconImgView.mas_right).with.offset(LineX(10));
        make.right.equalTo(self.orderView.mas_right).with.offset(-0);
        make.height.mas_offset(LineH(16));
    }];
    
    
    //教师名字
    self.teacherNameLabel = [[UILabel alloc]init];
    self.teacherNameLabel.font = Font(12);
    self.teacherNameLabel.textColor = UICOLOR_FROM_HEX(Color333333);
    self.teacherNameLabel.textAlignment = NSTextAlignmentLeft;
    self.teacherNameLabel.text = @"XieHenry";
    [self.orderView addSubview:self.teacherNameLabel];
    
    [self.teacherNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lessonsLabel.mas_bottom).with.offset(LineH(20));
        make.left.equalTo(self.teacherIconImgView.mas_right).with.offset(LineX(10));
        make.right.equalTo(self.orderView.mas_right).with.offset(-0);
        make.height.mas_offset(LineH(14));
    }];
    
    
    //进入教室
    self.enterRoomButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.enterRoomButton setTitle:@"进入教室" forState:(UIControlStateNormal)];
    [self.enterRoomButton setTitleColor:UICOLOR_FROM_HEX(ColorFFFFFF) forState:(UIControlStateNormal)];
    self.enterRoomButton.titleLabel.font = Font(10);
    self.enterRoomButton.backgroundColor = UICOLOR_FROM_HEX(kThemeColor);
    
    //0 0 代表是4个边都是阴影
    self.enterRoomButton.layer.shadowOffset = CGSizeMake(0, 0);
    self.enterRoomButton.layer.shadowOpacity = LineW(0.8);
    self.enterRoomButton.layer.shadowRadius = LineW(1);
    self.enterRoomButton.layer.cornerRadius = LineW(12.5);
    self.enterRoomButton.layer.shadowColor =  UICOLOR_FROM_HEX(kThemeColor).CGColor;
    self.enterRoomButton.clipsToBounds = NO;
    [self.orderView addSubview:self.enterRoomButton];
    
    [self.enterRoomButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.teacherIconImgView.mas_bottom).with.offset(-0);
        make.right.equalTo(self.orderView.mas_right).with.offset(-LineW(15));
        make.size.mas_offset(CGSizeMake(LineW(65), LineH(25)));
    }];
    
    
    
    //官网地址
    self.webAddressLabel = [[UILabel alloc]init];
    self.webAddressLabel.font = Font(11);
    self.webAddressLabel.textColor = UICOLOR_FROM_HEX(ColorCCCCCC);
    self.webAddressLabel.textAlignment = NSTextAlignmentCenter;
    self.webAddressLabel.text = @"电脑上课请登录官网:www.gogo-talk.com";
    [self.orderView addSubview:self.webAddressLabel];
    
    [self.webAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.orderView.mas_bottom).with.offset(-LineH(15));
        make.centerX.mas_equalTo(self.orderView.mas_centerX);
        make.height.mas_offset(LineH(13));
    }];

    
    
    
    
    
}

- (void)getStasus:(NSString *)statusStr {
    
}

@end
