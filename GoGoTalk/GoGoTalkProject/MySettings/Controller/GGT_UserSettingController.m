//
//  GGT_UserSettingController.m
//  GoGoTalk
//
//  Created by 何建新 on 2017/5/8.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_UserSettingController.h"
#import "GGT_InfoListCell.h"
#import "GGT_AboutUsController.h"
#import "GGT_LoginViewController.h"

@interface GGT_UserSettingController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *leftTitleArray;
@end

@implementation GGT_UserSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"设置";

    [self createTableView];
    [self getLoadData];
}

- (void)getLoadData {
     self.leftTitleArray = @[@[@"推送通知",@"清除缓存",@"软件版本",@"前往AppStore评分"],@[@"关于我们"]];
    [self.tableView reloadData];
}


-(void)createTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}


#pragma mark -- tableViewDelegate,tableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.leftTitleArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.leftTitleArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"GGT_UserSettingCell";
    GGT_InfoListCell *cell= [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (cell == nil) {
        cell = [[GGT_InfoListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.enterImgView.hidden = YES;
            
            UISwitch *swicthView = [[UISwitch alloc] initWithFrame:CGRectMake(_tableView.width-LineW(72), LineY(8.5), LineW(51), LineH(31))];
            swicthView.on = YES;
            //设置开关开启状态时的颜色
            swicthView.onTintColor = UICOLOR_FROM_HEX(ColorEA5851);
            [swicthView addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
            [cell addSubview:swicthView];
            
        } else if (indexPath.row == 1) {
            //计算缓存大小
            cell.rightLabel.text = [NSString stringWithFormat:@"%.2fM",[self folderSize]];
            
        } else if (indexPath.row == 2) {
            cell.enterImgView.hidden = YES;

            //更新坐标
            [cell.rightLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(cell.contentView.mas_right).with.offset(-LineX(20));
                make.centerY.equalTo(cell.contentView.mas_centerY);
                make.height.mas_offset(LineH(22));
            }];
            
            
            [cell.enterImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.right.equalTo(cell.contentView.mas_right).with.offset(-LineX(0));
                make.centerY.equalTo(cell.contentView.mas_centerY);
                make.size.mas_offset(CGSizeMake(LineW(0), LineH(0)));
            }];
            
            
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            // app版本
            NSString *app_Version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
            cell.rightLabel.text = [NSString stringWithFormat:@"V%@",app_Version];
        }
    }
    
    cell.leftLabel.text = [[self.leftTitleArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row];

    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(49);
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return LineH(10);
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 1) {
        return LineH(105);
    }
    return 0.001;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, LineY(10))];
    headerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    return headerView;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 1) {
            //刷新cell数据，保持两个数量相等
            NSIndexPath *indexPath=[NSIndexPath indexPathForRow:1 inSection:0];
            [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationNone];
            
            
            //清除缓存
            NSString *messageStr = [NSString stringWithFormat:@"当前应用缓存%.2fM，清除减少占用空间，保留提高加载速度",[self folderSize]];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:messageStr preferredStyle:UIAlertControllerStyleAlert];
            alert.titleColor = UICOLOR_FROM_HEX(0x000000);
            
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"保留" style:UIAlertActionStyleCancel handler:nil];
            cancelAction.textColor = UICOLOR_FROM_HEX(Color777777);
            
            UIAlertAction *clernAction = [UIAlertAction actionWithTitle:@"清除" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [self removeCache];
            }];
            clernAction.textColor = UICOLOR_FROM_HEX(ColorEA5851);

            [alert addAction:cancelAction];
            [alert addAction:clernAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    } else if (indexPath.section == 1) {
            GGT_AboutUsController *us = [GGT_AboutUsController new];
            [self.navigationController pushViewController:us animated:YES];
    }
}



-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if(section == 1) {
        UIView *footView = [[UIView alloc] init];
        footView.backgroundColor = [UIColor clearColor];
        UIButton *btn = [[UIButton alloc] init];
        [btn setTitle:@"退出登录" forState:UIControlStateNormal];
        [btn setTitleColor:UICOLOR_FROM_HEX(0xea5851) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginOutClick) forControlEvents:(UIControlEventTouchUpInside)];
        [footView addSubview:btn];
        
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(footView.mas_top).with.offset(30);
            make.centerX.equalTo(footView.mas_centerX);
            make.width.mas_equalTo(LineW(313));
            make.height.mas_equalTo(LineH(45));
        }];
        [btn addBorderForViewWithBorderWidth:1.0 BorderColor:UICOLOR_FROM_HEX(kThemeColor) CornerRadius:LineH(44)/2.0];
        return footView;
    }
    return nil;
}

#pragma mark 通知开关---以及判断
-(void)switchAction:(UISwitch *)sender {

}

#pragma mark 计算缓存大小
// 缓存大小
- (CGFloat)folderSize{
    CGFloat folderSize = 0.0;
    
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //获取所有文件的数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    
    NSLog(@"文件地址：%@",cachePath);
    
    for(NSString *path in files) {
        
        NSString *filePath = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",path]];
        
        //累加
        folderSize += [[NSFileManager defaultManager]attributesOfItemAtPath:filePath error:nil].fileSize;
    }
    //转换为M为单位
    CGFloat sizeM = folderSize /1024.0 /1024.0;
    
    return sizeM;
}

#pragma mark 清除缓存
- (void)removeCache{
    //获取路径
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES)firstObject];
    
    //返回路径中的文件数组
    NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachePath];
    for(NSString *p in files){
        NSError *error;
        
        NSString *path = [cachePath stringByAppendingString:[NSString stringWithFormat:@"/%@",p]];
        
        if([[NSFileManager defaultManager]fileExistsAtPath:path]) {
            BOOL isRemove = [[NSFileManager defaultManager]removeItemAtPath:path error:&error];
            if(isRemove) {
                
                GGT_InfoListCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
                cell.rightLabel.text = [NSString stringWithFormat:@"0.0M"];
                
            } else {
                //[MBProgressHUD showMessage:@"清除失败" toView:self.view];
            }
        }
    }
}


- (void)loginOutClick {
    GGT_LoginViewController *loginVc = [[GGT_LoginViewController alloc]init];
    BaseNavigationController *nav = [[BaseNavigationController alloc]initWithRootViewController:loginVc];
    self.view.window.rootViewController = nav;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
