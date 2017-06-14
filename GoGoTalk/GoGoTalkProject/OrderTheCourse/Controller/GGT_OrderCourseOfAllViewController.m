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
#import "GGT_ConfirmBookingAlertView.h"
#import "GGT_SelectCoursewareViewController.h"

@interface GGT_OrderCourseOfAllViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation GGT_OrderCourseOfAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initHeaderView];
  
    [self initTableView];
    
    [self getLoadData];
}

- (void)getLoadData {
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8", nil];
    [self.tableView reloadData];
}


- (void)initTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, LineY(54), SCREEN_WIDTH(), SCREEN_HEIGHT()-49-64-LineH(54)) style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [self.view addSubview:self.tableView];
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
//    return 1;

}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return LineH(70);
    //如果没有数据，就展示这个高度
//    return self.tableView.height;
}



 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GGT_DetailsOfTeacherViewController *vc = [[GGT_DetailsOfTeacherViewController alloc]init];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark   预约
- (void)orderButtonClick {
    UIView *bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH(), SCREEN_HEIGHT())];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0.5;
    [self.view.window addSubview:bgView];
    
    GGT_ConfirmBookingAlertView *alertView = [[GGT_ConfirmBookingAlertView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH()-LineW(277))/2, (SCREEN_HEIGHT()-LineH(327))/2, LineW(277), LineH(327))];
    
    __weak GGT_ConfirmBookingAlertView *weakview = alertView;
    alertView.buttonBlock = ^(UIButton *button) {
        switch (button.tag) {
            case 800:
                //关闭
                [bgView removeFromSuperview];
                [weakview removeFromSuperview];
                break;
            case 801:
            {
                [bgView removeFromSuperview];
                [weakview removeFromSuperview];
                
                //更换课件
                GGT_SelectCoursewareViewController *vc = [[GGT_SelectCoursewareViewController alloc]init];
                vc.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }
                break;
            case 802:
                //确认
                [bgView removeFromSuperview];
                [weakview removeFromSuperview];
                break;
            
            default:
                break;
        }
        
        
        
    };
    
    [self.view.window addSubview:alertView];

    
}
     
     
#pragma mark   关注
- (void)focusButtonClick {
    NSLog(@"关注");

    
}
     

     
     

#pragma headerView
- (void)initHeaderView {
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    
    UIView *headerView = [[UIView alloc]init];
    headerView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    headerView.frame = CGRectMake(0, LineY(10), SCREEN_WIDTH(), LineH(44));
    [self.view addSubview:headerView];
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(LineX(15), 0, SCREEN_WIDTH()-LineW(37), LineH(44))];
    titleLabel.text = @"今天（星期一） 14：00";
    titleLabel.font = Font(15);
    titleLabel.textColor = UICOLOR_FROM_HEX(kThemeColor);
    [headerView addSubview:titleLabel];
    
    UIImageView *entImgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH()-LineW(22), LineY(16), LineW(7), LineH(12))];
    entImgView.image = UIIMAGE_FROM_NAME(@"jinru_yueke_shijianshaixuan");
    [headerView addSubview:entImgView];
    
    
    //底部的分割线
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(LineX(10), LineY(43.5), SCREEN_WIDTH()-LineW(10), LineH(0.5))];
    lineView.backgroundColor = UICOLOR_FROM_HEX(ColorF2F2F2);
    [headerView addSubview:lineView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
