//
//  GGT_ClassUnFinishedViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/2/1.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_ClassUnFinishedViewController.h"
#import "GGT_ClassUnFinishedListCell.h"

@interface GGT_ClassUnFinishedViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end


@implementation GGT_ClassUnFinishedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initTableView];
    
    @weakify(self);
    self.tableView.mj_header = [XCNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.dataArray = [NSMutableArray array];
        [self getLoadData];
    }];
    [self.tableView.mj_header beginRefreshing];
    
    
    //设置自动切换透明度(在导航栏下面自动隐藏)
    //_tableView.mj_header.automaticallyChangeAlpha = YES;
    self.tableView.mj_footer = [XCNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        [self.tableView.mj_footer endRefreshing];
    }];
    
}

- (void)getLoadData {
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
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
    static NSString *cellStr = @"GGT_ClassUnFinishedListCell";
    GGT_ClassUnFinishedListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell= [[GGT_ClassUnFinishedListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 124;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
