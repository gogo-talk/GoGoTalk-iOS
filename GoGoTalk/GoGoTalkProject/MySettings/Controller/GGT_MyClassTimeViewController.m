//
//  GGT_MyClassTimeViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/15.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_MyClassTimeViewController.h"
#import "GGT_MyClassTimeHeaderCell.h"
#import "GGT_MyClassTimeCell.h"

@interface GGT_MyClassTimeViewController () <UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSArray *leftTitleArray;
@end

@implementation GGT_MyClassTimeViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"我的课时";
    
    
    [self createTableView];
    [self getLoadData];
}


- (void)getLoadData {
    NSArray *array0 = @[@""];
    NSArray *array1 = @[@"购买课时",@"赠送课时"];
    NSArray *array2 = @[@"返还课时",@"约课",@"取消课程",@"购买课时",@"赠送课时",@"家长称呼",@"所在地"];
    
    self.leftTitleArray = [NSMutableArray array];
    self.leftTitleArray = [NSMutableArray arrayWithObjects:array0,array1,array2, nil];
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

#pragma mark -- tableViewDelegate & tableViewDatasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.leftTitleArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.leftTitleArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        static NSString *cellStr = @"GGT_MyClassTimeHeaderCell";
        GGT_MyClassTimeHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if(cell == nil){
            cell = [[GGT_MyClassTimeHeaderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    } else  {
        static NSString *cellStr = @"GGT_MyClassTimeCell";
        GGT_MyClassTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if(cell == nil){
            cell = [[GGT_MyClassTimeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        cell.leftLabel.text = [[self.leftTitleArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row];
        cell.centerLabel.text = @"+1";
        cell.rightLabel.text = [[self.leftTitleArray safe_objectAtIndex:indexPath.section] safe_objectAtIndex:indexPath.row];
        
        
        
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return LineH(105);
    } else if (indexPath.section == 1){
        return LineH(49);
    }else if (indexPath.section == 2){
        return LineH(49);
    }
    return 0.01;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 0.001;
    } else {
        return LineH(10);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableView.width, LineY(10))];
        headerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
        return headerView;
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
