//
//  GGT_HomeReservationViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeReservationViewController.h"
#import "GGT_MineViewController.h"
//普通用户banner
#import "GGT_HomeBannerTableViewCell.h"
#import "GGT_HomeCommonCenterCell.h"

//Vip
#import "GGT_VipInfoHeaderCell.h"
#import "GGT_VipCurrentStatusCell.h"
#import "GGT_VipPastStateCell.h"

//睡前故事
#import "GGT_HomeBedtimeStoryCell.h"

#import "GGT_BookExperienceClassViewController.h"

@interface GGT_HomeReservationViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation GGT_HomeReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置导航
    [self initNavigationBar];
    
    
    [self initTableView];
}


- (void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-64-49) style:(UITableViewStyleGrouped)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //    self.tableView.estimatedRowHeight = 44.0;
    
    
    NSArray *a1 = @[@"1"];
    NSArray *a2 = @[@"2"];
    NSArray *a3 = @[@"3"];
    //    NSArray *a4 = @[@"4",@"4"];
    //普通用户
    self.dataArray = [NSMutableArray arrayWithObjects:a1,a2,a3, nil];
    //vip
    //    self.dataArray = [NSMutableArray arrayWithObjects:a1,a2,a3,a4, nil];
    
    [self.tableView reloadData];
    
    
}

