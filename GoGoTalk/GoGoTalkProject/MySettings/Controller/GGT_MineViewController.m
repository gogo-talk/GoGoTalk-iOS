//
//  GGT_MineViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_MineViewController.h"
#import "GGT_UserInfo.h"
#import "GGT_MineHomeCell.h"
#import "GGT_InfoListViewController.h"
#import "GGT_UserSettingController.h"
#import "GGT_MyClassTimeViewController.h"
#import "GGT_MyRreportViewController.h"

@interface GGT_MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSMutableArray *infoArray;
@end

@implementation GGT_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置导航
    [self setNav];
    
    //设置用户信息
    [self setUserInfo];

    
    [self getLoadData];
}

- (void)getLoadData {
    NSMutableArray *mArray = [NSMutableArray array];
    NSDictionary *dic1 = @{@"icon":@"keshi_wodeliebiao",@"title":@"我的课时",@"subtitle":@"剩余120课时"};
    NSDictionary *dic2 = @{@"icon":@"pingce_wode_liebiao",@"title":@"我的报告",@"subtitle":@""};
    NSDictionary *dic3 = @{@"icon":@"dingdan_wode_liebiao",@"title":@"我的订单",@"subtitle":@""};
    [mArray addObject:dic1];
    [mArray addObject:dic2];
    [mArray addObject:dic3];
    
    
    NSMutableArray *mArray2 = [NSMutableArray array];
    NSDictionary *dic5 = @{@"icon":@"yijianfankv_wode_liebiao",@"title":@"新手指导",@"subtitle":@""};
    NSDictionary *dic6 =@{@"icon":@"shezhi_wode_biebiao",@"title":@"设置",@"subtitle":@""};
    [mArray2 addObject:dic5];
    [mArray2 addObject:dic6];
    
    self.infoArray = [NSMutableArray array];
    self.infoArray = [NSMutableArray arrayWithObjects:mArray,mArray2, nil];
    [self.tableView reloadData];
    
}



//设置用户信息
-(void)setUserInfo {
    GGT_UserInfo *userInfo = [GGT_UserInfo new];
    [self.view addSubview:userInfo];
    
    [userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(LineH(176));
    }];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userInfo.mas_bottom).with.offset(LineY(10));
        make.left.equalTo(self.view.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.view.mas_right).with.offset(LineX(-10));
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    
    
    @weakify(self);
    [[userInfo.headerControl rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        GGT_InfoListViewController *infoController = [[GGT_InfoListViewController alloc]init];
        infoController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:infoController animated:YES];
    }];
}


#pragma mark 导航
- (void)setNav {
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"我的";
    //隐藏导航下的黑线
    [self.navigationController.navigationBar  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}


#pragma mark - Table view data source
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 3;
    }else{
        return 2;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellStr = @"GGT_MineHomeCell";
    GGT_MineHomeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[GGT_MineHomeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.leftImgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[self.infoArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row][@"icon"]]];
    cell.leftLabel.text = [[self.infoArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row][@"title"];
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.rightLabel.text = [[self.infoArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row][@"subtitle"];
    }

    //对cell进行裁角
    if (indexPath.row == 0) {
        [self cornCell:cell sideType:UIRectCornerTopLeft|UIRectCornerTopRight];
    } else if (indexPath.row == [[self.infoArray safe_objectAtIndex:indexPath.section] count] - 1) {
        [self cornCell:cell sideType:UIRectCornerBottomLeft|UIRectCornerBottomRight];
        cell.lineView.hidden = YES;
    }

    return cell;
}

- (void)cornCell:(UITableViewCell *)cell sideType:(UIRectCorner)corners{
    CGSize cornerSize = CGSizeMake(LineW(5),LineH(5));
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, _tableView.width,LineH(49)) byRoundingCorners:corners cornerRadii:cornerSize];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, _tableView.width, LineH(49));
    maskLayer.path = maskPath.CGPath;
    cell.layer.mask = maskLayer;
    [cell.layer setMasksToBounds:YES];
}



-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return 0.01;
    } else if(section == 1){
        return LineY(10);
    }
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, LineY(10))];
        return headerView;
    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(49);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: //第一段
            switch (indexPath.row) {
                case 0: //我的课时
                {
                    GGT_MyClassTimeViewController *vc = [[GGT_MyClassTimeViewController alloc] init];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 1: //我的报告
                {
                    GGT_MyRreportViewController *vc = [[GGT_MyRreportViewController alloc] init];
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 2: //我的订单
                    
                    break;
                default:
                    break;
            }
            break;
            
        case 1: //第二段
            switch (indexPath.row) {
                case 0: //新手指导

                    break;
                case 1://进入设置页面
                {
                    GGT_UserSettingController *vc = [[GGT_UserSettingController alloc]init];
                    vc.title = @"设置";
                    vc.hidesBottomBarWhenPushed = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
    
}

@end
