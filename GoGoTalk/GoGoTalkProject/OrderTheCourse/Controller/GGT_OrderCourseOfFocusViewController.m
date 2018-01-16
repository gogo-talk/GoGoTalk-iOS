//
//  GGT_OrderCourseOfFocusViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderCourseOfFocusViewController.h"
#import "GGT_OrderForeignListCell.h"
#import "GGT_DetailsOfTeacherViewController.h"

@interface GGT_OrderCourseOfFocusViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation GGT_OrderCourseOfFocusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

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
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
}


#pragma mark tableview的代理
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"cell";
    GGT_OrderForeignListCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell= [[GGT_OrderForeignListCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    /****预约***/
    [cell.orderButton addTarget:self action:@selector(orderButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    /****关注***/
    [cell.focusButton addTarget:self action:@selector(focusButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    
    return cell;
    
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(84);
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GGT_DetailsOfTeacherViewController *vc = [[GGT_DetailsOfTeacherViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark   预约
- (void)orderButtonClick {
    
}


#pragma mark   关注
- (void)focusButtonClick {
    NSLog(@"关注");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