#pragma mark tableview的delegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /***************普通用户*******************/
    if (indexPath.section == 0) {
        GGT_HomeBannerTableViewCell *bannerCell = [tableView dequeueReusableCellWithIdentifier:@"banner"];
        if (!bannerCell) {
            bannerCell= [[GGT_HomeBannerTableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"banner"];
        }
        bannerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return bannerCell;
        
    } else if (indexPath.section == 1) {
        GGT_HomeCommonCenterCell *commonCell = [tableView dequeueReusableCellWithIdentifier:@"homeCommonCenter"];
        if (!commonCell) {
            commonCell= [[GGT_HomeCommonCenterCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"homeCommonCenter"];
        }
        commonCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        //获取不同的状态
        //            [commonCell getStasus:@"1"];
        
        return commonCell;
        
    } else if (indexPath.section == 2){
        GGT_HomeBedtimeStoryCell *bedtimeCell = [tableView dequeueReusableCellWithIdentifier:@"BedtimeStory"];
        if (!bedtimeCell) {
            bedtimeCell= [[GGT_HomeBedtimeStoryCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"BedtimeStory"];
        }
        bedtimeCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return bedtimeCell;
    }
    
    
    
    /***************Vip*******************/
    //    if (indexPath.section == 0) {
    //        GGT_VipInfoHeaderCell *vipInfoHeaderCell = [tableView dequeueReusableCellWithIdentifier:@"vipHeader"];
    //        if (!vipInfoHeaderCell) {
    //            vipInfoHeaderCell= [[GGT_VipInfoHeaderCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"vipHeader"];
    //        }
    //        vipInfoHeaderCell.selectionStyle = UITableViewCellSelectionStyleNone;
    //
    //        //迟到次数
    //        vipInfoHeaderCell.lateCountLabel.text = @"1";
    //
    //        //已学时长
    //        vipInfoHeaderCell.learnTimeLabel.text = @"2";
    //
    //        //缺席次数
    //        vipInfoHeaderCell.missCountLabel.text = @"3";
    //
    //
    //
    //
    //
    //        return vipInfoHeaderCell;
    //
    //    } else if (indexPath.section == 1) {
    //        GGT_VipCurrentStatusCell *vipCurrentStatusCell = [tableView dequeueReusableCellWithIdentifier:@"vipCurrent"];
    //        if (!vipCurrentStatusCell) {
    //            vipCurrentStatusCell= [[GGT_VipCurrentStatusCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"vipCurrent"];
    //        }
    //        vipCurrentStatusCell.selectionStyle = UITableViewCellSelectionStyleNone;
    //
    //
    //
    //        return vipCurrentStatusCell;
    //
    //    } else if (indexPath.section == 2){
    //        GGT_VipPastStateCell *vipPastStateCell = [tableView dequeueReusableCellWithIdentifier:@"vipPastState"];
    //        if (!vipPastStateCell) {
    //            vipPastStateCell= [[GGT_VipPastStateCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"vipPastState"];
    //        }
    //        vipPastStateCell.selectionStyle = UITableViewCellSelectionStyleNone;
    //
    //        return vipPastStateCell;
    //
    //    }else if (indexPath.section == 3) {
    //        GGT_HomeBedtimeStoryCell *bedtimeCell = [tableView dequeueReusableCellWithIdentifier:@"BedtimeStory"];
    //        if (!bedtimeCell) {
    //            bedtimeCell= [[GGT_HomeBedtimeStoryCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"BedtimeStory"];
    //        }
    //        bedtimeCell.selectionStyle = UITableViewCellSelectionStyleNone;
    //
    //        return bedtimeCell;
    //
    //    }
    //
    
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /***************普通用户*******************/
    if (indexPath.section == 0) {
        //        GGT_HomeBannerTableViewCell *bannerCell = [_tableView cellForRowAtIndexPath:indexPath];
        
        
    } else if (indexPath.section == 1) {
        //        GGT_HomeCommonCenterCell *commonCell = [_tableView cellForRowAtIndexPath:indexPath];
        
        //立即预约
        //        @weakify(self);
        //        [[commonCell.yuyueshitingButton rac_signalForControlEvents:UIControlEventTouchUpInside]
        //         subscribeNext:^(id x) {
        //             @strongify(self);
        GGT_BookExperienceClassViewController *vc = [[GGT_BookExperienceClassViewController alloc]init];
        vc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        //         }];
        
        
        
    } else if (indexPath.section == 2){
        //        GGT_HomeBedtimeStoryCell *bedtimeCell = [_tableView cellForRowAtIndexPath:indexPath];
        
    }
    
    
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count] ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //普通用户中，banner的上下高度都包括，是120，中间部分是图片,高度大小为355*258。高度为268。睡前故事
    if (indexPath.section == 0) {
        
        return LineH(100);
        
    } else if (indexPath.section == 1) {
        
        return LineH(258);
        
    } else {
        return LineH(120);
    }
    
    
    //vip
    //    if (indexPath.section == 0) {
    //
    //        return LineH(70);
    //
    //    } else if (indexPath.section == 1) {
    //
    //        return LineH(142);
    //    } else  if(indexPath.section == 2){
    //        //缺席
    //        //        return LineH(135);
    //
    //        return LineH(155);
    //    } else {
    //
    //        return LineH(120);
    //    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    //普通用户
    if (section == 0) {
        return LineH(10);
    }else if (section == 1) {
        return LineH(5);
        
    }else if (section == 2) {
        return LineH(34);
    }
    return 0.0000001;
    
    //Vip
    //    if (section == 0) {
    //
    //        return LineH(10);
    //    }else if (section == 1) {
    //
    //        return LineH(5);
    //    }else if (section == 2) {
    //
    //        return LineH(5);
    //    }else if (section == 3) {
    //
    //        return LineH(34);
    //    }
    //    return 0.0000001;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    //普通用户
    if (section == 0) {
        return LineH(5);
    }else if (section == 1) {
        return LineH(10);
    }else if (section == 2) {
        return LineH(20);
    }
    return 0.0000001;
    
    //Vip
    //    if (section == 0) {
    //
    //        return LineH(5);
    //    } else if (section == 1) {
    //
    //        return LineH(5);
    //    } else if (section == 2) {
    //
    //        return LineH(10);
    //    } else if (section == 3) {
    //
    //        return LineH(20);
    //    }
    //    return 0.0000001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //普通用户 section == 2
    //Vip section == 3
    if (section == 2) {
        UIView *headerView = [[UIView alloc]init];
        headerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
        headerView.frame = CGRectMake(0, 0, SCREEN_WIDTH(), LineH(34));
        
        
        UIView *titleView = [[UIView alloc]init];
        titleView.backgroundColor = [UIColor whiteColor];
        titleView.frame = CGRectMake(LineX(10), 0, SCREEN_WIDTH()-LineW(20), LineH(34));
        [headerView addSubview:titleView];
        
        //对上部分左右切圆
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:titleView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(LineW(5),LineW(5))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = titleView.bounds;
        maskLayer.path = maskPath.CGPath;
        titleView.layer.mask = maskLayer;
        
        //icon
        UIImageView *iconImgView = [[UIImageView alloc]init];
        iconImgView.frame = CGRectMake(LineX(10), LineY(15), LineW(13), LineW(13));
        iconImgView.image = UIIMAGE_FROM_NAME(@"shuiqiangushi_title");
        [titleView addSubview:iconImgView];
        
        //睡前故事
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(iconImgView.x+iconImgView.width+LineX(10), LineY(15), LineW(200), LineH(15))];
        titleLabel.text = @"睡前故事";
        titleLabel.font = Font(14);
        titleLabel.textColor = UICOLOR_FROM_HEX(Color666666);
        [titleView addSubview:titleLabel];
        
        
        return headerView;
    }
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    //普通用户 section == 2
    //Vip section == 3
    if (section == 2) {
        UIView *footerView = [[UIView alloc]init];
        footerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
        footerView.frame = CGRectMake(0, 0, SCREEN_WIDTH(), LineH(10));
        
        
        UIView *titleView = [[UIView alloc]init];
        titleView.backgroundColor = [UIColor whiteColor];
        titleView.frame = CGRectMake(LineX(10), 0, SCREEN_WIDTH()-LineW(20), LineH(10));
        [footerView addSubview:titleView];
        
        //对下部分左右切圆
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:titleView.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(LineW(5),LineW(5))];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = titleView.bounds;
        maskLayer.path = maskPath.CGPath;
        titleView.layer.mask = maskLayer;
        
        
        return footerView;
    }
    return nil;
}


/***********************************************************************/
#pragma mark 导航栏设置
- (void)initNavigationBar {
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    //左侧个人中心按钮
    [self initMineController];
    
    //导航上加logo
    UIView *loginView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, LineW(103.5), LineH(30.5))];
    UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, loginView.width, loginView.height)];
    logoImageView.image = UIIMAGE_FROM_NAME(@"logo_top");
    [loginView addSubview:logoImageView];
    self.navigationItem.titleView = loginView;
    
    //客服
    [self setRightButtonWithImg:@"kefu_top"];
}



#pragma 客服电话
- (void)rightAction {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"400-8787-276" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [cancelAction setValue:UICOLOR_FROM_HEX(kThemeColor) forKey:@"_titleTextColor"];
    
    __weak typeof(self) weakSelf = self;
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"呼叫" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf CallPhoneWithNum:phoneNumber];
    }];
    [defaultAction setValue:UICOLOR_FROM_HEX(0x666666) forKey:@"_titleTextColor"];
    
    
    [alert addAction:cancelAction];
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}



- (void)CallPhoneWithNum:(NSString *)phoneNum {
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",phoneNum]];
    UIWebView *phoneCallWebView = [[UIWebView alloc]initWithFrame:CGRectZero];
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}



@end
