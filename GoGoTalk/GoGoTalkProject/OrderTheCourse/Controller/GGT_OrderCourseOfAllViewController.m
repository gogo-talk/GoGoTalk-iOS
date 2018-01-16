//
//  GGT_OrderCourseOfAllViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/5/2.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_OrderCourseOfAllViewController.h"
#import "GGT_OrderForeignListCell.h"
#import "GGT_DetailsOfTeacherViewController.h"
#import "GGT_CourseOfChoiceTimeViewController.h"
#import "GGT_AllWithNoDateView.h"


@interface GGT_OrderCourseOfAllViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic,strong) GGT_AllWithNoDateView *allWithNoDateView;

@end

@implementation GGT_OrderCourseOfAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);

    //头部时间选择
    [self initHeaderView];

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
        make.top.equalTo(self.view.mas_top).with.offset(LineY(49));
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-0);
    }];
    
    
    
    
//    _allWithNoDateView = [[GGT_AllWithNoDateView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT()-49-64-LineH(54))];
//    [_tableView addSubview:_allWithNoDateView];
//    _allWithNoDateView.hidden = YES;
    
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
     





#pragma mark 选择日期
- (void)selectBtnClick {
    GGT_CourseOfChoiceTimeViewController *vc = [[GGT_CourseOfChoiceTimeViewController alloc] init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma headerView
- (void)initHeaderView {
    UIView *headerbgView = [[UIView alloc]init];
    headerbgView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    [self.view addSubview:headerbgView];
    
    [headerbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(0);
        make.right.equalTo(self.view.mas_right).with.offset(-0);
        make.top.equalTo(self.view.mas_top).with.offset(0);
        make.height.mas_equalTo(LineH(49));
    }];
    
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    headerView.layer.masksToBounds = YES;
    headerView.layer.cornerRadius = LineH(14.5);
    [headerbgView addSubview:headerView];
    
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).with.offset(LineX(10));
        make.right.equalTo(self.view.mas_right).with.offset(-LineX(10));
        make.top.equalTo(self.view.mas_top).with.offset(LineY(10));
        make.height.mas_equalTo(LineH(29));
    }];
    
    
    UIImageView *leftImgView = [[UIImageView alloc]init];
    leftImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [headerView addSubview:leftImgView];
    
    [leftImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerView.mas_left).with.offset(LineX(15));
        make.centerY.equalTo(headerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(LineW(15), LineW(15)));
    }];
    
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"12月18日 （周一） 10：30";
    titleLabel.font = Font(14);
    titleLabel.textColor = UICOLOR_FROM_HEX(Color666666);
    [headerView addSubview:titleLabel];
    
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftImgView.mas_right).with.offset(LineX(10));
        make.centerY.equalTo(headerView.mas_centerY);
        make.height.mas_equalTo(LineH(20));
    }];
    
    UIImageView *entImgView = [[UIImageView alloc] init];
    entImgView.backgroundColor = UICOLOR_RANDOM_COLOR();
    [headerView addSubview:entImgView];
    
    [entImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headerView.mas_right).with.offset(-LineX(15));
        make.centerY.equalTo(headerView.mas_centerY);
        make.size.mas_equalTo(CGSizeMake(LineW(20), LineW(20)));
    }];
    
    
    //底部的分割线
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [headerbgView addSubview:lineView];
    
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headerbgView.mas_left).with.offset(LineX(10));
        make.right.equalTo(headerbgView.mas_right).with.offset(-0);
        make.bottom.equalTo(headerbgView.mas_bottom).with.offset(-0);
        make.height.mas_equalTo(LineH(0.5));
    }];
    
    UIControl *selectBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [selectBtn addTarget:self action:@selector(selectBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [headerView addSubview:selectBtn];
    
    [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(headerView);
    }];
}

/* //当前是周几
 NSDate*date = [NSDate date];
 NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init] ;
 [dateFormatter setDateFormat:@"EEEE"];
 NSString *weekStr = [dateFormatter stringFromDate:date];
 
 //当前是什么时间
 NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
 [formatter setDateFormat:@"HH:mm"];
 NSDate *datenow = [NSDate date];
 NSString *currentTimeString = [formatter stringFromDate:datenow];
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
