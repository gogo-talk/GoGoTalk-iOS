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
@interface GGT_MineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation GGT_MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isVIP = true;
    
    [self setNavigationStyle];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setLeftBackButton];
    [self setUserInfo];
    //用户设置tableView
    [self userSetting];
    
}
//设置导航栏样式
-(void)setNavigationStyle
{
    self.navigationItem.title = @"我的";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fanhui_top"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationController.navigationBar.barTintColor = UICOLOR_FROM_HEX(0xEA5851);
    self.navigationController.navigationBar.translucent = NO;
}
//设置用户信息
-(void)setUserInfo
{
    GGT_UserInfo *userInfo = [GGT_UserInfo new];
    [self.view addSubview:userInfo];
    [userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(LineH(168));
    }];
}
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
        make.height.mas_equalTo(LineH(304));
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
//    GGT_SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCell"forIndexPath:indexPath];
//    if(cell == nil){
//        cell = [[GGT_SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"settingCell"];
//    }
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//    if(indexPath.row == 0){
//        [cell xc_SetCornerWithSideType:XCSideTypeTopLine cornerRadius:5.0];
//    }
//    if((indexPath.section == 0 && indexPath.row == 3) || (indexPath.section == 1 && indexPath.row == 1)){
//        [cell xc_SetCornerWithSideType:XCSideTypeBottomLine cornerRadius:5.0];
//    }
//    if((indexPath.section == 0 && indexPath.row==3) || (indexPath.section == 1 && indexPath.row==1)){
//        cell.separatorInset = UIEdgeInsetsMake(0, 0, 0, cell.bounds.size.width);
//    }
//    
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"测试CELL%ld",(long)indexPath.row];
    // Configure the cell...
    GGT_SettingTableViewCell *cell = [GGT_SettingTableViewCell cellWithTableView:tableView forIndexPath:indexPath];
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
@end
