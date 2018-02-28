//
//  GGT_ClassDetailViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/27.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassFinishedDetailViewController.h"
#import "GGT_ClassFinishedDetailCell.h"

@interface GGT_ClassFinishedDetailViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation GGT_ClassFinishedDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.navigationItem.title = @"课程详情";
    
    self.dataArray = [NSMutableArray array];
    [self initTableView];
    [self getLoadData];

}

- (void)getLoadData {
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6", nil];
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

- (void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    self.tableView.showsVerticalScrollIndicator = false;
    self.tableView.showsHorizontalScrollIndicator = false;
    
    self.tableView.estimatedRowHeight = 100; //  随便设个值
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(10);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}

#pragma mark tableview的代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"GGT_ClassFinishedDetailCell";
    GGT_ClassFinishedDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell= [[GGT_ClassFinishedDetailCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    //布局UI变化
    [cell freshUICell:indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 115;
    } else if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3 || indexPath.row == 4) {
        return LineH(49);
    } else {
        return UITableViewAutomaticDimension;
    }
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

