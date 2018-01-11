//
//  GGT_MineViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_MineViewController.h"
#import "GGT_UserInfo.h"
#import "GGT_SettingTableViewCell.h"
#import "GGT_InfoListViewController.h"
#import "GGT_UserSettingController.h"
#import "GGT_FeedbackController.h"
#import "GGT_OrderCourseOfFocusViewController.h"

@interface GGT_MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *infoArray;
@property(nonatomic, strong) NSArray *infoArray2;
@property(nonatomic, strong) GGT_UserInfo *userIfnoView;
@end

@implementation GGT_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置导航
    [self setNav];
    
    //设置用户信息
    [self setUserInfo];
    
    
    
    
    /*--------------------虚拟数据start----------------------  */
//    self.isVIP = true;
//    NSMutableArray *mArray = [NSMutableArray array];
//    NSDictionary *dic1 = @{@"icon":@"keshi_wodeliebiao",@"title":@"我的课时",@"subtitle":@"剩余120课时，有效期至2019.03.12"};
//    NSDictionary *dic2 =@{@"icon":@"guanzhu_wode_liebiao",@"title":@"关注外教",@"subtitle":@"14位"};
//    NSDictionary *dic3 = @{@"icon":@"dingdan_wode_liebiao",@"title":@"我的订单",@"subtitle":@""};
//    NSDictionary *dic4 = @{@"icon":@"pingce_wode_liebiao",@"title":@"测评报告",@"subtitle":@""};
//    [mArray addObject:dic1];
//    [mArray addObject:dic2];
//    [mArray addObject:dic3];
//    [mArray addObject:dic4];
//    self.infoArray = mArray;
//    NSMutableArray *mArray2 = [NSMutableArray array];
//    NSDictionary *dic5 = @{@"icon":@"yijianfankv_wode_liebiao",@"title":@"意见反馈",@"subtitle":@""};
//    NSDictionary *dic6 =@{@"icon":@"shezhi_wode_biebiao",@"title":@"设置",@"subtitle":@""};
//    [mArray2 addObject:dic5];
//    [mArray2 addObject:dic6];
//    self.infoArray2 = mArray2;
//    /*--------------------虚拟数据end----------------------  */
//
//    [self setUserInfo];
//    //用户设置tableView
//    [self userSetting];
    
    
    
}


//设置用户信息
-(void)setUserInfo {
    GGT_UserInfo *userInfo = [GGT_UserInfo new];
    userInfo.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:userInfo];
    
    [userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).offset(0);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(LineH(176));
    }];
    
//    @weakify(self);
//    [[self.userIfnoView.headerButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
//        @strongify(self);
//        GGT_InfoListViewController *infoController = [GGT_InfoListViewController new];
//        [self.navigationController pushViewController:infoController animated:YES];
//    }];
}


#pragma mark 导航
- (void)setNav {
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"我的";
    //隐藏导航下的黑线
    [self.navigationController.navigationBar  setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}


/*

//设置item
-(void)userSetting
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    
    [self.tableView registerClass:[GGT_SettingTableViewCell class] forCellReuseIdentifier:@"settingCell"];
    self.tableView.backgroundColor = [UIColor clearColor];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(LineY(98));
        make.left.equalTo(self.view.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.view.mas_right).with.offset(LineX(-10));
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0){
        return 4;
    }else{
        return 2;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GGT_SettingTableViewCell *cell = [GGT_SettingTableViewCell cellWithTableView:tableView forIndexPath:indexPath];
    if(cell == nil){
        cell = [[GGT_SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
    }
    
    if(indexPath.row == 0 && indexPath.section == 0){
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if(indexPath.row == 0){
        [cell xc_SetCornerWithSideType:XCSideTypeTopLine cornerRadius:5.0];
        
    }
    if((indexPath.section == 0 && indexPath.row == 3) || (indexPath.section == 1 && indexPath.row == 1)){
        [cell xc_SetCornerWithSideType:XCSideTypeBottomLine cornerRadius:5.0];
    }
    if((indexPath.section == 0 && indexPath.row==3) || (indexPath.section == 1 && indexPath.row==1)){
        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
    }
    if(indexPath.section == 0){
        cell.infoDic = self.infoArray[indexPath.row];
    }
    if(indexPath.section == 1){
        cell.infoDic = self.infoArray2[indexPath.row];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 0.01;
    }else{
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //返回后cell不选中
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.section) {
        case 0: //第一段
            switch (indexPath.row) {
                case 0: //我的课时
                    
                    break;
                case 1: //关注外教
                {
                    GGT_OrderCourseOfFocusViewController *vc = [[GGT_OrderCourseOfFocusViewController alloc]init];
                    vc.hidesBottomBarWhenPushed = YES;
                    vc.isSecondVc = YES;
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 2: //我的订单
                    
                    break;
                case 3: //测评报告
                    
                    break;
                default:
                    break;
            }
            break;
            
        case 1: //第二段
            switch (indexPath.row) {
                case 0: //意见反馈
                {
                    GGT_FeedbackController *vc = [GGT_FeedbackController new];
                    vc.title = @"意见反馈";
                    [self.navigationController pushViewController:vc animated:YES];
                }
                    break;
                case 1://进入设置页面
                {
                    GGT_UserSettingController *vc = [GGT_UserSettingController new];
                    vc.title = @"设置";
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
 */
@end
