//
//  GGT_UserSettingController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_UserSettingController.h"
#import "GGT_UserSettingCell.h"
#import "GGT_AboutUsController.h"
@interface GGT_UserSettingController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic, strong) UITableView *tableView;
//虚拟数据
@property(nonatomic, strong) NSMutableArray *array1;
@property(nonatomic, strong) NSMutableArray *array2;
@end

@implementation GGT_UserSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *infoArray = [NSMutableArray array];
    NSDictionary *dic1 = @{@"title":@"推送通知",@"subtitle":@1};
    NSDictionary *dic2 = @{@"title":@"清除缓存",@"subtitle":@12.8};
    NSDictionary *dic3 = @{@"title":@"软件版本",@"subtitle":@"V1.0"};
    NSDictionary *dic4 = @{@"title":@"前往AppStore评分",@"subtitle":@""};
    
    [infoArray addObject:dic1];
    [infoArray addObject:dic2];
    [infoArray addObject:dic3];
    [infoArray addObject:dic4];
    
    self.array1 = infoArray;
    NSMutableArray *infoArray2 = [NSMutableArray array];
    NSDictionary *dic5 = @{@"title":@"关于我们",@"subtitle":@""};
    [infoArray2 addObject:dic5];
    self.array2 = infoArray2;
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self createTableView];
    
}
-(void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.tableView setTableFooterView:view];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[GGT_UserSettingCell class] forCellReuseIdentifier:@"UserSettingCell"];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(LineH(10));
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.bottom.mas_equalTo(self.view.mas_bottom);
    }];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- tableViewDelegate,tableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 4;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGT_UserSettingCell *cell = [GGT_UserSettingCell cellWithTableView:tableView forIndexPath:indexPath];
    if(indexPath.section == 0){
        cell.dic = self.array1[indexPath.row];
    }else{
        cell.dic = self.array2[indexPath.row];
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return LineH(44);
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0){
        return 0.01;
    }else{
        return LineH(10);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if(section == 0){
        return 0.01;
    }else{
        return 88;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1){
        GGT_AboutUsController *us = [GGT_AboutUsController new];
        us.title = @"关于我们";
        [self.navigationController pushViewController:us animated:YES];
    }
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if(section == 1){
        UIView *footView = [[UIView alloc] init];
        footView.backgroundColor = [UIColor clearColor];
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
        [footView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footView.mas_top).with.offset(30);
            make.centerX.equalTo(footView.mas_centerX);
            make.width.mas_equalTo(LineW(313));
            make.height.mas_equalTo(LineH(44));
        }];
        [self.view layoutIfNeeded];
        [btn addBorderForViewWithBorderWidth:1.0 BorderColor:UICOLOR_FROM_HEX(kThemeColor) CornerRadius:LineH(44)/2.0];
        return footView;
    }
    return nil;
}

@end
