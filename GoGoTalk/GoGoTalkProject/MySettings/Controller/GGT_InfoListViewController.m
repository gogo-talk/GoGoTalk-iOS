//
//  GGT_InfoListViewController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/5.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_InfoListViewController.h"
#import "GGT_InfoListCell.h"
#import "GGT_EditUserInfoController.h"
#import "GGT_EditAgeSexController.h"
@interface GGT_InfoListViewController()
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *cellArray1;
@property(nonatomic, strong) NSArray *cellArray2;
@property(nonatomic, strong) NSArray *cellArray3;
@end
@interface GGT_InfoListViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation GGT_InfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(0xf2f2f2);
    [self setNavigationStyle];
    [self createTableView];
    NSMutableArray *mArray1 = [NSMutableArray array];
    NSDictionary *dic1 = @{@"title":@"英文名",@"subtitle":@"Toni"};
    NSDictionary *dic2 = @{@"title":@"中文名",@"subtitle":@"可可"};
    NSDictionary *dic3 = @{@"title":@"年龄",@"subtitle":@"8岁"};
    NSDictionary *dic4 = @{@"title":@"性别",@"subtitle":@"女"};
    [mArray1 addObject:dic1];
    [mArray1 addObject:dic2];
    [mArray1 addObject:dic3];
    [mArray1 addObject:dic4];
    self.cellArray1 = mArray1;
    NSMutableArray *mArray2 = [NSMutableArray array];
    NSDictionary *dic5 = @{@"title":@"手机号",@"subtitle":@"13800138000"};
    NSDictionary *dic6 = @{@"title":@"父母称呼",@"subtitle":@"可可妈"};
    [mArray2 addObject:dic5];
    [mArray2 addObject:dic6];
    self.cellArray2 = mArray2;
    NSMutableArray *mArray3 = [NSMutableArray array];
    NSDictionary *dic7 = @{@"title":@"修改密码",@"subtitle":@""};
    [mArray3 addObject:dic7];
    self.cellArray3 = mArray3;
}
-(void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
    [self.tableView registerClass:[GGT_InfoListCell class] forCellReuseIdentifier:@"listCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.scrollEnabled = NO;
    //self.tableView.separatorColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(LineY(10));
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(0);
        //make.bottom.mas_equalTo(self.view.mas_bottom);
        make.height.mas_equalTo(LineH(328));
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(void)setNavigationStyle
{
    self.navigationItem.title = @"个人信息";
    //创建图标按钮，并且禁止渲染图片为默认蓝色
    UIBarButtonItem *imageItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"fanhui_top"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  style:UIBarButtonItemStyleDone target:self action:@selector(leftItemAction)];
    //创建FixedSpace。用来控制上面按钮位置
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //设置negativeSpacer的宽度
    negativeSpacer.width = -5;
    self.navigationItem.leftBarButtonItems = @[negativeSpacer,imageItem];
}
-(void)leftItemAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -- tableViewDelegate & tableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0){
        return 4;
    }else if(section == 1){
        return 2;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGT_InfoListCell *cell = [GGT_InfoListCell cellWithTableView:tableView forIndexPath:indexPath];
    if(cell == nil){
        cell = [[GGT_InfoListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listCell"];
    }
    if(indexPath.section == 0){
        cell.infoDic = self.cellArray1[indexPath.row];
    }
    if(indexPath.section == 1){
        cell.infoDic = self.cellArray2[indexPath.row];
    }
    if(indexPath.section == 2){
        cell.infoDic = self.cellArray3[indexPath.row];
    }
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0 && (indexPath.row == 0 || indexPath.row == 1)){
        GGT_EditUserInfoController *evc = [GGT_EditUserInfoController new];
        evc.titleName = self.cellArray1[indexPath.row][@"title"];
        [self.navigationController pushViewController:evc animated:YES];
    }
    if(indexPath.section==0 && (indexPath.row == 2 || indexPath.row == 3)){
        GGT_EditAgeSexController *evc = [GGT_EditAgeSexController new];
        evc.titleName = self.cellArray1[indexPath.row][@"title"];
        if(indexPath.row == 2){
            evc.prompt = @"请选择年龄";
        }
        if(indexPath.row == 3){
            evc.prompt = @"请选择性别";
        }
        [self.navigationController pushViewController:evc animated:YES];
    }
    
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
@end
