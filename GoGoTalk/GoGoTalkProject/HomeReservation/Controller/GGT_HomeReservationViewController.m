//
//  GGT_HomeReservationViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2017/4/26.
//  Copyright © 2017年 XieHenry. All rights reserved.
//

#import "GGT_HomeReservationViewController.h"
#import "GGT_MineViewController.h"
#import <SDWebImageManager.h>
#import "UIImage+GIF.h"

@interface GGT_HomeReservationViewController () <UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation GGT_HomeReservationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UICOLOR_RANDOM_COLOR();
    
    self.navigationItem.title = @"GoGoTalk";
    //左侧个人中心按钮
    [self initMineController];
    
    [self setRightBarButtonItemTitle:@"客服"];
    
    [self initTableView];

}




- (void)initTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
//    self.tableView.rowHeight = UITableViewAutomaticDimension;
//    self.tableView.estimatedRowHeight = 44.0;
    
    
    NSArray *a1 = @[@"1"];
    NSArray *a2 = @[@"2"];
    NSArray *a3 = @[@"3",@"3",@"3",@"3",@"3",@"3"];

    self.dataArray = [NSMutableArray arrayWithObjects:a1,a2,a3, nil];
    [self.tableView reloadData];
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellStr = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
    if (!cell) {
        cell= [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
    }
    cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
    cell.backgroundColor = UICOLOR_RANDOM_COLOR();
    return cell;
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray[section] count] ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        
        return 100;
    } else if (indexPath.section == 1) {
        
        return 200;
    } else {
        
        return 60;
    }
}

- (void)rightAction {
    LOSAlert(@"400-8787-276");
}




@end
