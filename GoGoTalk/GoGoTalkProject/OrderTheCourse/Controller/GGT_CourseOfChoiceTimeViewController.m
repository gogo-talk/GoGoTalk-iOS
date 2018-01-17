//
//  GGT_CourseOfChoiceTimeViewController.m
//  GoGoTalk
//
//  Created by XieHenry on 2018/1/16.
//  Copyright © 2018年 XieHenry. All rights reserved.
//

#import "GGT_CourseOfChoiceTimeViewController.h"
#import "GGT_ChoiceTimeOfSexCell.h"
#import "GGT_ChoiceTimeOfDateCell.h"
#import "GGT_ChoiceTimeOfTimeCell.h"


@interface GGT_CourseOfChoiceTimeViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation GGT_CourseOfChoiceTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
    self.navigationItem.title = @"选择时间";
    [self setLeftItem:@""];
    [self setRightButtonWithImg:@"guanbi_xuanzekejian"];

    [self initTableView];

}


- (void)initTableView {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:(UITableViewStylePlain)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UICOLOR_FROM_HEX(ColorFFFFFF);
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
    if (indexPath.row == 0) {
        static NSString *cellStr = @"GGT_ChoiceTimeOfSexCell";
        GGT_ChoiceTimeOfSexCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell= [[GGT_ChoiceTimeOfSexCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
        
    } else if (indexPath.row == 1) {
        static NSString *cellStr = @"GGT_ChoiceTimeOfDateCell";
        GGT_ChoiceTimeOfDateCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell= [[GGT_ChoiceTimeOfDateCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
        
    } else if (indexPath.row == 2) {
        static NSString *cellStr = @"GGT_ChoiceTimeOfTimeCell";
        GGT_ChoiceTimeOfTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell= [[GGT_ChoiceTimeOfTimeCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
        
    } else if (indexPath.row == 3) {
        static NSString *cellStr = @"UITableViewCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellStr];
        if (!cell) {
            cell= [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:cellStr];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        
        UIButton *finishButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
        finishButton.frame =CGRectMake((SCREEN_WIDTH()-LineW(180))/2, LineY(15), LineW(180), LineH(40));
        [finishButton setTitle:@"确 定" forState:(UIControlStateNormal)];
        finishButton.titleLabel.font = Font(17);
        [finishButton setTitleColor:UICOLOR_FROM_HEX(ColorEA5851) forState:(UIControlStateNormal)];
        [finishButton addTarget:self action:@selector(finishButtonClick) forControlEvents:(UIControlEventTouchUpInside)];
        [finishButton xc_SetCornerWithSideType:XCSideTypeAll cornerRadius:LineH(20)];
        [finishButton addBorderForViewWithBorderWidth:LineW(1) BorderColor:UICOLOR_FROM_HEX(ColorEA5851) CornerRadius:LineH(20)];
        [cell.contentView addSubview:finishButton];
        
        
        return cell;
    }
    
    return nil;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return LineH(88);
    } else if (indexPath.row == 1) {
        return LineH(132);
    } else if (indexPath.row == 2) {
        return LineH(300);
    } else if (indexPath.row == 3) {
        return LineH(70);
    }
    return 0.001;
}



- (void)finishButtonClick {
    
}


- (void)rightAction {
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
